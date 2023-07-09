import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_attendance_wpu/bloc/cubit/student_app_cubit.dart';
import 'package:student_attendance_wpu/bloc/states/student_app_states.dart';
import 'package:student_attendance_wpu/core/utils/app_constants.dart';
import 'package:student_attendance_wpu/core/utils/media_query_values.dart';
import 'package:student_attendance_wpu/pages/student_app_pages/student_edit_info.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StudentAppCubit, StudentAppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        StudentAppCubit appCubit = StudentAppCubit.get(context);
        return Scaffold(
          backgroundColor: AppColors.blueWpuColor,
          body: SingleChildScrollView(
            child: Stack(
              children: [
                SizedBox(
                  height: context.height,
                  width: context.width,
                  child: Image.asset(
                    AppImages.profileBackGroundPic,
                    fit: BoxFit.fill,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                    size: 30,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 150),
                  child: SizedBox(
                    width: context.width,
                    height: context.height,
                    child: Card(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    appCubit.uniNumberController.text =
                                        appCubit.myDetails['uni_number'];
                                    appCubit.studentNameController.text =
                                        appCubit.myDetails['full_name'];
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const StudentEditInfo(),
                                      ),
                                    );
                                  },
                                  icon: Icon(
                                    Icons.edit_square,
                                    color: AppColors.blueWpuColor,
                                    size: 26,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: context.height * 0.07,
                            ),
                            Text(
                              appCubit.myDetails['full_name'],
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: AppStrings.appFont,
                                  fontSize: context.textScaleFactor * 18),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              appCubit.myDetails['uni_number'],
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontFamily: AppStrings.appFont,
                                fontSize: context.textScaleFactor * 18,
                              ),
                            ),
                            SizedBox(
                              height: context.height * 0.05,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  ': المواد',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: AppStrings.appFont,
                                    fontSize: context.textScaleFactor * 18,
                                  ),
                                ),
                              ],
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: SizedBox(
                                height: context.height / 1.7,
                                child: GridView.builder(
                                  // shrinkWrap: true,
                                  // scrollDirection: Axis.vertical,
                                  itemCount: appCubit.subjects.length,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                  ),
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        elevation: 0,
                                        color: AppColors.blueWpuColor,
                                        child: ListTile(
                                          title: Center(
                                            child: Text(
                                              appCubit.subjects[index],
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: AppStrings.appFont,
                                                fontSize:
                                                    context.textScaleFactor *
                                                        20,
                                              ),
                                              textAlign: TextAlign.center,
                                              textDirection: TextDirection.ltr,
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 90),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.grey[350],
                        radius: context.height * 0.09,
                        child: Icon(
                          Icons.person,
                          size: context.height * 0.1,
                          color: AppColors.blueWpuColor,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
