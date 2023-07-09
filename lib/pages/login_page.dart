// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:student_attendance_wpu_admin_app/bloc/cubit/app_cubit.dart';
import 'package:student_attendance_wpu_admin_app/bloc/states/app_states.dart';
import 'package:student_attendance_wpu_admin_app/core/enums/connection_enum.dart';
import 'package:student_attendance_wpu_admin_app/core/utils/app_constants.dart';
import 'package:student_attendance_wpu_admin_app/core/utils/media_query_values.dart';
import 'package:student_attendance_wpu_admin_app/pages/home_page.dart';
import 'package:student_attendance_wpu_admin_app/widgets/messages.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit appCubit = AppCubit.get(context);
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            backgroundColor: Colors.white,
            body: Form(
              key: formKey,
              child: Stack(
                children: [
                  SizedBox(
                    width: 1000,
                    height: 600,
                    child: Image.asset(
                      AppImages.loginBackGroundPic,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 370,
                            child: Image.asset(
                              AppImages.loginRafiki,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 70, horizontal: context.width * 0.2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 70),
                          child: Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'أهلاً وسهلاً',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: context.textScaleFactor * 35,
                                    fontFamily: AppStrings.appFont,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.start,
                                  textDirection: TextDirection.ltr,
                                ),
                                SizedBox(
                                  width: context.width / 22,
                                ),
                                Text(
                                  'تسجيل الدخول',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: context.textScaleFactor * 28,
                                    fontFamily: AppStrings.appFont,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.start,
                                  textDirection: TextDirection.rtl,
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'البريد الالكتروني',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: AppStrings.appFont,
                                  fontWeight: FontWeight.bold,
                                  fontSize: context.textScaleFactor * 19,
                                ),
                              ),
                              SizedBox(
                                width: context.width / 28,
                              ),
                              SizedBox(
                                width: context.width / 3,
                                height: 50,
                                child: TextFormField(
                                  controller: appCubit.emailController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "هذا الحقل مطلوب !!";
                                    } else if (value == "") {
                                      return "هذا الحقل مطلوب !!";
                                    } else {
                                      return null;
                                    }
                                  },
                                  cursorColor: AppColors.blueWpuColor,
                                  style: TextStyle(
                                    fontSize: 20 * context.textScaleFactor,
                                    color: AppColors.blueWpuColor,
                                    fontFamily: AppStrings.appFont,
                                  ),
                                  textDirection: TextDirection.ltr,
                                  decoration: InputDecoration(
                                    suffixIcon: const Icon(
                                      Icons.email,
                                    ),
                                    suffixIconColor: AppColors.blueWpuColor,
                                    hintText: 'e-mail',
                                    hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 18 * context.textScaleFactor,
                                      fontFamily: AppStrings.appFont,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    hintTextDirection: TextDirection.ltr,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                        color: AppColors.blueWpuColor,
                                        width: 1,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: AppColors.blueWpuColor,
                                        width: 2.5,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Colors.red,
                                        width: 2.5,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'كلمة السر',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: AppStrings.appFont,
                                  fontWeight: FontWeight.bold,
                                  fontSize: context.textScaleFactor * 19,
                                ),
                              ),
                              SizedBox(
                                width: context.width / 28,
                              ),
                              SizedBox(
                                width: context.width / 3,
                                height: 50,
                                child: TextFormField(
                                  controller: appCubit.passwordController,
                                  validator: (value) {
                                    if (value == null) {
                                      return "هذا الحقل مطلوب !!";
                                    } else if (value == "") {
                                      return "هذا الحقل مطلوب !!";
                                    } else {
                                      return null;
                                    }
                                  },
                                  obscureText: appCubit.isLocked,
                                  cursorColor: AppColors.blueWpuColor,
                                  style: TextStyle(
                                    fontSize: 20 * context.textScaleFactor,
                                    color: AppColors.blueWpuColor,
                                    fontFamily: AppStrings.appFont,
                                  ),
                                  textDirection: TextDirection.ltr,
                                  decoration: InputDecoration(
                                    suffixIcon: const Icon(
                                      Icons.lock,
                                    ),
                                    prefixIcon: IconButton(
                                      onPressed: () {
                                        appCubit.isLockedEvent();
                                      },
                                      icon: appCubit.isLocked == false
                                          ? const Icon(
                                              Icons.remove_red_eye_outlined)
                                          : SvgPicture.asset(
                                              AppIcons.eyeLockIcon,
                                              // ignore: deprecated_member_use
                                              color: AppColors.blueWpuColor,
                                            ),
                                    ),
                                    suffixIconColor: AppColors.blueWpuColor,
                                    hintText: 'password',
                                    hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 18 * context.textScaleFactor,
                                      fontFamily: AppStrings.appFont,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    hintTextDirection: TextDirection.ltr,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                        color: AppColors.blueWpuColor,
                                        width: 1,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: AppColors.blueWpuColor,
                                        width: 2.5,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Colors.red,
                                        width: 2.5,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        appCubit.logInConnectionEnum ==
                                ConnectionEnum.connecting
                            ? Center(
                                child: CircularProgressIndicator(
                                  color: AppColors.blueWpuColor,
                                ),
                              )
                            : Padding(
                                padding: const EdgeInsets.only(left: 50),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        backgroundColor: AppColors.blueWpuColor,
                                        maximumSize: Size(
                                          context.width * 0.7,
                                          context.height * 0.1,
                                        ),
                                      ),
                                      onPressed: () async {
                                        if (formKey.currentState!.validate()) {
                                          await appCubit.loginEvent();
                                          if (appCubit.logInConnectionEnum ==
                                              ConnectionEnum.connected) {
                                            messages(
                                              context: context,
                                              width: 500,
                                              snackBarColor: Color.fromARGB(
                                                  255, 50, 180, 54),
                                              icon: Icons.check_circle,
                                              titleData: 'أهلاً وسهلاً',
                                              messageData:
                                                  'تم تسجيل الدخول بنجاح',
                                            );
                                            Navigator.pushAndRemoveUntil(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const HomePage(),
                                              ),
                                              (route) => false,
                                            );
                                          } else if (appCubit
                                                  .logInConnectionEnum ==
                                              ConnectionEnum.serverError) {
                                            messages(
                                              context: context,
                                              width: 500,
                                              snackBarColor:
                                                  const Color.fromARGB(
                                                      255, 240, 40, 40),
                                              icon: Icons.error,
                                              titleData: 'خطأ',
                                              messageData:
                                                  'تأكد من اتصالك بالانترنت',
                                            );
                                          } else if (appCubit
                                                  .logInConnectionEnum ==
                                              ConnectionEnum.userError) {
                                            messages(
                                              context: context,
                                              width: 500,
                                              snackBarColor:
                                                  const Color.fromARGB(
                                                      255, 240, 40, 40),
                                              icon: Icons.error,
                                              titleData: 'خطأ',
                                              messageData:
                                                  'تأكد من البريد الإلكتروني أو كلمة السر',
                                            );
                                            print('email or pass wrong');
                                          }
                                        } else {
                                          null;
                                        }
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 15,
                                          horizontal: 120,
                                        ),
                                        child: Text(
                                          'تسجيل الدخول',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: AppStrings.appFont,
                                            fontSize:
                                                context.textScaleFactor * 17,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
