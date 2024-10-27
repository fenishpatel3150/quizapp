

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:quizapp/view/LoginScreen/LoginScreen.dart';

import '../../controller/Auth_controller.dart';
import '../../helper/Auth_services.dart';



class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Create an instance of Auth_Controller
    final Auth_controller authController = Get.put(Auth_controller());

    return Scaffold(
      backgroundColor: const Color(0xff6a5ae0),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 50.h),
              child: Center(
                child: Container(
                  height: 150.h,
                  width: 150.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage('assets/image/QuikQuiz/0.png')),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Container(
              height: MediaQuery.of(context).size.height / 1.47,
              width: 350.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.h),
                  topRight: Radius.circular(20.h),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: 20.h),
                  // Name Field
                  Container(
                    height: 50.h,
                    width: 300.h,
                    decoration: BoxDecoration(
                      color: const Color(0xffededed),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: TextFormField(
                      controller: authController.txtUsername, // Bind to the controller
                      style: const TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.r),
                          borderSide: BorderSide(color: Color(0xffededed)),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.r),
                          borderSide: BorderSide(color: Color(0xffededed)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.r),
                          borderSide: BorderSide(color: Color(0xffededed)),
                        ),
                        hintText: 'Enter your Name',
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(left: 10.h),
                          child: Icon(Icons.person, color: Colors.grey),
                        ),
                        hintStyle: const TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  // Email Field
                  Container(
                    height: 50.h,
                    width: 300.h,
                    decoration: BoxDecoration(
                      color: const Color(0xffededed),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: TextFormField(
                      controller: authController.txtCreateMail, // Bind to the controller
                      style: const TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.r),
                          borderSide: BorderSide(color: Color(0xffededed)),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.r),
                          borderSide: BorderSide(color: Color(0xffededed)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.r),
                          borderSide: BorderSide(color: Color(0xffededed)),
                        ),
                        hintText: 'Enter Your Email Id',
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(left: 10.h),
                          child: Icon(Icons.email, color: Colors.grey),
                        ),
                        hintStyle: const TextStyle(color: Colors.grey),
                      ),
                      // Validate Email if needed
                    ),
                  ),
                  SizedBox(height: 20.h),
                  // Password Field
                  Container(
                    height: 50.h,
                    width: 300.h,
                    decoration: BoxDecoration(
                      color: const Color(0xffededed),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: TextFormField(
                      controller: authController.txtCreatePwd, // Bind to the controller
                      style: const TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.r),
                          borderSide: const BorderSide(color: Color(0xffededed)),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.r),
                          borderSide: const BorderSide(color: Color(0xffededed)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.r),
                          borderSide: BorderSide(color: Color(0xffededed)),
                        ),
                        hintText: 'Enter Your Password',
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(left: 10.h),
                          child: Icon(Icons.lock, color: Colors.grey),
                        ),
                        hintStyle: const TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                  SizedBox(height: 40.h),
                  GestureDetector(
                    onTap: () async {
                      // Call the signup method from Auth_Controller
                      await authController.validateInputs(authController.txtCreateMail, authController.txtCreatePwd);
                      if (authController.error.isEmpty) {
                        try{
                          GoogleFirebaseServices.googleFirebaseServices.signUpPage(name:authController.txtUsername.text,email: authController.txtCreateMail.text.trim(),password: authController.txtCreatePwd.text );

                        } catch (e) {
                          Get.snackbar("Error",e.toString());
                        }

                      } else {
                        Get.snackbar('Error', authController.error.value);
                      }
                    },
                    child: Container(
                      height: 50.h,
                      width: 300.h,
                      decoration: BoxDecoration(
                        color: const Color(0xFFffcc00),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Center(
                        child: Text(
                          'Sign Up',
                          style: TextStyle(color: Colors.black, fontSize: 15.h, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Center(
                    child: Text(
                      'Or',
                      style: TextStyle(color: Colors.black, fontSize: 15.h, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  // Social Media Login Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () async {
                          String status = await GoogleFirebaseServices.googleFirebaseServices.signInWithGoogle();

                          Fluttertoast.showToast(msg: status);
                          if (status == 'Success') {
                            Get.offAndToNamed('/bottembar');

                          }
                        },
                        child: Container(
                          height: 50.h,
                          width: 50.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.h),
                            image: DecorationImage(image: AssetImage('assets/image/google/0.jpg')),
                          ),
                        ),
                      ),
                      Container(
                        height: 50.h,
                        width: 50.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.h),
                          image: DecorationImage(image: AssetImage('assets/image/apple/0.png')),
                        ),
                      ),
                      Container(
                        height: 50.h,
                        width: 50.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.h),
                          image: DecorationImage(image: AssetImage('assets/image/facebook/0.png')),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: TextStyle(color: Colors.grey),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.to(LoginScreen(), transition: Transition.downToUp);
                        },
                        child: Text(
                          "Log In",
                          style: TextStyle(color: Color(0xFFffcc00)),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
