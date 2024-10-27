import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quizapp/helper/Auth_services.dart';

import '../helper/get_userdata_services.dart';
import '../model/userdataModel/userdata_Model.dart';


class Auth_controller extends GetxController{
  GetUserdataServices userdataService = GetUserdataServices();
  // signin page text field
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPwd = TextEditingController();


  // signup page text field
  TextEditingController txtUsername = TextEditingController();
  TextEditingController txtCreateMail = TextEditingController();
  TextEditingController txtCreatePwd = TextEditingController();

  // show password in signIn page
  RxBool isShowPwd = false.obs;

  void showPassword()
  {
    isShowPwd.value = !isShowPwd.value;
    update();
  }

  // google and firebase current User
  RxString email = ''.obs;
  RxString name = ''.obs;
  RxString url = ''.obs;

  Future<void> getUserDetails() async {
    User? user = GoogleFirebaseServices.googleFirebaseServices.currentUser();
    if (user != null) {
      email.value = user.email!;
      url.value = user.photoURL!;
      name.value = user.displayName!;
    }
  }


  // get user data by cloud
  Future<Map<String, dynamic>> getUser(String email) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    try {
      DocumentSnapshot data = await firestore.collection('user').doc(email).get();

      if (data.exists) {
        return data.data() as Map<String, dynamic>;
      } else {
        log('Document does not exist');
        return {};
      }
    } catch (e) {
      log('Error fetching user data: $e');
      return {};
    }
  }


  getCurrentUser(){
    return GoogleFirebaseServices.googleFirebaseServices.auth.currentUser;
  }

  // google and firebase email id logout

  void emailLagout() {
    GoogleFirebaseServices.googleFirebaseServices.emailLogout();
  }

  // email and pwd validation
  RxString error = ''.obs;
  RxString pwd = ''.obs;

  Future<void> validateInputs(TextEditingController txtEmail,
      TextEditingController txtPwd) async {
    error.value = validateEmail(txtEmail.text) ?? '';
    pwd.value = validatePassword(txtPwd.text) ?? '';
    log('${error.isEmpty && pwd.isEmpty}');

    update();
  }


  // email formated validation

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter email!';
    }

    // General email regex pattern
    String pattern =
        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    RegExp regex = RegExp(pattern);

    if (!regex.hasMatch(value)) {
      return 'Invalid email format!';
    }

    // Additional specific domain check for Gmail
    if (!value.endsWith('@gmail.com')) {
      return 'Invalid domain name! Only Gmail is accepted.';
    }

    return null;
  }

  // password validation

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter a strong password!';
    }

    // Regular expression to check for a strong password
    String pattern =
        r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#\$&*~]).{8,32}$';
    RegExp regex = RegExp(pattern);

    if (!regex.hasMatch(value)) {
      return 'Password must be 8-32 characters long, include uppercase, lowercase, number, and special character.';
    }

    return null;
  }


  Future<void> fetchUserData() async {
    var userEmail = GoogleFirebaseServices.googleFirebaseServices.auth.currentUser?.email;

    if (userEmail != null) {
      UserdataModel? userData = await userdataService.getUserData(userEmail);
      if (userData != null) {
        print("User Data Retrieved: ${userData.email}, Score: ${userData.quizScore}");
      } else {
        print("No data found for the user.");
      }
    } else {
      print("User is not authenticated.");
    }
  }

}