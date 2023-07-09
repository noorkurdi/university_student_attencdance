import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:student_attendance_wpu/bloc/cubit/student_app_cubit.dart';
import 'package:student_attendance_wpu/bloc/states/student_app_states.dart';
import 'package:student_attendance_wpu/core/utils/app_constants.dart';
import 'package:student_attendance_wpu/core/utils/media_query_values.dart';
import 'package:student_attendance_wpu/pages/student_app_pages/student_profile_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StudentAppCubit, StudentAppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        StudentAppCubit appCubit = StudentAppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text(
              'الصفحة الرئيسية',
              style: TextStyle(
                color: AppColors.blueWpuColor,
                fontWeight: FontWeight.bold,
                fontFamily: AppStrings.appFont,
              ),
            ),
            centerTitle: true,
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProfilePage(),
                      ),
                    );
                  },
                  child: CircleAvatar(
                    radius: 17,
                    backgroundColor: AppColors.blueWpuColor,
                    child: const Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 170,
                      height: 170,
                      child: Image.asset(AppImages.wpuLogo),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                AppColors.yelloWpuColor.withOpacity(0.84),
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Icon(
                                Icons.download,
                                color: Colors.white,
                              ),
                              Text(
                                'تحميل الجدول الدارسي',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontFamily: AppStrings.appFont,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 25,
                        horizontal: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                DateFormat('yyyy/MM/dd').format(DateTime.now()),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: context.textScaleFactor * 16,
                                ),
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Text(
                                  AppMaps.date[DateTime.now().weekday]
                                      .toString(),
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: context.textScaleFactor * 16,
                                    fontFamily: AppStrings.appFont,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            ': محاضرات اليوم',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontFamily: AppStrings.appFont,
                              fontSize: context.textScaleFactor * 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: context.height / 1.7,
                      child: ListView.builder(
                        itemCount: appCubit.subjects.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 50),
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    elevation: 5,
                                    backgroundColor: AppColors.blueWpuColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    child: Center(
                                      child: Text(
                                        appCubit.subjects[index],
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize:
                                              context.textScaleFactor * 18,
                                          fontFamily: AppStrings.appFont,
                                        ),
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
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
