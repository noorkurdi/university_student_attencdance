import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:student_attendance_wpu/bloc/states/student_app_states.dart';
import 'package:student_attendance_wpu/core/enums/connection_enum.dart';
import 'package:student_attendance_wpu/core/enums/select_year_enum.dart';
import 'package:student_attendance_wpu/core/utils/app_constants.dart';
import 'package:student_attendance_wpu/dio/dio_helper.dart';

class StudentAppCubit extends Cubit<StudentAppStates> {
  StudentAppCubit(this.sharedPreferences) : super(InitialAppState());
  static StudentAppCubit get(context) => BlocProvider.of(context);

  ///variables///
  bool passwordIsLocked = true;
  bool passwordConfirmIsLocked = true;
  bool oldPassword = true;
  String? studentYear;
  String? token;
  SharedPreferences sharedPreferences;
  dynamic myDetails;
  dynamic todayLecs;
  int? selectedYearNumber;

  ///controllers///
  TextEditingController uniNumberController = TextEditingController();
  TextEditingController studentNameController = TextEditingController();
  TextEditingController studentPasswordController = TextEditingController();
  TextEditingController studentPassConfirmController = TextEditingController();
  TextEditingController studentOldPasswordController = TextEditingController();

  ///Lists///
  List subjects = [
    'مبادئ برمجة',
    'فيزياء',
    'دارات كهربائية',
    'بنيان الحواسيب',
    'مبادئ اقتصاد ومالية',
    'نظم الزمن الحقيقي',
    'اساسيات شبكات حاسوبية',
    'مدخل الى هندسة البرمجيات',
  ];
  List<String> selectedYearName = [];
  List<int>? subjectsId;

  ///enums///
  SelectYearEnum? selectYearEnum;
  ConnectionEnum? loginConnectionEnum,
      signupConnectionEnum,
      getTodayLecsConnectionEnum,
      downloadProgramConnectionEnum,
      addSubjectConnectionEnum,
      deleteSubjectConnectionEnum,
      getProfileInfoConnectionEnum;

  ///events///

  void toggleAccountType(String accountType) {
    if (selectedYearName.contains(accountType)) {
      selectedYearName.remove(accountType);
    } else {
      selectedYearName.clear();
      selectedYearName.add(accountType);
    }
    emit(RefreshUIAppState());
  }

  void clearEvent({
    required List<TextEditingController> controller,
  }) {
    for (int i = 0; i < controller.length; i++) {
      controller[i].clear();
    }
  }

  void isLockedEvent(bool state) {
    state = !state;
    emit(RefreshUIAppState());
  }

  void selectYear(SelectYearEnum selected) {
    selectYearEnum = selected;
    studentYear = selected.toString();
    emit(RefreshUIAppState());
  }

  void addSubject(String sub) {
    subjects.add(sub);
    emit(RefreshUIAppState());
  }

  void initialAppEvent() {
    getProfileInfo();
    emit(RefreshUIAppState());
  }

  /////AUTH/////

  Future<void> signUpEvent() async {
    Map<String, dynamic> data = {
      "full_name": studentNameController.text.trim(),
      "uni_number": uniNumberController.text.trim(),
      "password": studentPasswordController.text,
      "password_confirmation": studentPassConfirmController.text,
      "year": selectedYearNumber
    };
    try {
      signupConnectionEnum = ConnectionEnum.connecting;
      emit(RefreshUIAppState());
      await DioHelper.studentSignUp(data: data).then((value) {
        if (value.statusCode == 200) {
          signupConnectionEnum = ConnectionEnum.connected;
          emit(RefreshUIAppState());
        } else if (value.statusCode == 500) {
          signupConnectionEnum = ConnectionEnum.serverError;
          emit(RefreshUIAppState());
        } else {
          signupConnectionEnum = ConnectionEnum.userError;
          emit(RefreshUIAppState());
        }
      });
    } catch (e) {
      print(e);
      signupConnectionEnum = ConnectionEnum.userError;

      emit(RefreshUIAppState());
    }
  }

  Future<void> loginEvent() async {
    var data = {
      'uni_number': uniNumberController.text,
      'password': studentPasswordController.text,
    };
    try {
      loginConnectionEnum = ConnectionEnum.connecting;
      emit(RefreshUIAppState());
      await DioHelper.studentLogin(data: data).then((value) async {
        if (value.statusCode == 200) {
          token = value.data[AppStrings.keyAccessToken];
          sharedPreferences = await SharedPreferences.getInstance();
          sharedPreferences.setString('token', token!);
          await getProfileInfo();
          loginConnectionEnum = ConnectionEnum.connected;
          emit(RefreshUIAppState());
        } else if (value.statusCode == 500) {
          loginConnectionEnum = ConnectionEnum.serverError;
          emit(RefreshUIAppState());
        } else {
          loginConnectionEnum = ConnectionEnum.userError;
          emit(RefreshUIAppState());
        }
      });
    } catch (e) {
      loginConnectionEnum = ConnectionEnum.userError;
      emit(RefreshUIAppState());
    }
  }

