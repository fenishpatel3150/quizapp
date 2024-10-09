import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:quizapp/controller/QuizController.dart';
import 'package:quizapp/view/category/CategoryScreen.dart';
import 'package:quizapp/view/quiz/QuizScreen.dart';
import 'package:quizapp/view/second/SecondScreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    QuizController quizController = Get.find();
    return Scaffold(
      backgroundColor: Color(0xff6a5ae0),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20.h, top: 40.h),
              child: ListTile(
                title: Row(
                  children: [
                    Icon(
                      CupertinoIcons.sun_max,
                      color: Color(0xffffd6dd),
                    ),
                    Text(
                      'GOOD MORNING',
                      style: TextStyle(color: Color(0xffffd6dd)),
                    )
                  ],
                ),
                trailing: CircleAvatar(
                  child: Image(image: AssetImage('assets/image/Avatar.png')),
                ),
                subtitle: Text(
                  'Madelyn Dias',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.sp,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.sp),
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              height: 80.h,
              width: 300.h,
              decoration: BoxDecoration(
                color: Color(0xffffccd5),
                image: DecorationImage(
                    image: AssetImage('assets/image/Card.png'),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(20.r),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              height: 200.h,
              width: 300.h,
              decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                    image: AssetImage('assets/image/Card (1).png'),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(20.r),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Stack(
              children: [
                Container(
                  height: 550.h,
                  width: 500.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 30.h, left: 30.h),
                      child: Text(
                        'Live Quizzes',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.sp),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(CategoryScreen(),
                            transition: Transition.downToUp);
                      },
                      child: Padding(
                        padding: EdgeInsets.only(top: 30.h, right: 40.h),
                        child: Text(
                          'See all',
                          style: TextStyle(
                              color: Color(0xff6a5ae0),
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 80.h),
                      child: Container(
                        height: 80.h,
                        width: 300.h,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xff9b93e8)),
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: ListTile(
                          minVerticalPadding: 20.r,
                          leading: Image.asset(
                              '${quizController.quizList[0].image}'),
                          title: Text(
                            '${quizController.quizList[0].category}',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 16.sp),
                          ),
                          subtitle: Text(
                            'Math : 20 Quizzes',
                            style: TextStyle(color: Colors.grey),
                          ),
                          trailing:IconButton(onPressed: () {
                            Get.to(CategoryScreen());
                          }, icon:  Icon(
                            Icons.arrow_forward_ios,
                            color: Color(0xff9b93e8),
                          ),)
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.h),
                      child: Container(
                        height: 80.h,
                        width: 300.h,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xff9b93e8)),
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: ListTile(
                          minVerticalPadding: 20.h,
                          leading: Image.asset(
                              '${quizController.quizList[1].image}'),
                          title: Text(
                            '${quizController.quizList[1].category}',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 16.sp),
                          ),
                          subtitle: Text(
                            'Math : 20 Quizzes',
                            style: TextStyle(color: Colors.grey),
                          ),
                          trailing:IconButton(onPressed: () {
                            Get.to(CategoryScreen());
                          }, icon:  Icon(
                            Icons.arrow_forward_ios,
                            color: Color(0xff9b93e8),
                          ),)
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 30.h, left: 30.h),
                          child: Text(
                            'Friends',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.sp),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 30.h, right: 40.h),
                          child: Text(
                            'See all',
                            style: TextStyle(
                                color: Color(0xff6a5ae0),
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    ...List.generate(
                      details.length,
                      (index) => ListTile(
                        contentPadding: EdgeInsets.only(left: 25.h),
                        leading: Image.asset('${details[index]['image']}'),
                        title: Text(
                          '${details[index]['name']}',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          '${details[index]['subtitle']}',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

List details = [
  {
    'image': 'assets/image/Avatar (1).png',
    'name': 'Maren Workmen',
    'subtitle': '325 points',
  },
  {
    'image': 'assets/image/Avatar (2).png',
    'name': 'Brandon Matrovs',
    'subtitle': '124 points',
  },
  {
    'image': 'assets/image/Avatar (3).png',
    'name': 'Manuela Lipshutz',
    'subtitle': '437 points',
  }
];