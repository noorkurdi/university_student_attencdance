import 'package:dio/dio.dart';

import 'package:student_attendance_wpu_admin_app/core/utils/app_constants.dart';
import 'package:student_attendance_wpu_admin_app/dio/end_points.dart';

class DioHelper {
  static Dio dio = Dio(
    BaseOptions(
      baseUrl: AppStrings.baseUrl,
      receiveDataWhenStatusError: true,
      headers: {
        "Accept": "application/json",
        "Connection": 'keep-alive',
        // "Authorization": '$token',
      },
    ),
  );

  //////////AUTH///////////
  static Future<Response> adminLogin({
    required Map<String, dynamic> data,
  }) async {
    return await dio.post(
      ADMINLOGIN,
      data: FormData.fromMap(data),
    );
  }

  ///////ADMIN CONTROL PANEL///////
  static Future<Response> createProgram({
    required Map<String, dynamic> data,
    required String token,
  }) async {
    return await dio.post(
      ADDPROGRAM,
      data: FormData.fromMap(data),
      options: Options(
        headers: {'Authorization': 'Bearer $token'},
      ),
    );
  }

  static Future<Response> getProgram({required String token}) async {
    return await dio.get(
      GETPROGRAM,
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );
  }

  static Future<Response> deleteProgram({
    required String token,
    required Map<String, dynamic> data,
  }) {
    return dio.post(DELETEPROGRAM,
        data: data,
        options: Options(headers: {
          'Authorization': 'Bearer $token',
        }));
  }

  static Future<Response> editProgram({
    required String token,
    required Map<String, dynamic> data,
  }) {
    return dio.post(EDITPROGRAM,
        data: data,
        options: Options(headers: {
          'Authorization': 'Bearer $token',
        }));
  }

  static Future<Response> getTodayLectures({
    required String token,
    required int id,
  }) async {
    return await dio.get(
      '$GETTODAYLECTURES$id',
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );
  }

  static Future<Response> uploadProgram({
    required String token,
    required Map<String, dynamic> data,
  }) async {
    return await dio.post(UPLOADPROGRAM,
        data: FormData.fromMap(data),
        options: Options(headers: {
          'Authorization': 'Bearer $token',
        }));
  }

  static Future<Response> getUserRegistraition({required String token , required int subjectId}) {
    return dio.get(
      '$USERREGISTRATION$subjectId',
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );
  }

  static Future<Response> getSubjectRegistraition({required String token}) {
    return dio.get(
      SUBJECTSREGISTRATION,
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );
  }
}
