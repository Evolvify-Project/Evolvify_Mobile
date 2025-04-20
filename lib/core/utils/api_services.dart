import 'package:dio/dio.dart';

class ApiServices {
  final _baseUrl = 'https://evolvify.runasp.net/api/';
  final Dio _dio = Dio();

  Future<Map<String, dynamic>> post({required String endPoint, data}) async {
    Response response = await _dio.post(
      '$_baseUrl$endPoint',
      data: data,
      options: Options(headers: {}),
    );
    return response.data;
  }

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get('$_baseUrl$endPoint');
    return response.data;
  }
}
