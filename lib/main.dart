import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:quizapp/controller/BottoController.dart';
import 'package:quizapp/controller/QuizController.dart';
import 'package:quizapp/view/SplashScreen/SplashScreen.dart';
import 'package:quizapp/view/home/HomeScreen.dart';
import 'package:quizapp/view/home/componets/bottombar.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(BottomController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(QuizController());
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home:SplashScreen(),
      ),
    );
  }
}
