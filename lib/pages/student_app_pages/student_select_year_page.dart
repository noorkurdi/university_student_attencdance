import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_attendance_wpu/bloc/cubit/student_app_cubit.dart';
import 'package:student_attendance_wpu/bloc/states/student_app_states.dart';
import 'package:student_attendance_wpu/core/enums/select_year_enum.dart';
import 'package:student_attendance_wpu/core/utils/app_constants.dart';
import 'package:student_attendance_wpu/core/utils/media_query_values.dart';
import 'package:student_attendance_wpu/pages/student_app_pages/student_subject_page.dart';

class SelectYearPage extends StatelessWidget {
  const SelectYearPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StudentAppCubit, StudentAppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        StudentAppCubit appCubit = StudentAppCubit.get(context);
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const SubjectPage(),
                ),
              );
            },
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: AppColors.yelloWpuColor,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(100),
            ),
            elevation: 0,
            child: Icon(
              Icons.arrow_forward,
              color: AppColors.yelloWpuColor,
              size: 26,
            ),
          ),
          body: SingleChildScrollView(
              child: Stack(
            children: [
              SizedBox(
                height: context.height,
                width: context.width,
                child: Image.asset(
                  AppImages.profileBackGroundPic,
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25),
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        'أهلاً وسهلاً',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: AppStrings.appFont,
                          fontWeight: FontWeight.bold,
                          fontSize: context.textScaleFactor * 37,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'هناك عدة خطوات لإكمال \n عملية التسجيل',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: context.textScaleFactor * 22,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: context.height * 0.09,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            ': اختر سنتك الدراسية',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: AppStrings.appFont,
                              fontSize: context.textScaleFactor * 18,
                            ),
                            textAlign: TextAlign.end,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: context.height * 0.04,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          appCubit.selectYear(SelectYearEnum.firstYear);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: appCubit.selectYearEnum ==
                                  SelectYearEnum.firstYear
                              ? AppColors.blueWpuColor
                              : Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Center(
                            child: Text(
                              'السنة الأولى',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: appCubit.selectYearEnum ==
                                        SelectYearEnum.firstYear
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: context.textScaleFactor * 18,
                                fontFamily: AppStrings.appFont,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          appCubit.selectYear(SelectYearEnum.secondYear);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: appCubit.selectYearEnum ==
                                  SelectYearEnum.secondYear
                              ? AppColors.blueWpuColor
                              : Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Center(
                            child: Text(
                              'السنة الثانية',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: appCubit.selectYearEnum ==
                                        SelectYearEnum.secondYear
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: context.textScaleFactor * 18,
                                fontFamily: AppStrings.appFont,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          appCubit.selectYear(SelectYearEnum.thirdYear);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: appCubit.selectYearEnum ==
                                  SelectYearEnum.thirdYear
                              ? AppColors.blueWpuColor
                              : Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Center(
                            child: Text(
                              'السنة الثالثة',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: appCubit.selectYearEnum ==
                                        SelectYearEnum.thirdYear
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: context.textScaleFactor * 18,
                                fontFamily: AppStrings.appFont,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          appCubit.selectYear(SelectYearEnum.fourthYear);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: appCubit.selectYearEnum ==
                                  SelectYearEnum.fourthYear
                              ? AppColors.blueWpuColor
                              : Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Center(
                            child: Text(
                              'السنة الرابعة',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: appCubit.selectYearEnum ==
                                        SelectYearEnum.fourthYear
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: context.textScaleFactor * 18,
                                fontFamily: AppStrings.appFont,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          appCubit.selectYear(SelectYearEnum.fifthYear);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: appCubit.selectYearEnum ==
                                  SelectYearEnum.fifthYear
                              ? AppColors.blueWpuColor
                              : Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Center(
                            child: Text(
                              'السنة الخامسة',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: appCubit.selectYearEnum ==
                                        SelectYearEnum.fifthYear
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: context.textScaleFactor * 18,
                                fontFamily: AppStrings.appFont,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
        );
      },
    );
  }
}
