// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:student_attendance_wpu_admin_app/bloc/cubit/app_cubit.dart';
import 'package:student_attendance_wpu_admin_app/core/enums/connection_enum.dart';
import 'package:student_attendance_wpu_admin_app/core/utils/app_constants.dart';
import 'package:student_attendance_wpu_admin_app/core/utils/media_query_values.dart';
import 'package:student_attendance_wpu_admin_app/widgets/choose_day_widget.dart';
import 'package:student_attendance_wpu_admin_app/widgets/messages.dart';

// ignore: must_be_immutable
class AddSubjectBody extends StatelessWidget {
  AddSubjectBody({
    super.key,
    required this.appCubit,
  });
  AppCubit appCubit;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: SingleChildScrollView(
        child: SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: context.width < 800 ? 15 : 0,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'إضافة مادة إلى الجدول',
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
              const SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 250),
                child: SizedBox(
                  height: context.height * 0.08,
                  child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        String year = AppLists.years[index].toString();
                        bool isSelected =
                            appCubit.selectedYearName.contains(year);
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ChoiceChip(
                              
                              label: Text(
                                year,
                              ),
                              selected: isSelected,
                              onSelected: (value) {
                                appCubit.toggleAccountType(year);
                                appCubit.selectedYearNumber = index + 1;
                              },
                              side: BorderSide(color: AppColors.blueWpuColor),
                              backgroundColor: Colors.white,
                              selectedColor: AppColors.blueWpuColor,
                              labelStyle: TextStyle(
                                color: isSelected
                                    ? Colors.white
                                    : AppColors.blueWpuColor,
                                fontFamily: AppStrings.appFont,
                                fontSize: 23,
                              ),
                            ),
                          ],
                        );
                      },
                      separatorBuilder: (context, index) => SizedBox(
                            width: context.width * 0.03,
                          ),
                      itemCount: 5),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 70),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Expanded(
                            child: Text(
                              ' اسم المادة :  ',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: AppStrings.appFont,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 200),
                            child: SizedBox(
                              width: context.width * 0.35,
                              height: 60,
                              child: TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty || value == '') {
                                    return "هذا الحقل مطلوب!!";
                                  } else {
                                    return null;
                                  }
                                },
                                controller: appCubit.subjectNameController,
                                style: TextStyle(
                                  fontSize: 20 * context.textScaleFactor,
                                  color: Colors.black,
                                  fontFamily: AppStrings.appFont,
                                ),
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                  suffixIconColor: AppColors.blueWpuColor,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: const BorderSide(
                                      color: Colors.black,
                                      width: 1,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors.black,
                                      width: 2.5,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: context.height * 0.05,
                      ),
                      Row(
                        children: [
                          const Expanded(
                            child: Text(
                              ' اسم الدكتور :  ',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: AppStrings.appFont,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 200),
                            child: SizedBox(
                              width: context.width * 0.35,
                              height: 60,
                              child: TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty || value == '') {
                                    return "هذا الحقل مطلوب!!";
                                  } else {
                                    return null;
                                  }
                                },
                                controller: appCubit.doctorNameController,
                                style: TextStyle(
                                  fontSize: 20 * context.textScaleFactor,
                                  color: Colors.black,
                                  fontFamily: AppStrings.appFont,
                                ),
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                  suffixIconColor: AppColors.blueWpuColor,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: const BorderSide(
                                      color: Colors.black,
                                      width: 1,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors.black,
                                      width: 2.5,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: context.height * 0.05,
                      ),
                      Row(
                        children: [
                          const Expanded(
                            child: Text(
                              ' وقت المحاضرة :  ',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: AppStrings.appFont,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 200),
                            child: SizedBox(
                              width: context.width * 0.35,
                              height: 60,
                              child: TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty || value == '') {
                                    return "هذا الحقل مطلوب!!";
                                  } else {
                                    return null;
                                  }
                                },
                                readOnly: true,
                                onTap: () async {
                                  TimeOfDay? pickedTime = await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                    cancelText: "إلغاء",
                                    confirmText: "موافق",
                                    helpText: "اختر وقت بدء المحاضرة",
                                  );
                                  if (pickedTime != null) {
                                    appCubit.startTimeController.text =
                                        pickedTime.format(context).toString();
                                  }
                                },
                                controller: appCubit.startTimeController,
                                style: TextStyle(
                                  fontSize: 20 * context.textScaleFactor,
                                  color: Colors.black,
                                  fontFamily: AppStrings.appFont,
                                ),
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                  suffixIconColor: AppColors.blueWpuColor,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: const BorderSide(
                                      color: Colors.black,
                                      width: 1,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors.black,
                                      width: 2.5,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: context.height * 0.05,
                      ),
                      Row(
                        children: [
                          const Expanded(
                            child: Text(
                              ' وقت انتهاء المحاضرة :  ',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: AppStrings.appFont,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 200),
                            child: SizedBox(
                              width: context.width * 0.35,
                              height: 60,
                              child: TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty || value == '') {
                                    return "هذا الحقل مطلوب!!";
                                  } else {
                                    return null;
                                  }
                                },
                                readOnly: true,
                                onTap: () async {
                                  TimeOfDay? pickedTime = await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                    cancelText: "إلغاء",
                                    confirmText: "موافق",
                                    helpText: "اختر وقت انتهاء المحاضرة",
                                  );
                                  if (pickedTime != null) {
                                    appCubit.endTimeController.text =
                                        pickedTime.format(context).toString();
                                  }
                                },
                                controller: appCubit.endTimeController,
                                style: TextStyle(
                                  fontSize: 20 * context.textScaleFactor,
                                  color: Colors.black,
                                  fontFamily: AppStrings.appFont,
                                ),
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                  suffixIconColor: AppColors.blueWpuColor,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: const BorderSide(
                                      color: Colors.black,
                                      width: 1,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors.black,
                                      width: 2.5,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: context.height * 0.05,
                      ),
                      Row(
                        children: [
                          const Expanded(
                            child: Text(
                              ' رقم القاعة :  ',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: AppStrings.appFont,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 200),
                            child: SizedBox(
                              width: context.width * 0.35,
                              height: 60,
                              child: TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty || value == '') {
                                    return "هذا الحقل مطلوب!!";
                                  } else {
                                    return null;
                                  }
                                },
                                controller: appCubit.placeController,
                                style: TextStyle(
                                  fontSize: 20 * context.textScaleFactor,
                                  color: Colors.black,
                                  fontFamily: AppStrings.appFont,
                                ),
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                  suffixIconColor: AppColors.blueWpuColor,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: const BorderSide(
                                      color: Colors.black,
                                      width: 1,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors.black,
                                      width: 2.5,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: context.height * 0.05,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(
                            flex: 1,
                            child: Text(
                              ' اليوم :  ',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: AppStrings.appFont,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 400),
                              child: SizedBox(
                                child: ChooseDayWidget(
                                  appCubit: appCubit,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              appCubit.addProgramConnectionEnum == ConnectionEnum.connecting
                  ? Center(
                      child: CircularProgressIndicator(
                        color: AppColors.blueWpuColor,
                      ),
                    )
                  : ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            AppColors.yellowWpuColor.withOpacity(0.85),
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        fixedSize: const Size(250, 60),
                      ),
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          await appCubit.addProgramEvent();
                          if (appCubit.addProgramConnectionEnum ==
                              ConnectionEnum.connected) {
                            messages(
                              context: context,
                              width: 500,
                              snackBarColor:
                                  const Color.fromARGB(255, 50, 180, 54),
                              icon: Icons.check_circle,
                              titleData: '',
                              messageData: 'تم إضافة المادة إلى الجدول',
                            );
                            appCubit.clearEvent(controller: [
                              appCubit.doctorNameController,
                              appCubit.subjectNameController,
                              appCubit.startTimeController,
                              appCubit.endTimeController,
                              appCubit.placeController,
                            ]);
                            appCubit.selectedDayNumber = 0;
                            appCubit.selectedYearName.clear();
                          } else if (appCubit.addProgramConnectionEnum ==
                              ConnectionEnum.serverError) {
                            print('serverError');
                          } else {
                            print('err');
                          }
                        }
                      },
                      child: const Text(
                        'إضافة',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: AppStrings.appFont,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
