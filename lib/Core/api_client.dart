import 'package:dio/dio.dart';
import 'package:easy_lab/Core/constants.dart';

class ApiClient {
  final Dio _dio = Dio();

  Future<dynamic> registerUser(Map<String, dynamic>? data) async {
    try {
      Response response = await _dio.post(
          'https://easylab.amarfuel.com/identity/v2/auth.php?Query=register',
          data: data,
          queryParameters: {'apikey': ApiSecret.apiKey},
          options: Options(headers: {'X-LoginRadius-Sott': ApiSecret.sott}));
      return response.data;
    } on DioException  catch (e) {
      return e.response!.data;
    }
  }

  Future<dynamic> login(String email, String password) async {
    try {
      Response response = await _dio.post(
        'https://easylab.amarfuel.com/identity/v2/auth.php?Query=login',
        data: {
          'Phone': email,
          'Password': password,
        },
        queryParameters: {'apikey': ApiSecret.apiKey},
      );
      return response.data;
    } on DioException  catch (e) {
      return e.response!.data;
    }
  }

  Future<dynamic> getUserProfileData(String accessToken) async {
    try {
      Response response = await _dio.get(
        'https://api.loginradius.com/identity/v2/auth/account',
        queryParameters: {'apikey': ApiSecret.apiKey},
        options: Options(
          headers: {'Authorization': 'Bearer $accessToken'},
        ),
      );
      return response.data;
    } on DioException  catch (e) {
      return e.response!.data;
    }
  }

  Future<dynamic> updateUserProfile({
    required String accessToken,
    required Map<String, dynamic> data,
  }) async {
    try {
      Response response = await _dio.put(
        'https://api.loginradius.com/identity/v2/auth/account',
        data: data,
        queryParameters: {'apikey': ApiSecret.apiKey},
        options: Options(
          headers: {'Authorization': 'Bearer $accessToken'},
        ),
      );
      return response.data;
    } on DioException  catch (e) {
      return e.response!.data;
    }
  }

  Future<dynamic> logout(String accessToken) async {
    try {

      Response response = await _dio.get(
        'https://api.loginradius.com/identity/v2/auth/access_token/InValidate',
        queryParameters: {'apikey': ApiSecret.apiKey},
        options: Options(
          headers: {'Authorization': 'Bearer $accessToken'},
        ),
      );
      return response.data;
    } on DioException  catch (e) {
      return e.response!.data;
    }
  }

Future<dynamic> makeAppoinment(Map<String, dynamic>? appoinmentInfo) async {
    try {
      Response response = await _dio.post(
          'https://easylab.amarfuel.com/identity/v2/auth.php?Query=Appoinment',
          data: appoinmentInfo,
          queryParameters: {'apikey': ApiSecret.apiKey},
          options: Options(headers: {'X-LoginRadius-Sott': ApiSecret.sott}));
      return response.data;
    } on DioException  catch (e) {
      return e.response!.data;
    }
  }

Future<dynamic> makeAppoinmentHealthPackage(Map<String, dynamic>? appoinmentInfo) async {
    try {
      Response response = await _dio.post(
          'https://easylab.amarfuel.com/identity/v2/auth.php?Query=AppoinmentHealthPackage',
          data: appoinmentInfo,
          queryParameters: {'apikey': ApiSecret.apiKey},
          options: Options(headers: {'X-LoginRadius-Sott': ApiSecret.sott}));
      return response.data;
    } on DioException  catch (e) {
      return e.response!.data;
    }
  }
}

