import 'package:flutter/material.dart';
import 'package:student_attendance_wpu_admin_app/bloc/cubit/app_cubit.dart';
import 'package:student_attendance_wpu_admin_app/core/enums/home_page_body_enum.dart';
import 'package:student_attendance_wpu_admin_app/core/enums/select_btn_enum.dart';
import 'package:student_attendance_wpu_admin_app/core/utils/app_constants.dart';
import 'package:student_attendance_wpu_admin_app/core/utils/media_query_values.dart';

// ignore: must_be_immutable
class SideBarWpu extends StatelessWidget {
  SideBarWpu({super.key, required this.appCubit});
  AppCubit appCubit;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            width: 200,
            height: 200,
            child: Image.asset(
              AppImages.wpuLogo,
            ),
          ),
          SizedBox(
            height: context.height * 0.08,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(400, 70),
              backgroundColor:
                  appCubit.selectBtnEnum == SelectBtnEnum.programBtn
                      ? AppColors.blueWpuColor
                      : Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7),
                side: BorderSide(
                  color: AppColors.blueWpuColor.withOpacity(0.7),
                  width: 2,
                ),
              ),
              shadowColor: AppColors.blueWpuColor,
              elevation: 5,
            ),
            onPressed: () {
              appCubit.homeBody(HomePageBodyEnum.homeBody);
              appCubit.selectBtn(SelectBtnEnum.programBtn);
            },
            child: Text(
              'البرنامج',
              style: TextStyle(
                fontFamily: AppStrings.appFont,
                color: appCubit.selectBtnEnum == SelectBtnEnum.programBtn
                    ? Colors.white
                    : AppColors.blueWpuColor,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(
            height: context.height * 0.1,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(400, 70),
              backgroundColor:
                  appCubit.selectBtnEnum == SelectBtnEnum.studentAttendanceBtn
                      ? AppColors.blueWpuColor
                      : Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7),
                side: BorderSide(
                  color: AppColors.blueWpuColor.withOpacity(0.7),
                  width: 2,
                ),
              ),
              shadowColor: AppColors.blueWpuColor,
              elevation: 5,
            ),
            onPressed: () {
              appCubit.selectBtn(SelectBtnEnum.studentAttendanceBtn);
            },
            child: Text(
              'تسجيل حضور \n الطلاب',
              style: TextStyle(
                fontFamily: AppStrings.appFont,
                color:
                    appCubit.selectBtnEnum == SelectBtnEnum.studentAttendanceBtn
                        ? Colors.white
                        : AppColors.blueWpuColor,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: context.height * 0.1,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(400, 70),
              backgroundColor:
                  appCubit.selectBtnEnum == SelectBtnEnum.todayLectureBtn
                      ? AppColors.blueWpuColor
                      : Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7),
                side: BorderSide(
                  color: AppColors.blueWpuColor.withOpacity(0.7),
                  width: 2,
                ),
              ),
              shadowColor: AppColors.blueWpuColor,
              elevation: 5,
            ),
            onPressed: () {
              appCubit.selectBtn(SelectBtnEnum.todayLectureBtn);
            },
            child: Text(
              'محاضرات اليوم',
              style: TextStyle(
                fontFamily: AppStrings.appFont,
                color: appCubit.selectBtnEnum == SelectBtnEnum.todayLectureBtn
                    ? Colors.white
                    : AppColors.blueWpuColor,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
