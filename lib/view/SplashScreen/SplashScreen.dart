import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:quizapp/view/LoginScreen/LoginScreen.dart';
import 'package:quizapp/view/LoginScreen/SignupScreen.dart';
import 'package:quizapp/view/home/HomeScreen.dart';
import 'package:quizapp/view/home/componets/bottombar.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 5), () {
      Get.to(LoginScreen());
    });
    return Scaffold(
      backgroundColor: Color(0xff6a5ae0),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: 150.h,
              width: 150.h,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/image/QuikQuiz.png')),
              ),
            ),
          ),
         
        ],
      ),
    );
  }
}
