import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:srmm/app/data/app_constant.dart';

class NetworkApiServices {

  var baseurl = "http://192.168.0.155:4040/api/";
  Future<Response<dynamic>> postApi({ required String endpoint, required Map<String, dynamic> data, String? token,}) async {

    final dio = Dio();
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();

    if (token == null) {
      token = sharedPreference.getString("TOKEN");
    }

    final url = '$baseurl$endpoint';

    try {
      final response = await dio.post(
        url,
        data: data ?? {}, // Use an empty map if data is not provided
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      log('\n====================================================='
          '\nStatus code: ${response.statusCode}\nURL: $url\nResponse Data ${response.data}\n');

      return response;

    } catch (e) {
      log("Error is ===========> $e");
      rethrow;
    }
  }

  Future<Response<dynamic>> putApi({required String endpoint, required Map<String, dynamic> data,}) async {
    final dio = Dio();
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    final token = sharedPreference.getString("TOKEN");
    final url = '$baseurl/$endpoint';

    try {
      final response = await dio.put(
        url,
        data: data,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
          followRedirects: true,
          maxRedirects: 5,
        ),
      );
      log('Status code: ${response.statusCode} on URL: $url Response Data ${response.data}');

      return response;

    } catch (e, stackTrace) {
      log("Error is ===========> $e");
      print(stackTrace);
      rethrow;
    }
  }

  Future<Response<dynamic>> getApi({required String endpoint,}) async {
    final dio = Dio();

    SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    var token = sharedPreference.getString(AppConstant.TOKEN);

    if (token == null) {
      token = sharedPreference.getString("TOKEN");
    }

    final url = '$baseurl$endpoint';

    try {
      final response = await dio.get(
        url,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      log('Status code: ${response.statusCode} on URL: $url Response Data ${response.data}');

      return response;
    } catch (e) {
      log("Error is ===========> $e");
      rethrow;
    }
  }
}