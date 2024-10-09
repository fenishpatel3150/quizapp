import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:quizapp/view/LoginScreen/LoginScreen.dart';
import 'package:quizapp/view/LoginScreen/SignupScreen.dart';
import 'package:quizapp/view/home/componets/bottombar.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff6a5ae0),
      body: SingleChildScrollView(

        child: Column(
          children: [
            Padding(
              padding:  EdgeInsets.only(top: 50.h),
              child: Center(
                child: Container(
                  height: 150.h,
                  width: 150.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage('assets/image/quiz.png')),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h,),
            Container(
              height: MediaQuery.of(context).size.height/1.47,
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

                  SizedBox(height: 20.h,),
                  Container(
                    height: 50.h,
                    width: 300.h,
                    decoration: BoxDecoration(
                      color: Color(0xffededed),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child:  TextFormField(
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.r),
                          borderSide:  BorderSide(color: Color(0xffededed)),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.r),
                          borderSide:  BorderSide(color: Color(0xffededed)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.r),
                          borderSide:  BorderSide(color: Color(0xffededed)),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.r),
                          borderSide:  BorderSide(color: Color(0xffededed)),
                        ),
                        hintText: 'Email Id',
                        prefixIcon:  Padding(
                          padding: EdgeInsets.only(left: 10.h,),
                          child: Icon(Icons.email, color: Colors.grey),
                        ),
                        hintStyle: const TextStyle(color: Colors.grey),
                      ),
                      validator: (value) {
                        bool emailValidation = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value!);
                        if (value.isEmpty) {
                          return "Enter Email";
                        } else if (!emailValidation) {
                          return "Enter Valid Email";
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 20.h,),
                  Container(
                    height: 50.h,
                    width: 300.h,
                    decoration: BoxDecoration(
                      color: Color(0xffededed),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: TextFormField(
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
                          borderSide:  BorderSide(color: Color(0xffededed)),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.r),
                          borderSide:  BorderSide(color: Color(0xffededed)),
                        ),
                        hintText: 'Password',
                        prefixIcon:  Padding(
                          padding: EdgeInsets.only(left: 10.h),
                          child: Icon(Icons.lock, color: Colors.grey),
                        ),
                        hintStyle: const TextStyle(color: Colors.grey),

                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Password";
                        } else if (value.length < 6) {
                          return "Password length should be more than 6 characters";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(top: 8.h,left: 200.h),
                    child: Text('Forget Password ?',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 10.h),),
                  ),
                  SizedBox(height: 20.h,),
                  GestureDetector(
                    onTap: ()
                    {
                      Get.to(BottomBar(),transition: Transition.downToUp);
                    },
                    child: Container(
                        height: 50.h,
                        width: 300.h,
                        decoration: BoxDecoration(
                          color: Color(0xFFffcc00),
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child:Center(child: Text('Log In',style: TextStyle(color: Colors.black,fontSize: 15.h,fontWeight: FontWeight.bold),))
                    ),
                  ),
                  SizedBox(height: 20.h,),
                  Center(child: Text('Or',style: TextStyle(color: Colors.black,fontSize: 15.h,fontWeight: FontWeight.bold),)),
                  SizedBox(height: 20.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 50.h,
                        width: 50.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.h),
                            image: DecorationImage(image: AssetImage('assets/image/google.png'))
                        ),
                      ),
                      Container(
                        height: 50.h,
                        width: 50.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.h),
                            image: DecorationImage(image: AssetImage('assets/image/apple.png'))
                        ),
                      ),
                      Container(
                        height: 50.h,
                        width: 50.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.h),
                            image: DecorationImage(image: AssetImage('assets/image/facebook.png'))
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h,),
                  // Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account ?",
                        style: TextStyle(color: Colors.grey),
                      ),
                      TextButton(onPressed: (){

                        Get.to(SignUpScreen(),transition: Transition.downToUp);
                      }, child:   Text(
                        "Sign Up",
                        style: TextStyle(color: Color(0xFFffcc00)),
                      ), )
                    ],),
                  // Spacer(flex: 1,),


                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
