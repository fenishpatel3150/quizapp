import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:quizapp/controller/QuizController.dart';
import 'package:quizapp/view/quiz/QuizScreen.dart';

class QuizStartScreen extends StatelessWidget {
  const QuizStartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    QuizController quizController = Get.find();
      return Scaffold(
        backgroundColor: Color(0xff6a5ae0),
        body: Column(
          children: [
            Padding(
              padding:  EdgeInsets.only(top: 150.h),
              child: Center(
                child: Container(
                  height: 150.h,
                  width: 150.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage('assets/image/Nerd Face/0.png')),
                  ),
                ),
              ),
            ),
           SizedBox(height: 50.h,),
           Text.rich(
             TextSpan(
               children: [
                 TextSpan(
                   text: 'Ready for a ',
                   style: TextStyle(
                     color: Color(0xFFFCFCFC),
                     fontSize: 33.sp,
                     fontFamily: 'Satoshi',
                     fontWeight: FontWeight.w700,
                     height: 0.04.h,
                     letterSpacing: -0.99.h,
                   ),
                 ),

                 TextSpan(
                   text: 'Quiz?',
                   style: TextStyle(
                     color: Color(0xFFFCFCFC),
                     fontSize: 33.sp,
                     fontFamily: 'Satoshi',
                     fontWeight: FontWeight.w700,
                     height: 0.04.h,
                     letterSpacing: -0.99.h,
                   ),
                 ),
               ],
             ),
             textAlign: TextAlign.center,
           ),
            SizedBox(height: 25.h,),
            Text.rich(
              TextSpan(
                  children: [
              TextSpan(
              text: 'Gear up for a QuikQuiz sprint! You ve got just 30 seconds per question. Tap the info icon  at the top right to check out the module each question comes from. Lets see what youve got! - ',
              style: TextStyle(
              color: Colors.white70,
              fontSize: 15.sp,
                letterSpacing: -0.45.sp,
            ),
                        ),
                        TextSpan(
            text: 'Goodluck!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15.sp,
              fontFamily: 'Satoshi',
              fontWeight: FontWeight.w500,
              height: 0.11.sp,
              letterSpacing: -0.45.sp,
            ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
            Spacer(),
            Padding(
              padding:  EdgeInsets.only(bottom: 20.h),
              child: InkWell(
                onTap: ()
                {
                  Get.to(()=>QuizScreen(), transition: Transition.downToUp);
                },
                child: Container(
                  height: 50.h,
                  width: 300.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25.r),
                  ),
                  child: Center(
                    child: Text('Start A New Quiz',style: TextStyle(color:Color(0xff6a5ae0),fontWeight: FontWeight.bold,fontSize: 15.h ),),
                  ),
                ),
              ),
            )

          ],
        ),

      );
  }
}
