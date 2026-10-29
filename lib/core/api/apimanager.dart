import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/resources/constants.dart';
import 'package:injectable/injectable.dart';

@singleton
class ApiManager {
  Dio dio = Dio();
  ApiManager();
  Future<Response> getData(
      {required String endPoints, Map<String, dynamic>? queryParameters,Map<String, dynamic>? headers}) {
    return dio.get(
      Constants.baseURL + endPoints,
      queryParameters: queryParameters,
      options: Options(
        headers: headers,
        validateStatus: (status) {
          return status != null;
        },
      ),
    );
  }

  Future<Response> postData(
      {required String endPoints,
      Map<String, dynamic>? body,
      Map<String, dynamic>? headers}) {
    return dio.post(Constants.baseURL + endPoints,
        data: body,
        options: Options(
          headers: headers,
          validateStatus: (status) {
            return status != null;
          },
        ));
  }
}
