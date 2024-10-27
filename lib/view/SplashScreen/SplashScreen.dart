import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../helper/Auth_gate.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => AuthGate(),));
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
                image: DecorationImage(image: AssetImage('assets/image/QuikQuiz/0.png')),
              ),
            ),
          ),
         
        ],
      ),
    );
  }
}
