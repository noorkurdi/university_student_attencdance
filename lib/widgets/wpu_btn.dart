import 'package:flutter/material.dart';
import 'package:student_attendance_wpu_admin_app/core/utils/app_constants.dart';
import 'package:student_attendance_wpu_admin_app/core/utils/media_query_values.dart';

// ignore: must_be_immutable
class WpuBtn extends StatelessWidget {
  WpuBtn({super.key, required this.text, this.onTap});
  String text;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: SizedBox(
        width: 400,
        height: 60,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: SizedBox(
                child: Image.asset(
                  AppImages.btnMask,
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Text(
                  text,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: context.textScaleFactor * 18,
                    fontFamily: AppStrings.appFont,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
