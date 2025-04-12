import 'package:dio/dio.dart';

class ApiServices {
  final _baseUrl = 'https://evolvify.runasp.net/api/';
  final Dio _dio = Dio();

  Future<Map<String, dynamic>> post({
    required String endPoint,
    required data,
  }) async {
    var response = await _dio.post('$_baseUrl$endPoint');
    return response.data;
  }
}
