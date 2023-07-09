import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:student_attendance_wpu_admin_app/bloc/cubit/app_cubit.dart';
import 'package:student_attendance_wpu_admin_app/bloc/states/app_states.dart';
import 'package:student_attendance_wpu_admin_app/core/utils/app_constants.dart';
import 'package:student_attendance_wpu_admin_app/core/utils/media_query_values.dart';
import 'package:student_attendance_wpu_admin_app/pages/home_page.dart';
import 'package:student_attendance_wpu_admin_app/pages/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sp = await SharedPreferences.getInstance();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AppCubit>(
          create: (context) => AppCubit(sp),
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
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit appCubit = AppCubit.get(context);
        return MaterialApp(
          title: 'Student attendance',
          debugShowCheckedModeBanner: false,
          home: Builder(
            builder: (context) {
              return AnimatedSplashScreen(
                splashIconSize: context.width,
                splash: SizedBox(
                  width: context.width,
                  child: Image.asset(
                    AppImages.appSplashScreenPhoto,
                    fit: BoxFit.fill,
                  ),
                ),
                nextScreen:
                    appCubit.sharedPreferences.getString('token') != null
                        ? const HomePage()
                        : LoginPage(),
              );
            },
          ),
        );
      },
    );
  }
}
