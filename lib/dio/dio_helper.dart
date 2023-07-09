import 'package:dio/dio.dart';
import 'package:student_attendance_wpu/core/utils/app_constants.dart';
import 'package:student_attendance_wpu/dio/end_point.dart';

class DioHelper {
  static Dio dio = Dio(
    BaseOptions(
        baseUrl: AppStrings.baseUrl,
        receiveDataWhenStatusError: true,
        headers: {
          "Accept": "application/json",
          "Connection": 'keep-alive',
          // "Authorization": '$token',
        }),
  );

  //////////AUTH///////////
  static Future<Response> studentSignUp({
    required Map<String, dynamic> data,
  }) async {
    return await dio.post(
      STUDENTSIGNUP,
      data: FormData.fromMap(data),
    );
  }

  static Future<Response> studentLogin({
    required Map<String, dynamic> data,
  }) async {
    return await dio.post(
      STUDENTLOGIN,
      data: FormData.fromMap(data),
    );
  }

  ///////STUDENTS/////////
  static Future<Response> getStudentProfile({required String token}) async {
    return await dio.get(
      GETSTUDENTSPROFILE,
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );
  }

  static Future<Response> editStudentProfile({
    required Map<String, dynamic> data,
    required String token,
  }) async {
    return await dio.put(
      EDITPROFILE,
      data: FormData.fromMap(data),
      options: Options(headers: {
        'Authorization': 'Bearer $token',
      }),
    );
  }

  static Future<Response> addStudentSubject({
    required String token,
    required Map<String, dynamic> data,
  }) async {
    return await dio.post(
      data: data,
      ADDSTUDENTSUBJECT,
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );
  }

  static Future<Response> deleteStudentSubject({
    required String token,
    required Map<String, dynamic> data,
  }) async {
    return await dio.delete(
      data: data,
      DELETESTUDENTSUBJECT,
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );
  }

  static Future<Response> getStudentSubjects({
    required String token,
  }) async {
    return await dio.get(
      GETSTUDENTSUBJECTS,
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );
  }

  static Future<Response> getStudentTodayLecture({
    required int dayId,
    required String token,
  }) async {
    return await dio.get(
      '$GETSTUDENTTODAYLECTURES$dayId',
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );
  }

  static Future<Response> attendanceRegistration({
    required String token,
    required int subjectId,
  }) async {
    return await dio.post(
      '$ATTENDANCEREGISTRATION$subjectId',
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );
  }

  static Future<Response> getStudentAttendance({
    required String token,
    required int id,
  }) async {
    return await dio.get(
      '$GETSTUDENTATTENDANCE$id',
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );
  }

  static Future<Response> getSubjectByYear(
      {required String token, required int year}) async {
    return await dio.get(
      '$GETSUBJECTBYYEAR$year',
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );
  }

  static Future<Response> downloadProgram({
    required String token,
  }) async {
    return await dio.get(
      DOWNLOADPROGRAM,
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );
  }
}
