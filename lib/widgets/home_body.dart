import 'package:flutter/material.dart';
import 'package:student_attendance_wpu_admin_app/bloc/cubit/app_cubit.dart';
import 'package:student_attendance_wpu_admin_app/core/enums/home_page_body_enum.dart';
import 'package:student_attendance_wpu_admin_app/core/utils/app_constants.dart';
import 'package:student_attendance_wpu_admin_app/core/utils/media_query_values.dart';

// ignore: must_be_immutable
class HomeBody extends StatelessWidget {
  HomeBody({super.key, required this.appCubit});
  AppCubit appCubit;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: SizedBox(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 150),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            AppColors.blueWpuColor.withOpacity(0.8),
                        elevation: 5,
                        fixedSize: Size.square(
                          context.height * context.width * 0.00028,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        appCubit.homeBody(HomePageBodyEnum.addSubjectBody);
                      },
                      child: Center(
                        child: Text(
                          'إضافة برنامج',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: context.width < 800 ? 20 : 35,
                            fontWeight: FontWeight.bold,
                            fontFamily: AppStrings.appFont,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: context.width * 0.1,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            AppColors.yellowWpuColor.withOpacity(0.9),
                        elevation: 5,
                        fixedSize: Size.square(
                            context.height * context.width * 0.00028),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        appCubit.homeBody(HomePageBodyEnum.selectYearBody);
                      },
                      child: Center(
                        child: Text(
                          'إظهار البرنامج',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: context.width < 800 ? 20 : 35,
                            fontWeight: FontWeight.bold,
                            fontFamily: AppStrings.appFont,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[600],
                  elevation: 5,
                  fixedSize: const Size(350, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () async {
                  await appCubit.uploadProgramPdfEvent();
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'رفع ملف الجدول',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: AppStrings.appFont,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.upload,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
