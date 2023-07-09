import 'package:flutter/material.dart';
import 'package:student_attendance_wpu_admin_app/bloc/cubit/app_cubit.dart';
import 'package:student_attendance_wpu_admin_app/core/utils/app_constants.dart';

// ignore: must_be_immutable
class ChooseDayWidget extends StatefulWidget {
  ChooseDayWidget({
    super.key,
    required this.appCubit,
  });
  AppCubit appCubit;
  @override
  State<ChooseDayWidget> createState() => _ChooseDayWidgetState();
}

class _ChooseDayWidgetState extends State<ChooseDayWidget> {
  String? val;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      key: formKey,
      validator: (value) {
        if (!AppLists.days.contains(val)) {
          return 'kkkkkkk';
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.blueWpuColor,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.blueWpuColor,
            width: 3,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        focusColor: Colors.green,
      ),
      iconEnabledColor: AppColors.blueWpuColor,
      iconDisabledColor: Colors.grey,
      icon: const Icon(
        Icons.menu,
      ),
      isExpanded: true,
      hint: Text(
        'اختر اليوم',
        style: TextStyle(
          color: AppColors.blueWpuColor,
          fontFamily: AppStrings.appFont,
          fontSize: 20,
        ),
        textAlign: TextAlign.center,
      ),
      value: val,
      items: AppLists.days.map((e) {
        return DropdownMenuItem(
          value: e,
          child: Text(
            e,
            style: TextStyle(
              color: AppColors.blueWpuColor,
              fontFamily: AppStrings.appFont,
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          val = value;
          widget.appCubit.selectedDayNumber = AppLists.days.indexOf(value!) + 1;
        });
      },
    );
  }
}