  Future<void> getProfileInfo() async {
    sharedPreferences = await SharedPreferences.getInstance();
    token = sharedPreferences.getString('token');
    try {
      getProfileInfoConnectionEnum = ConnectionEnum.connecting;
      emit(RefreshUIAppState());
      await DioHelper.getStudentProfile(token: token!).then(
        (value) async {
          if (value.statusCode == 200) {
            myDetails = value.data;
            getProfileInfoConnectionEnum = ConnectionEnum.connected;
            emit(RefreshUIAppState());
          } else if (value.statusCode == 500) {
            getProfileInfoConnectionEnum = ConnectionEnum.serverError;
            emit(RefreshUIAppState());
          } else {
            getProfileInfoConnectionEnum = ConnectionEnum.userError;
            emit(RefreshUIAppState());
          }
        },
      );
    } catch (e) {
      getProfileInfoConnectionEnum = ConnectionEnum.userError;
      emit(RefreshUIAppState());
    }
  }

  /////Subject Events/////

  Future<void> addSubjectEvent() async {
    Map<String, dynamic> data = {
      "subjects_id": subjectsId,
    };
    sharedPreferences = await SharedPreferences.getInstance();
    token = sharedPreferences.getString('token');
    try {
      addSubjectConnectionEnum = ConnectionEnum.connecting;
      emit(RefreshUIAppState());
      await DioHelper.addStudentSubject(token: token!, data: data)
          .then((value) {
        if (value.statusCode == 200) {
          addSubjectConnectionEnum = ConnectionEnum.connected;
          emit(RefreshUIAppState());
        } else if (value.statusCode == 500) {
          addSubjectConnectionEnum = ConnectionEnum.serverError;
          emit(RefreshUIAppState());
        } else {
          addSubjectConnectionEnum = ConnectionEnum.userError;
          emit(RefreshUIAppState());
        }
      });
    } catch (e) {
      addSubjectConnectionEnum = ConnectionEnum.userError;
      emit(RefreshUIAppState());
    }
  }

  Future<void> deleteSubjectEvent() async {
    Map<String, dynamic> data = {
      "subjects_id": subjectsId,
    };
    sharedPreferences = await SharedPreferences.getInstance();
    token = sharedPreferences.getString('token');
    try {
      deleteSubjectConnectionEnum = ConnectionEnum.connecting;
      emit(RefreshUIAppState());
      await DioHelper.deleteStudentSubject(token: token!, data: data)
          .then((value) {
        if (value.statusCode == 200) {
          deleteSubjectConnectionEnum = ConnectionEnum.connected;
          emit(RefreshUIAppState());
        } else if (value.statusCode == 500) {
          deleteSubjectConnectionEnum = ConnectionEnum.serverError;
          emit(RefreshUIAppState());
        } else {
          deleteSubjectConnectionEnum = ConnectionEnum.userError;
          emit(RefreshUIAppState());
        }
      });
    } catch (e) {
      deleteSubjectConnectionEnum = ConnectionEnum.userError;
      emit(RefreshUIAppState());
    }
  }

  Future<void> downloadProgramEvent() async {
    sharedPreferences = await SharedPreferences.getInstance();
    token = sharedPreferences.getString('token');
    try {
      downloadProgramConnectionEnum = ConnectionEnum.connecting;
      emit(RefreshUIAppState());
      await DioHelper.downloadProgram(token: token!).then((value) {
        if (value.statusCode == 200) {
          downloadProgramConnectionEnum = ConnectionEnum.connected;
          emit(RefreshUIAppState());
        } else if (value.statusCode == 500) {
          downloadProgramConnectionEnum = ConnectionEnum.serverError;
          emit(RefreshUIAppState());
        } else {
          downloadProgramConnectionEnum = ConnectionEnum.userError;
          emit(RefreshUIAppState());
        }
      });
    } catch (e) {
      downloadProgramConnectionEnum = ConnectionEnum.userError;
      emit(RefreshUIAppState());
    }
  }

  Future<void> getTodayLecsEvent({
    required int dayId,
  }) async {
    sharedPreferences = await SharedPreferences.getInstance();
    token = sharedPreferences.getString('token');
    try {
      getTodayLecsConnectionEnum = ConnectionEnum.connecting;
      emit(RefreshUIAppState());
      await DioHelper.getStudentTodayLecture(dayId: dayId, token: token!)
          .then((value) {
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

  ///////ATTENDANCE///////

  Future<void> studentAttendanceEven() async {
    
  }
}
