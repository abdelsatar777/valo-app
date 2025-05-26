import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;
  final String baseUrl = "https://valorant-api.com/v1/";

  ApiService({required this.dio});

  get({required String endPoint}) async {
    var response = await dio.get("$baseUrl$endPoint");
    return response.data;
  }
}
