import 'package:flutter/material.dart';
import 'package:student_attendance_wpu_admin_app/core/utils/app_constants.dart';
import 'package:student_attendance_wpu_admin_app/core/utils/media_query_values.dart';

messages({
  required BuildContext context,
  required Color snackBarColor,
  required IconData icon,
  required String titleData,
  required String messageData,
  required double width,
}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      
      width: width,
      content: Container(
        padding: const EdgeInsets.all(8),
        height: 75,
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
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
  );
}
