import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_attendance_wpu/bloc/cubit/student_app_cubit.dart';
import 'package:student_attendance_wpu/bloc/states/student_app_states.dart';
import 'package:student_attendance_wpu/core/utils/app_constants.dart';
import 'package:student_attendance_wpu/core/utils/media_query_values.dart';
import 'package:student_attendance_wpu/pages/student_app_pages/student_select_year_page.dart';

class SubjectPage extends StatelessWidget {
  const SubjectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StudentAppCubit, StudentAppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        StudentAppCubit appCubit = StudentAppCubit.get(context);
        return Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FloatingActionButton(
                  heroTag: 'back',
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SelectYearPage(),
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
                    Icons.arrow_back,
                    color: AppColors.yelloWpuColor,
                    size: 26,
                  ),
                ),
                FloatingActionButton(
                  onPressed: () {
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
                  child: Text(
                    'تم',
                    style: TextStyle(
                      fontFamily: AppStrings.appFont,
                      color: AppColors.yelloWpuColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ),
              ],
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
                            ': اختر موادك',
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
                      SizedBox(
                        height: context.height / 1.7,
                        child: ListView.builder(
                          itemCount: appCubit.subjects.length + 1,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    index == appCubit.subjects.length
                                        ? appCubit.addSubject('php')
                                        : null;
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      )),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    child: Center(
                                      child: index == appCubit.subjects.length
                                          ? Center(
                                              child: IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                  Icons.add,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            )
                                          : Text(
                                              appCubit.subjects[index],
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                                fontSize:
                                                    context.textScaleFactor *
                                                        18,
                                                fontFamily: AppStrings.appFont,
                                              ),
                                            ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                              ],
                            );
                          },
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
