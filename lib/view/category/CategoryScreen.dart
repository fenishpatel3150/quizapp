import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:quizapp/controller/QuizController.dart';
import 'package:quizapp/view/Start/QuizStartScreen.dart';


class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    QuizController quizController = Get.find();
    return Scaffold(
      backgroundColor: const Color(0xff6a5ae0),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding:  EdgeInsets.only(top: 40.h,bottom: 20.h,left: 10.h),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    )),
                SizedBox(width: 60.h,),
                Center(
                  child: Text(
                    'Category',
                    style: TextStyle(color: Colors.white, fontSize: 25.sp),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
                // height: 650.h,
                width: 400.h,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20.r),
                        topLeft: Radius.circular(20.r))),
                child: ListView.builder(
                  // shrinkWrap: true,
                  itemCount: quizController.quizList.length,
                  itemBuilder: (context, index) {
                    log(quizController.quizList.length.toString());
                    return ListTile(
                        minVerticalPadding: 20.r,
                        leading: Image.asset(
                            quizController.quizList[index].image),
                        title: Text(
                          quizController.quizList[index].category,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 16.sp),
                        ),
                        subtitle: Text(
                          quizController.quizList[index].quiz,
                          style: const TextStyle(color: Colors.grey),
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            quizController.onlyOneCategory(index);
                            Get.to(()=>const QuizStartScreen()
                                ,arguments: index, transition: Transition.downToUp);
                          },
                          icon: const Icon(
                            Icons.arrow_forward_ios,
                            color: Color(0xff9b93e8),
                          ),
                        ));
                  }
                )),
          ),
        ],
      ),
    );
  }
}

