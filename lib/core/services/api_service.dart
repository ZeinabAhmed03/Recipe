import 'dart:developer';

import 'package:dio/dio.dart';

class ApiService {
  final dio = Dio();
  final baseUrl = 'https://www.themealdb.com/api/json/v1/1';

  Future getData({required String endPoint, CancelToken? cancelToken}) async {
    final response = await dio.get(
      '$baseUrl/$endPoint',
      cancelToken: cancelToken,
    );
    log(response.data.toString());
    return response.data;
  }
}
