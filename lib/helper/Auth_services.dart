import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:quizapp/controller/Auth_controller.dart';
import 'package:quizapp/model/UserModel/UserModal.dart';

import '../view/LoginScreen/LoginScreen.dart';
import '../view/home/componets/bottombar.dart';


class UserService {
  static UserService userService = UserService._();
  UserService._();

  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  // Add a new user to Firestore
  Future<void> addUser(UserModal userModal) async {
    CollectionReference user = firebaseFirestore.collection('Users');
    await user.doc(userModal.email).set(userModal.objectToMap(userModal));
  }

  // Get users stream excluding current user
  Stream<QuerySnapshot<Object?>> getUser() {
    return firebaseFirestore
        .collection('Users')
        .where(
      'email',
      isNotEqualTo: GoogleFirebaseServices.googleFirebaseServices.currentUser()?.email,
    )
        .orderBy('quizScore', descending: true) // Order by quizScore in descending order
        .snapshots();
  }


  // Get reference to current user document
  DocumentReference<Object?> currentUser(UserModal userModal) {
    CollectionReference user = firebaseFirestore.collection('Users');
    return user.doc(userModal.email);
  }

  Future<bool> doesUserExist(String email) async {
    final userDoc = await FirebaseFirestore.instance
        .collection('users')
        .doc(email)
        .get();
    return userDoc.exists;
  }
}

class GoogleFirebaseServices {
  Auth_controller sign = Get.find();
  static GoogleFirebaseServices googleFirebaseServices =
  GoogleFirebaseServices._();
  GoogleFirebaseServices._();

  FirebaseAuth auth = FirebaseAuth.instance;
  GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Signup method
  Future<void> signUpPage({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      log("Sign Up Email: $email\nPassword: $password");

      UserCredential userCredential =
      await auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;

      if (user != null) {
        Map <String ,dynamic> userModal = {
          'username': name,
          'email': user.email,
          'photoUrl': user.photoURL,
          'mobile' : user.phoneNumber
        };

        UserModal newUser = UserModal(userModal);
        await UserService.userService.addUser(newUser);

        //await firestore.collection('Users').doc(user.email).set(userModal);
        print("User created and data added to Firestore: ${user.email}");
        Get.to(LoginScreen());
      }
    } catch (e) {
      log("ERROR: $e");
    }
  }

  // Check if email exists
  Future<bool> checkEmailExists(String email) async {
    try {
      final signInMethods = await auth.fetchSignInMethodsForEmail(email);
      return signInMethods.isNotEmpty;
    } on FirebaseAuthException catch (e) {
      log(e.message ?? 'Firebase Auth Error');
      return false;
    } catch (e) {
      log('Unexpected error: $e');
      return false;
    }
  }

  // Signin method
  Future<void> signIn({String? email, String? pwd}) async {
    checkEmailExists(email!);
    try {
      await auth.signInWithEmailAndPassword(email: email!, password: pwd!);
      Get.offAndToNamed('/bottembar');
    } on FirebaseAuthException catch (e) {
      log(e.code);
      String msg = '';
      if (e.code == 'user-not-found' || e.code == "invalid-email") {
        msg = "No User Found for that Email";
      } else if (e.code == 'wrong-password' || e.code == 'invalid-credential') {
        msg = "Wrong Password Provided";
      } else if (e.code == 'channel-error') {
        msg = "Enter the email and password";
      }
      Fluttertoast.showToast(
          msg: msg,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.redAccent,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  // Logout method
  void emailLogout() {
    try {
      googleSignIn.signOut();
      auth.signOut();
    } catch (e) {
      log(e.toString());
    }
  }

  // Sign in with Google
  Future<String> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount!.authentication;

      AuthCredential authCredential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken,
      );

      final UserCredential userCredential =
      await auth.signInWithCredential(authCredential);
      final User? user = userCredential.user;
      bool userExists = await UserService.userService.doesUserExist(user!.email!);
      if (user != null) {
        if(!userExists){
          Map userModal = {
            'username': user.displayName,
            'email': user.email,
            'photoUrl': user.photoURL,
          };
          UserModal newUser = UserModal(userModal);
          await UserService.userService.addUser(newUser);
        }

      }

      return "Success";
    } catch (e) {
      log(e.toString());
      return e.toString();
    }
  }

  // Get current user
  User? currentUser() {
    User? user = auth.currentUser;
    if (user != null) {
      log("User info:\nEmail: ${user.email}\nName: ${user.displayName}\nPhone: ${user.phoneNumber}\nPhoto URL: ${user.photoURL}");
    }
    return user;
  }
}
