import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:student_attendance_wpu/bloc/cubit/student_app_cubit.dart';
import 'package:student_attendance_wpu/bloc/states/student_app_states.dart';
import 'package:student_attendance_wpu/core/utils/app_constants.dart';
import 'package:student_attendance_wpu/core/utils/media_query_values.dart';

class StudentEditInfo extends StatelessWidget {
  const StudentEditInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StudentAppCubit, StudentAppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        StudentAppCubit appCubit = StudentAppCubit.get(context);
        return Scaffold(
          floatingActionButton: InkWell(
            onTap: () {},
            child: SizedBox(
              width: context.width / 2.5,
              height: context.height / 14,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: AppColors.blueWpuColor,
                elevation: 5,
                child: const Center(
                  child: Text(
                    'تعديل',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: AppStrings.appFont,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text(
              'تعديل المعلومات',
              style: TextStyle(
                color: AppColors.blueWpuColor,
                fontFamily: AppStrings.appFont,
                fontWeight: FontWeight.bold,
              ),
            ),
            leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                color: AppColors.blueWpuColor,
              ),
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: context.width / 1.57,
                        height: 50,
                        child: TextFormField(
                          controller: appCubit.studentNameController,
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
                              child: CircleAvatar(
                                radius: 2,
                                backgroundColor: AppColors.blueWpuColor,
                                child: const Icon(
                                  Icons.person,
                                  size: 22,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            suffixIconColor: Colors.white,
                            hintText: 'الاسم الكامل',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 15 * context.textScaleFactor,
                              fontFamily: AppStrings.appFont,
                            ),
                            hintTextDirection: TextDirection.rtl,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
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
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: context.width / 60,
                      ),
                      Text(
                        'الاسم الكامل',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: context.width > 400
                              ? 17 * context.textScaleFactor
                              : context.textScaleFactor * 12,
                          fontFamily: AppStrings.appFont,
                        ),
                        textAlign: TextAlign.end,
                        textDirection: TextDirection.ltr,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: context.height / 22,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: context.width / 1.57,
                        height: 50,
                        child: TextFormField(
                          controller: appCubit.uniNumberController,
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
                                color: AppColors.blueWpuColor,
                              ),
                            ),
                            suffixIconColor: Colors.white,
                            hintText: 'الرقم الجامعي',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: context.width > 600
                                  ? 12 * context.textScaleFactor
                                  : context.textScaleFactor * 15,
                              fontFamily: AppStrings.appFont,
                            ),
                            hintTextDirection: TextDirection.rtl,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
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
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: context.width / 28,
                      ),
                      Text(
                        'الرقم الجامعي',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: context.width > 400
                              ? 15 * context.textScaleFactor
                              : context.textScaleFactor * 12,
                          fontFamily: AppStrings.appFont,
                        ),
                        textAlign: TextAlign.end,
                        textDirection: TextDirection.ltr,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: context.height / 22,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: context.width / 1.57,
                        height: 50,
                        child: TextFormField(
                          controller: appCubit.studentOldPasswordController,
                          cursorColor: AppColors.blueWpuColor,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: appCubit.oldPassword,
                          style: TextStyle(
                            fontSize: 20 * context.textScaleFactor,
                            color: AppColors.blueWpuColor,
                            fontFamily: AppStrings.appFont,
                          ),
                          textDirection: TextDirection.rtl,
                          decoration: InputDecoration(
                            suffixIcon: const Icon(Icons.lock),
                            suffixIconColor: AppColors.blueWpuColor,
                            prefixIcon: IconButton(
                              onPressed: () {
                                appCubit.isLockedEvent(appCubit.oldPassword =
                                    !appCubit.oldPassword);
                              },
                              icon: appCubit.oldPassword == false
                                  ? const Icon(Icons.remove_red_eye_outlined)
                                  : SvgPicture.asset(
                                      AppIcons.eyeLockIcon,
                                      // ignore: deprecated_member_use
                                      color: AppColors.blueWpuColor,
                                    ),
                            ),
                            hintText: 'كلمة السر القديمة',
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
                      ),
                      SizedBox(
                        width: context.width / 25,
                      ),
                      Text(
                        'كلمة السر \nالقديمة',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: context.width > 400
                              ? 17 * context.textScaleFactor
                              : context.textScaleFactor * 12,
                          fontFamily: AppStrings.appFont,
                        ),
                        textAlign: TextAlign.end,
                        textDirection: TextDirection.ltr,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: context.height / 22,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: context.width / 1.57,
                        height: 50,
                        child: TextFormField(
                          controller: appCubit.studentPasswordController,
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
                            suffixIconColor: AppColors.blueWpuColor,
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
                            hintText: 'كلمة السر الجديدة',
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
                      ),
                      SizedBox(
                        width: context.width / 25,
                      ),
                      Text(
                        'كلمة السر \nالجديدة',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: context.width > 400
                              ? 17 * context.textScaleFactor
                              : context.textScaleFactor * 12,
                          fontFamily: AppStrings.appFont,
                        ),
                        textAlign: TextAlign.end,
                        textDirection: TextDirection.ltr,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
