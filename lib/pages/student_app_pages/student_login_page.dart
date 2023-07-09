// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:student_attendance_wpu/bloc/cubit/student_app_cubit.dart';
import 'package:student_attendance_wpu/bloc/states/student_app_states.dart';
import 'package:student_attendance_wpu/core/enums/connection_enum.dart';
import 'package:student_attendance_wpu/core/utils/app_constants.dart';
import 'package:student_attendance_wpu/core/utils/media_query_values.dart';
import 'package:student_attendance_wpu/pages/student_app_pages/student_home_page.dart';
import 'package:student_attendance_wpu/pages/student_app_pages/student_register_page.dart';
import 'package:student_attendance_wpu/widgets/messages.dart';

class StudentLoginPage extends StatelessWidget {
  const StudentLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StudentAppCubit, StudentAppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        StudentAppCubit appCubit = StudentAppCubit.get(context);
        final formKey = GlobalKey<FormState>();
        return Directionality(
          textDirection: TextDirection.ltr,
          child: Scaffold(
            body: SingleChildScrollView(
                child: Stack(
              children: [
                SizedBox(
                  height: context.height * 0.8,
                  width: context.width,
                  child: Image.asset(
                    AppImages.loginBackGroundPic,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 60,
                    horizontal: 40,
                  ),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'أهلاً وسهلاً',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: AppStrings.appFont,
                            fontWeight: FontWeight.bold,
                            fontSize: context.textScaleFactor * 45,
                          ),
                        ),
                        SizedBox(
                          height: context.height * 0.045,
                        ),
                        Text(
                          'تسجيل الدخول \n الى حسابك',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: AppStrings.appFont,
                            fontWeight: FontWeight.bold,
                            fontSize: context.textScaleFactor * 30,
                          ),
                          textAlign: TextAlign.end,
                        ),
                        SizedBox(
                          height: context.height * 0.07,
                        ),
                        const Text(
                          'الرقم الجامعي',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: AppStrings.appFont,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(
                          height: context.height * 0.02,
                        ),
                        TextFormField(
                          controller: appCubit.uniNumberController,
                          validator: (value) {
                            if (value!.isEmpty || value == '') {
                              return "هذا الحقل مطلوب!!";
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
                          textDirection: TextDirection.rtl,
                          decoration: InputDecoration(
                            suffixIcon: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: SvgPicture.asset(
                                AppIcons.numberIcon,
                                height: 1,
                                // ignore: deprecated_member_use
                                color: AppColors.yelloWpuColor,
                              ),
                            ),
                            suffixIconColor: AppColors.yelloWpuColor,
                            hintText: 'الرقم الجامعي',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 16 * context.textScaleFactor,
                              fontFamily: AppStrings.appFont,
                            ),
                            hintTextDirection: TextDirection.rtl,
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
                          ),
                        ),
                        SizedBox(
                          height: context.height * 0.02,
                        ),
                        const Text(
                          'كلمة السر',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: AppStrings.appFont,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(
                          height: context.height * 0.02,
                        ),
                        TextFormField(
                          controller: appCubit.studentPasswordController,
                          validator: (value) {
                            if (value!.isEmpty || value == '') {
                              return "هذا الحقل مطلوب!!";
                            } else {
                              return null;
                            }
                          },
                          cursorColor: AppColors.blueWpuColor,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: appCubit.passwordIsLocked,
                          style: TextStyle(
                            fontSize: 20 * context.textScaleFactor,
                            color: AppColors.blueWpuColor,
                            fontFamily: AppStrings.appFont,
                          ),
                          textDirection: TextDirection.rtl,
                          decoration: InputDecoration(
                            suffixIcon: const Icon(Icons.lock),
                            suffixIconColor: AppColors.yelloWpuColor,
                            prefixIcon: IconButton(
                              onPressed: () {
                                appCubit.isLockedEvent(
                                    appCubit.passwordIsLocked =
                                        !appCubit.passwordIsLocked);
                              },
                              icon: appCubit.passwordIsLocked == false
                                  ? const Icon(Icons.remove_red_eye_outlined)
                                  : SvgPicture.asset(
                                      AppIcons.eyeLockIcon,
                                      // ignore: deprecated_member_use
                                      color: AppColors.blueWpuColor,
                                    ),
                            ),
                            hintText: 'كلمة السر',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 16 * context.textScaleFactor,
                              fontFamily: AppStrings.appFont,
                            ),
                            hintTextDirection: TextDirection.rtl,
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
                          ),
                        ),
                        SizedBox(
                          height: context.height * 0.05,
                        ),
                        appCubit.loginConnectionEnum ==
                                ConnectionEnum.connecting
                            ? Center(
                                child: CircularProgressIndicator(
                                  color: AppColors.blueWpuColor,
                                ),
                              )
                            : Center(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.blueWpuColor,
                                  ),
                                  onPressed: () async {
                                    if (formKey.currentState!.validate()) {
                                      await appCubit.loginEvent();
                                      if (appCubit.loginConnectionEnum ==
                                          ConnectionEnum.connected) {
                                        appCubit.getProfileInfo();
                                        appCubit.clearEvent(controller: [
                                          appCubit.uniNumberController,
                                          appCubit.studentPasswordController,
                                        ]);
                                        Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const HomePage(),
                                            ),
                                            (route) => false);
                                        messages(
                                          context: context,
                                          width: 500,
                                          snackBarColor: const Color.fromARGB(
                                              255, 50, 180, 54),
                                          icon: Icons.check_circle,
                                          titleData:
                                              'أهلاً وسهلاً ${appCubit.myDetails['full_name']}',
                                          messageData: 'تم تسجيل الدخول بنجاح',
                                        );
                                      } else if (appCubit.loginConnectionEnum ==
                                          ConnectionEnum.serverError) {
                                        print('server error');
                                      } else {
                                        appCubit.clearEvent(controller: [
                                          appCubit.uniNumberController,
                                          appCubit.studentPasswordController,
                                        ]);
                                        messages(
                                          context: context,
                                          width: 500,
                                          snackBarColor: Colors.red,
                                          icon: Icons.error,
                                          titleData: '!!خطأ',
                                          messageData:
                                              'تأكد من الرقم الجامعي أو كلمة السر',
                                        );
                                      }
                                    }
                                  },
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5.0),
                                      child: Text(
                                        'تسجيل الدخول',
                                        style: TextStyle(
                                            fontFamily: AppStrings.appFont,
                                            color: Colors.white,
                                            fontSize:
                                                17 * context.textScaleFactor),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                        SizedBox(
                          height: context.height * 0.05,
                        ),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                onPressed: () {
                                  appCubit.clearEvent(controller: [
                                    appCubit.studentPasswordController,
                                    appCubit.uniNumberController
                                  ]);
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const RegisterPage(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'إنشاء حساب',
                                  style: TextStyle(
                                    fontFamily: AppStrings.appFont,
                                    fontSize: context.textScaleFactor * 15,
                                    color: AppColors.yelloWpuColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              Text(
                                'ليس لديك حساب؟',
                                style: TextStyle(
                                  fontFamily: AppStrings.appFont,
                                  fontSize: context.textScaleFactor * 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
          ),
        );
      },
    );
  }
}
