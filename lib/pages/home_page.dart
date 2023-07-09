import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_attendance_wpu_admin_app/bloc/cubit/app_cubit.dart';
import 'package:student_attendance_wpu_admin_app/bloc/states/app_states.dart';
import 'package:student_attendance_wpu_admin_app/core/enums/home_page_body_enum.dart';
import 'package:student_attendance_wpu_admin_app/core/utils/app_constants.dart';
import 'package:student_attendance_wpu_admin_app/core/utils/media_query_values.dart';
import 'package:student_attendance_wpu_admin_app/widgets/add_subject_body.dart';
import 'package:student_attendance_wpu_admin_app/widgets/home_body.dart';
import 'package:student_attendance_wpu_admin_app/widgets/select_year_body.dart';
import 'package:student_attendance_wpu_admin_app/widgets/side_bar_wpu.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit appCubit = AppCubit.get(context);
        Widget selctedHomeBody(HomePageBodyEnum homePageBodyEnum) {
          switch (homePageBodyEnum) {
            case HomePageBodyEnum.homeBody:
              return HomeBody(
                appCubit: appCubit,
              );
            case HomePageBodyEnum.addSubjectBody:
              return AddSubjectBody(
                appCubit: appCubit,
              );
            case HomePageBodyEnum.selectYearBody:
              return const SelectYearBody();
            default:
              return const SizedBox();
          }
        }

        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.white,
            appBar: context.width < 800
                ? AppBar(
                    backgroundColor: AppColors.blueWpuColor,
                    elevation: 0,
                    title: const Text(
                      'الصفحة الرئيسية',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: AppStrings.appFont,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    centerTitle: true,
                  )
                : null,
            drawer: context.width < 800
                ? Drawer(
                    backgroundColor: Colors.white,
                    width: 300,
                    child: SideBarWpu(
                      appCubit: appCubit,
                    ),
                  )
                : null,
            body: Row(
              children: [
                context.width >= 800
                    ? Expanded(
                        flex: 1,
                        child: SizedBox(
                          width: 300,
                          height: context.height,
                          child: Card(
                            color: Colors.white,
                            elevation: 8,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0),
                            ),
                            child: SideBarWpu(
                              appCubit: appCubit,
                            ),
                          ),
                        ),
                      )
                    : const SizedBox(),
                // Expanded(
                //     flex: 3,
                //     child: Padding(
                //       padding: const EdgeInsets.symmetric(vertical: 10),
                //       child: SizedBox(
                //         child: Column(
                //           children: [
                //             Padding(
                //               padding: EdgeInsets.symmetric(
                //                   horizontal: context.width < 800 ? 15 : 0),
                //               child: Row(
                //                 mainAxisAlignment: MainAxisAlignment.end,
                //                 children: [
                //                   Expanded(
                //                     child: Text(
                //                       'جدول اليوم :',
                //                       style: TextStyle(
                //                         color: AppColors.blueWpuColor,
                //                         fontFamily: AppStrings.appFont,
                //                         fontWeight: FontWeight.bold,
                //                         fontSize: context.textScaleFactor * 40,
                //                       ),
                //                       textAlign: TextAlign.start,
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //             ),
                //           ],
                //         ),
                //       ),
                //     ))
                selctedHomeBody(appCubit.homePageBodyEnum)
                // appCubit.homePageBodyEnum == HomePageBodyEnum.homeBody
                //     ? HomeBody(
                //         appCubit: appCubit,
                //       )
                //     : appCubit.homePageBodyEnum ==
                //             HomePageBodyEnum.addSubjectBody
                //         ? AddSubjectBody(appCubit: appCubit)
                //         : appCubit.homePageBodyEnum ==
                //                 HomePageBodyEnum.selectYearBody
                //             ? const SelectYearBody()
                //             : const SizedBox()
              ],
            ),
          ),
        );
      },
    );
  }
}
