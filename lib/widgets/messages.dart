import 'package:flutter/material.dart';
import 'package:student_attendance_wpu/core/utils/app_constants.dart';

messages({
  required BuildContext context,
  required Color snackBarColor,
  required IconData icon,
  required String titleData,
  required String messageData,
  required double width,
  double? height,
}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      width: width,
      content: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          padding: const EdgeInsets.all(8),
          height: height ?? 75,
          decoration: BoxDecoration(
            color: snackBarColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Icon(
                icon,
                color: Colors.white,
                size: 40,
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      titleData,
                      style: const TextStyle(
                          color: Colors.white,
                          fontFamily: AppStrings.appFont,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    Text(
                      messageData,
                      style: const TextStyle(
                          color: Colors.white,
                          fontFamily: AppStrings.appFont,
                          fontSize: 15),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
  );
}
