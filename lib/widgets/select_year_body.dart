import 'package:flutter/material.dart';
import 'package:student_attendance_wpu_admin_app/core/utils/app_constants.dart';
import 'package:student_attendance_wpu_admin_app/core/utils/media_query_values.dart';
import 'package:student_attendance_wpu_admin_app/widgets/wpu_btn.dart';

class SelectYearBody extends StatelessWidget {
  const SelectYearBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: SingleChildScrollView(
          child: SizedBox(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: context.width < 800 ? 15 : 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          context.width < 800
                              ? 'اختر السنة الدراسية \n لاظهار الجدول'
                              : 'اختر السنة الدراسية لاظهار الجدول',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: AppStrings.appFont,
                            fontWeight: FontWeight.bold,
                            fontSize: context.textScaleFactor * 40,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20.0,
                    horizontal: 10,
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        WpuBtn(text: 'السنة الاولى'),
                        SizedBox(
                          height: context.height * 0.1,
                        ),
                        WpuBtn(text: 'السنة الثانية'),
                        SizedBox(
                          height: context.height * 0.1,
                        ),
                        WpuBtn(text: 'السنة الثالثة'),
                        SizedBox(
                          height: context.height * 0.1,
                        ),
                        WpuBtn(text: 'السنة الرابعة'),
                        SizedBox(
                          height: context.height * 0.1,
                        ),
                        WpuBtn(text: 'السنة الخامسة'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
