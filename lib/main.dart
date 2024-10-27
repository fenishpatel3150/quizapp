import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:quizapp/controller/BottoController.dart';
import 'package:quizapp/controller/QuizController.dart';
import 'package:quizapp/view/LeaderBoard/LeaderBoard.dart';
import 'package:quizapp/view/LoginScreen/LoginScreen.dart';
import 'package:quizapp/view/LoginScreen/SignupScreen.dart';
import 'package:quizapp/view/SplashScreen/SplashScreen.dart';
import 'package:quizapp/view/Start/QuizStartScreen.dart';
import 'package:quizapp/view/category/CategoryScreen.dart';
import 'package:quizapp/view/home/HomeScreen.dart';
import 'package:quizapp/view/home/componets/bottombar.dart';
import 'package:quizapp/view/profile/ProfileScreen.dart';
import 'package:quizapp/view/quiz/QuizScreen.dart';

import 'controller/Auth_controller.dart';
import 'firebase_options.dart';
import 'helper/Auth_gate.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Get.put(BottomController());
  Get.put(Auth_controller());

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
        //home:SplashScreen(),
        initialRoute: '/',
        getPages: [
          GetPage(
            name: '/',
            page: () =>
                AuthGate(),
            //LoginScreen()

          ),
          GetPage(
            name: '/signin',
            page: () =>  LoginScreen(),
            transition: Transition.cupertino,
            transitionDuration: Duration(milliseconds: 500),
          ),
          GetPage(
            name: '/signup',
            page: () =>  SignUpScreen(),
            transition: Transition.cupertino,
            transitionDuration: Duration(milliseconds: 500),
          ),
          GetPage(
            name: '/profile',
            page: () => const ProfileScreen(),
          ),
          GetPage(
            name: '/quiz',
            page: () => const QuizScreen(),
          ),
          GetPage(
            name: '/home',
            page: () => const HomeScreen(),
          ),
          GetPage(
            name: '/quizstart',
            page: () =>  QuizStartScreen(),
          ),
          GetPage(name: "/lederBord",
              page: () => LiderBordScreen()),
          GetPage(name: "/bottembar",
              page: () => BottomBar()),
          GetPage(name: "/Category",
              page: () => CategoryScreen())
        ],
      ),
    );
  }
}
