import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:quizapp/controller/QuizController.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {

    QuizController quizController = Get.find();

    return Scaffold(
      backgroundColor: Color(0xff6a5ae0),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // Quiz Body
            Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 80.h),
                  child: Container(
                    height: 650.h,
                    width: 400.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20.r),
                        topLeft: Radius.circular(20.r),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Category Title
                        Padding(
                          padding: EdgeInsets.only(top: 60.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '${quizController.quizList[quizController.currentCategoryIndex.value].category}',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                        // Quiz Question
                        Padding(
                          padding: EdgeInsets.only(top: 25.h, left: 20.h, right: 20.h),
                          child: Center(
                            child: Obx(
                                  () => Text(
                                '${quizController.quizList[quizController.currentCategoryIndex.value].questions[quizController.questionIndex.value].question}',
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        // Options List
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: quizController.quizList[quizController.currentCategoryIndex.value]
                              .questions[quizController.questionIndex.value].options.length,
                          itemBuilder: (context, index) => Center(
                            child: Padding(
                              padding: EdgeInsets.only(top: 15.h),
                              child: GestureDetector(
                                onTap: () {
                                  quizController.selectOption(index);
                                },
                                child: Obx(
                                      () => Container(
                                    height: 50.h,
                                    width: 300.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.r),
                                      border: Border.all(color: Color(0xff6a5ae0)),
                                      color: quizController.selectedIndex.value == index
                                          ? Color(0xff6a5ae0)
                                          : Colors.white,
                                    ),
                                    child: Center(
                                      child: Text(
                                        '${quizController.quizList[quizController.currentCategoryIndex.value].questions[quizController.questionIndex.value].options[index]}',
                                        style: TextStyle(fontSize: 18.sp,
                                          color: quizController.selectedIndex.value==index ? Colors.white:Colors.black,

                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 35.h),
                        // Next Question Button
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                quizController.nextQuestion();
                              },
                              child: Container(
                                height: 50.h,
                                width: 300.h,
                                decoration: BoxDecoration(
                                  color: Color(0xff6a5ae0),
                                  borderRadius: BorderRadius.all(Radius.circular(20.r)),
                                ),
                                child: Center(
                                  child: Text(
                                    'Next Question',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20.sp,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                // Quiz Image
                Padding(
                  padding: EdgeInsets.only(top: 50.h, left: 130.h),
                  child: Container(
                    height: 80.h,
                    width: 80.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(color: Color(0xff6a5ae0), blurRadius: 20),
                      ],
                      image: DecorationImage(
                        image: AssetImage(
                          '${quizController.quizList[quizController.currentCategoryIndex.value].image}',
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

int  dataIndex=0;