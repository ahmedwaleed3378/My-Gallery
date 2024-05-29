import 'package:bookly_app/core/utls/app_prefferences.dart';
import 'package:dio/dio.dart';

import 'service_locator.dart';

class DioHelper {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://flutter.prominaagency.com/',
      receiveDataWhenStatusError: true,
 
    ),
  );
  final AppPreferences _appPreferences = getIt<AppPreferences>();

  Future<Map<String, dynamic>> getData({
    required String url,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    dio.options.headers = {
      'Authorization': 'Bearer ${token ?? _appPreferences.getUserToken()}',
      'Content-Type': 'application/json',
    };
    var res = await dio.get(url, queryParameters: query);
    return res.data;
  }

  Future<Map<String, dynamic>> postData({
    required String url,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
    String? token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': 'bearer $token',
    };
    var res = await dio.post(url, queryParameters: query, data: data);
    return res.data;
  }

 

  Future<Map<String, dynamic>> postFormData(
      {required String url,
      Map<String, dynamic>? query,
      FormData? formData,
      String? token,
      Function(double)? progressCallback,
      }) async {
    dio.options.headers = {
      'Content-Type': 'multipart/form-data',
      'Connection': 'keep-alive',
 'Authorization': 'Bearer $token',
    };
    var res = await dio.post(
      url,
      queryParameters: query,
      data: formData,
      onSendProgress: (count, total) {
        final progress = count / total;
       if(progressCallback!=null) progressCallback(progress);
      },
    );
    return res.data;
  }
    
    
  }
