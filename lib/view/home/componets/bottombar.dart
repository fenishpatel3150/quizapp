import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizapp/controller/BottoController.dart';
import 'package:quizapp/view/LeaderBoard/LeaderBoard.dart';
import 'package:quizapp/view/category/CategoryScreen.dart';
import 'package:quizapp/view/home/HomeScreen.dart';
import 'package:quizapp/view/profile/ProfileScreen.dart';
class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    BottomController bottomController = Get.find();
    List<Widget> screens = [
      const HomeScreen(),
      const CategoryScreen(),
      ProfileScreen(),
      const LiderBordScreen(),
      ProfileScreen(),
    ];
    return Scaffold(
      body: Obx(() => screens[bottomController.currentIndex.value]),
      bottomNavigationBar: Obx(
        () => CircleNavBar(
          onTap: (index) {
            bottomController.currentIndex(index);
          },
          activeIcons: [
            const Icon(Icons.home, color: Colors.white),
            const Icon(Icons.search_rounded, color: Colors.white),
            const Icon(Icons.add, color: Colors.white),
            const Icon(Icons.leaderboard_outlined, color: Colors.white),
            const Icon(Icons.person, color: Colors.white),
          ],
          inactiveIcons: [
            const Icon(Icons.home, color: Colors.blueGrey),
            const Icon(Icons.search, color: Colors.blueGrey),
            const Icon(Icons.add, color: Colors.blueGrey),
            const Icon(Icons.leaderboard_outlined, color: Colors.blueGrey),
            const Icon(Icons.person, color: Colors.blueGrey),
          ],
          tabDurationMillSec: 1,
          color: Colors.white,
          shadowColor: Colors.deepPurple,
          circleColor: const Color(0xff6a5ae0),
          circleShadowColor: Colors.deepPurple,
          elevation: 15,
          activeIndex: bottomController.currentIndex.value, // Active index
        ),
      ),
    );
  }
}
