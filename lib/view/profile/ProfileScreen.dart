import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff6a5ae0),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [

                Spacer(),
                Padding(
                  padding: EdgeInsets.only(top: 40.h, right: 15.h),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.settings, color: Colors.white),
                  ),
                ),
              ],
            ),
            Stack(
              children: [
                Padding(
                  padding: EdgeInsets.all(10.h),
                  child: Padding(
                    padding: EdgeInsets.only(top: 20.h),
                    child: Container(
                      height: 850.h,
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
                          SizedBox(height: 35.h),
                          // Next Question Button
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [],
                          ),
                          SizedBox(height: 20.h), // Add some spacing here
                          Padding(
                            padding: EdgeInsets.only(top: 180.h),
                            child: Container(
                              height: 550.h,
                              // Set a fixed height for the tab view
                              child: ContainedTabBarView(
                                tabs: [
                                  Text('Badge'),
                                  Text('Stats'),
                                  Text('Details'),
                                ],
                                views: [
                                  Column(
                                    children: [
                                      SizedBox(
                                        height: 25.h,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Image(
                                              image: AssetImage(
                                                  'assets/image/6.png')),
                                          Image(
                                              image: AssetImage(
                                                  'assets/image/7.png')),
                                          Image(
                                              image: AssetImage(
                                                  'assets/image/8.png')),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Image(
                                              image: AssetImage(
                                                  'assets/image/5.png')),
                                          Image(
                                              image: AssetImage(
                                                  'assets/image/4.png')),
                                          Image(
                                              image: AssetImage(
                                                  'assets/image/3.png')),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Stack(
                                        children: [
                                          Padding(
                                            padding:  EdgeInsets.all(8.0.h),
                                            child: Container(
                                              height: 450.h,decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(20.r),
                                              color: Color(0xffe8e5fa),
                                            ),

                                            ),
                                          ),
                                          Center(child: Padding(
                                            padding:  EdgeInsets.only(top: 45.h),
                                            child: Text('You have played a total ',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20.h),),
                                          )),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Center(child: Padding(
                                                padding:  EdgeInsets.only(top: 75.h),
                                                child: Text('24 Quizzes',style: TextStyle(color: Color(0xff6a5ae0),fontWeight: FontWeight.bold,fontSize: 20.h),),
                                              )),
                                              Center(child: Padding(
                                                padding:  EdgeInsets.only(top: 75.h),
                                                child: Text('  this month!',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20.h),),
                                              )),
                                            ],
                                          ),
                                          Center(
                                            child: Padding(
                                              padding: const EdgeInsets.only(top: 150),
                                              child: StreamBuilder<Object>(
                                                stream: null,
                                                builder: (context, snapshot) {
                                                  return Column(
                                                    children: [
                                                      Container(
                                                        height: 150.h,
                                                        width: 150.h,
                                                        child: CircularProgressIndicator(
                                                          value: 35/50,
                                                          color: Color(0xff6a5ae0),
                                                        ),
                                                      ),

                                                    ],
                                                  );
                                                }
                                              ),
                                            ),
                                          ),

                                          Padding(
                                            padding:  EdgeInsets.only(top: 300.h),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Container(
                                                  height: 80.h,
                                                  width: 130.h,
                                                  decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20.r)),
                                                  child: ListTile(
                                                    title: Text('5',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25.h),),
                                                    subtitle: Text('Quiz Created',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                                  ),
                                                ),
                                                Container(
                                                  height: 80.h,
                                                  width: 130.h,
                                                  decoration: BoxDecoration(color: Color(0xff6a5ae0),borderRadius: BorderRadius.circular(20.r)),
                                                  child: ListTile(
                                                    title: Text('21',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25.h),),
                                                    subtitle: Text('Quiz won',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),

                                                  ),
                                                ),
                                              ],
                                            ),
                                          )

                                        ],
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      color: Color(0xffe8e5fa),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              height: 70.h,
                                              width: 300.h,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.circular(20.h),
                                              ),
                                              child:
                                              Center(
                                                child: ListTile(
                                                  leading: Container(
                                                    height: 50.h,
                                                    width: 50.h,
                                                    decoration: BoxDecoration(
                                                        image: DecorationImage(image: AssetImage('assets/image/Avatar (1).png'))
                                                    ),
                                                  ),
                                                  title: Text('Davis Curtis',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                                  subtitle: Text('5600',style: TextStyle(color: Colors.black),),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      

                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 120.h),
                  child: Container(
                    height: 100.h,
                    width: 100.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xff6a5ae0),
                        ),
                      ],
                      image: DecorationImage(
                        image: AssetImage('assets/image/Avatar.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 110.h),
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          'Madelyn Dias ',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w800,
                            fontSize: 25.h,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Container(
                        height: 100.h,
                        width: 280.h,
                        decoration: BoxDecoration(
                          color: Color(0xff6a5ae0),
                          borderRadius: BorderRadius.circular(25.r),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.star_border,
                                  color: Colors.white,
                                ),
                                Text(
                                  'Points',
                                  style: TextStyle(color: Colors.white70),
                                ),
                                Text(
                                  '590',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  CupertinoIcons.arrow_turn_right_up,
                                  color: Colors.white,
                                ),
                                Text(
                                  'Points',
                                  style: TextStyle(color: Colors.white70),
                                ),
                                Text(
                                  '590',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.star_border,
                                  color: Colors.white,
                                ),
                                Text(
                                  'Points',
                                  style: TextStyle(color: Colors.white70),
                                ),
                                Text(
                                  '590',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
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
