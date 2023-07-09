import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:student_attendance_wpu_admin_app/bloc/states/app_states.dart';
import 'package:student_attendance_wpu_admin_app/core/enums/connection_enum.dart';
import 'package:student_attendance_wpu_admin_app/core/enums/home_page_body_enum.dart';
import 'package:student_attendance_wpu_admin_app/core/enums/select_btn_enum.dart';
import 'package:student_attendance_wpu_admin_app/core/utils/app_constants.dart';
import 'package:student_attendance_wpu_admin_app/dio/dio_helper.dart';
import 'package:student_attendance_wpu_admin_app/pages/home_page.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit(this.sharedPreferences) : super(InitialAppState());
  static AppCubit get(context) => BlocProvider.of(context);

  ///variables///
  bool isLocked = true;
  String? token;
  List<String> selectedYearName = [];
  int? selectedYearNumber;
  int? selectedDayNumber;
  SharedPreferences sharedPreferences;
  dynamic todayLecs;
  dynamic userRegisration;

  ///controllers///
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController subjectNameController = TextEditingController();
  TextEditingController doctorNameController = TextEditingController();
  TextEditingController startTimeController = TextEditingController();
  TextEditingController endTimeController = TextEditingController();
  TextEditingController placeController = TextEditingController();

  ///enums///
  SelectBtnEnum selectBtnEnum = SelectBtnEnum.programBtn;
  ConnectionEnum? logInConnectionEnum,
      addProgramConnectionEnum,
      uploadPdfConncetionEnum,
      editProgramConnectionEnum,
      getTodayLecsConnectionEnum,
      userRegisrationConnectionEnum,
      deleteProgramConnectionEnum;
  HomePageBodyEnum homePageBodyEnum = HomePageBodyEnum.homeBody;

  ///events///

  void initialAppEvent() {
    emit(RefreshUIAppState());
  }

  void toggleAccountType(String accountType) {
    if (selectedYearName.contains(accountType)) {
      selectedYearName.remove(accountType);
    } else {
      selectedYearName.clear();
      selectedYearName.add(accountType);
    }
    emit(RefreshUIAppState());
  }

  void isLockedEvent() {
    isLocked == false ? isLocked = true : isLocked = false;
    emit(RefreshUIAppState());
  }

  void selectBtn(SelectBtnEnum selected) {
    selectBtnEnum = selected;
    emit(RefreshUIAppState());
  }

  void homeBody(HomePageBodyEnum homeBody) {
    homePageBodyEnum = homeBody;
    emit(RefreshUIAppState());
  }

  void clearEvent({
    required List<TextEditingController> controller,
  }) {
    for (int i = 0; i < controller.length; i++) {
      controller[i].clear();
    }
  }

  /////////ADMIN API//////////

  ////////AUTH///////

  Future<void> loginEvent() async {
    var data = {
      "email": emailController.text.trim(),
      "password": passwordController.text,
    };
    try {
      logInConnectionEnum = ConnectionEnum.connecting;
      emit(RefreshUIAppState());
      await DioHelper.adminLogin(data: data).then((
        value,
      ) async {
        if (value.statusCode == 200) {
          token = value.data[AppStrings.keyAccessToken];
          sharedPreferences = await SharedPreferences.getInstance();
          sharedPreferences.setString('token', token!);
          logInConnectionEnum = ConnectionEnum.connected;
          emit(RefreshUIAppState());
        } else if (value.statusCode == 500) {
          logInConnectionEnum = ConnectionEnum.serverError;
          emit(RefreshUIAppState());
        } else {
          print(value.data['message']);
          logInConnectionEnum = ConnectionEnum.userError;

          emit(RefreshUIAppState());
        }
      });
    } catch (e) {
      logInConnectionEnum = ConnectionEnum.userError;
      print(e);
      emit(RefreshUIAppState());
    }
  }
  ///////ADMIN CONTROL PANEL///////

  Future<void> addProgramEvent() async {
    var data = {
      "year_id": selectedYearNumber,
      "programs": [
        {
          "subject_name": subjectNameController.text.trim(),
          "professore_name": doctorNameController.text.trim(),
          "start_time": "2023-05-17 11:36",
          "end_time": "2023-05-17 12:36",
          "place": placeController.text.trim(),
          "day": selectedDayNumber
        }
      ]
    };
    try {
      addProgramConnectionEnum = ConnectionEnum.connecting;
      emit(RefreshUIAppState());
      String token;
      sharedPreferences = await SharedPreferences.getInstance();
      token = sharedPreferences.getString('token') ?? 'no token';
      var response = await DioHelper.createProgram(
        data: data,
        token: token,
      );
      if (response.statusCode == 201) {
        addProgramConnectionEnum = ConnectionEnum.connected;
        emit(RefreshUIAppState());
      } else if (response.statusCode == 500) {
        addProgramConnectionEnum = ConnectionEnum.serverError;
        emit(RefreshUIAppState());
      } else {
        addProgramConnectionEnum = ConnectionEnum.userError;
        print('errrrrrrrrrrrrrrrrrrrr');
        emit(RefreshUIAppState());
      }
    } catch (e) {
      addProgramConnectionEnum = ConnectionEnum.userError;
      print(e);
      emit(RefreshUIAppState());
    }
  }

  Future<void> editProgramEvent({
    required int id,
  }) async {
    var data = {
      "id": id,
      "year_id": selectedYearNumber,
      "subject_name": subjectNameController.text.trim(),
      "professore_name": doctorNameController.text.trim(),
      "start_time": startTimeController.text,
      "end_time": endTimeController.text,
      "place": placeController.text.trim(),
      "day": selectedDayNumber
    };
    try {
      editProgramConnectionEnum = ConnectionEnum.connecting;
      emit(RefreshUIAppState());
      String token;
      sharedPreferences = await SharedPreferences.getInstance();
      token = sharedPreferences.getString('token') ?? 'no token';
      var response = await DioHelper.editProgram(
        data: data,
        token: token,
      );
      if (response.statusCode == 201) {
        editProgramConnectionEnum = ConnectionEnum.connected;
        emit(RefreshUIAppState());
      } else if (response.statusCode == 500) {
        editProgramConnectionEnum = ConnectionEnum.serverError;
        emit(RefreshUIAppState());
      } else {
        editProgramConnectionEnum = ConnectionEnum.userError;
        print('errrrrrrrrrrrrrrrrrrrr');
        emit(RefreshUIAppState());
      }
    } catch (e) {
      editProgramConnectionEnum = ConnectionEnum.userError;
      print(e);
      emit(RefreshUIAppState());
    }
  }

  Future<void> deleteProgramEvent({
    required int id,
  }) async {
    Map<String, dynamic> data = {"id": id};
    try {
      deleteProgramConnectionEnum = ConnectionEnum.connecting;
      emit(RefreshUIAppState());
      String token;
      sharedPreferences = await SharedPreferences.getInstance();
      token = sharedPreferences.getString('token') ?? 'no token';
      var response = await DioHelper.deleteProgram(
        data: data,
        token: token,
      );
      if (response.statusCode == 200) {
        deleteProgramConnectionEnum = ConnectionEnum.connected;
        emit(RefreshUIAppState());
      } else if (response.statusCode == 500) {
        deleteProgramConnectionEnum = ConnectionEnum.serverError;
        emit(RefreshUIAppState());
      } else {
        deleteProgramConnectionEnum = ConnectionEnum.userError;
        print('errrrrrrrrrrrrrrrrrrrr');
        emit(RefreshUIAppState());
      }
    } catch (e) {
      deleteProgramConnectionEnum = ConnectionEnum.userError;
      print(e);
      emit(RefreshUIAppState());
    }
  }

  Future<void> uploadProgramPdfEvent() async {
    var result = (await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowMultiple: false,
      onFileLoading: (p0) => print(p0),
      allowedExtensions: ['pdf'],
    ))
        ?.files;

    if (result != null) {
      File file = File(result.single.path ?? "");
      String fileName = file.path.split('/').last;
      String filePath = file.path;
      Map<String, dynamic> data = {
        'file': MultipartFile.fromFile(filePath, filename: fileName)
      };
      print(data['file']);
      print(file);
      print(fileName);
      print(filePath);
      try {
        uploadPdfConncetionEnum = ConnectionEnum.connecting;
        emit(RefreshUIAppState());
        String token;
        sharedPreferences = await SharedPreferences.getInstance();
        token = sharedPreferences.getString('token') ?? 'no token';
        await DioHelper.uploadProgram(token: token, data: data).then((value) {
          if (value.statusCode == 200) {
            uploadPdfConncetionEnum = ConnectionEnum.connected;
            print('sent');
            emit(RefreshUIAppState());
          } else if (value.statusCode == 500) {
            uploadPdfConncetionEnum = ConnectionEnum.serverError;
            emit(RefreshUIAppState());
          } else {
            uploadPdfConncetionEnum = ConnectionEnum.userError;
            emit(RefreshUIAppState());
          }
        });
      } catch (e) {
        uploadPdfConncetionEnum = ConnectionEnum.userError;
        print(e);
        emit(RefreshUIAppState());
      }
    }
  }

  Future<void> getTodayLecsEvent({
    required int id,
  }) async {
    sharedPreferences = await SharedPreferences.getInstance();
    token = sharedPreferences.getString('token');
    try {
      getTodayLecsConnectionEnum = ConnectionEnum.connecting;
      emit(RefreshUIAppState());
      await DioHelper.getTodayLectures(token: token!, id: id).then((value) {
        if (value.statusCode == 200) {
          todayLecs = value.data;
          getTodayLecsConnectionEnum = ConnectionEnum.connected;
          emit(RefreshUIAppState());
        } else if (value.statusCode == 500) {
          getTodayLecsConnectionEnum = ConnectionEnum.serverError;
          emit(RefreshUIAppState());
        } else {
          getTodayLecsConnectionEnum = ConnectionEnum.userError;
          emit(RefreshUIAppState());
        }
      });
    } catch (e) {
      getTodayLecsConnectionEnum = ConnectionEnum.userError;
      emit(RefreshUIAppState());
    }
  }

  Future<void> getUserRegistrationEvent({
    required int subjectId,
  }) async {
    sharedPreferences = await SharedPreferences.getInstance();
    token = sharedPreferences.getString('token')!;
    try {
      userRegisrationConnectionEnum = ConnectionEnum.connecting;
      emit(RefreshUIAppState());
      await DioHelper.getUserRegistraition(token: token!, subjectId: subjectId)
          .then((value) {
        if (value.statusCode == 200) {
          userRegisration = value.data['data'];
          userRegisrationConnectionEnum = ConnectionEnum.connected;
          emit(RefreshUIAppState());
        } else if (value.statusCode == 500) {
          userRegisrationConnectionEnum = ConnectionEnum.serverError;
          emit(RefreshUIAppState());
        } else {
          userRegisrationConnectionEnum = ConnectionEnum.userError;
          emit(RefreshUIAppState());
        }
      });
    } catch (e) {
      userRegisrationConnectionEnum = ConnectionEnum.userError;
      emit(RefreshUIAppState());
    }
  }
}
