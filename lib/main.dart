import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:student_attendance_wpu/bloc/cubit/student_app_cubit.dart';
import 'package:student_attendance_wpu/core/utils/app_constants.dart';
import 'package:student_attendance_wpu/core/utils/media_query_values.dart';
import 'package:student_attendance_wpu/pages/student_app_pages/student_edit_info.dart';
import 'package:student_attendance_wpu/pages/student_app_pages/student_login_page.dart';
import 'package:student_attendance_wpu/pages/student_app_pages/student_profile_page.dart';
import 'package:student_attendance_wpu/pages/student_app_pages/student_select_year_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sp = await SharedPreferences.getInstance();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<StudentAppCubit>(
          create: (context) => StudentAppCubit(sp)..initialAppEvent(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student attendance',
      home: Builder(
        builder: (context) {
          return AnimatedSplashScreen(
            splashIconSize: context.height,
            splash: Image.asset(
              AppImages.appSplashScreenPhoto,
              fit: BoxFit.fill,
            ),
            nextScreen: const StudentLoginPage(),
          );
        },
      ),
    );
  }
}
