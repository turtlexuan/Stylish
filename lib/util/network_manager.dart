import 'dart:convert';
import 'package:dio/dio.dart';

class NetworkManager {
  static const String baseUrl = 'https://api.appworks-school.tw/api/1.0';
  final Dio _dio = Dio();

  Future<Map<String, dynamic>> getRequest(String endpoint,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final response =
          await _dio.get(baseUrl + endpoint, queryParameters: queryParameters);
      return response.data;
    } catch (error, stackTrace) {
      print(
          'Error occurred while performing GET request: $error\nStacktrace: $stackTrace');
      rethrow;
    }
  }

  Future<Map<String, dynamic>> postRequest(String endpoint,
      {Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? data}) async {
    try {
      final response = await _dio.post(endpoint,
          queryParameters: queryParameters, data: json.encode(data));
      return response.data;
    } catch (error, stackTrace) {
      print(
          'Error occurred while performing POST request: $error\nStacktrace: $stackTrace');
      rethrow;
    }
  }

  Future<Map<String, dynamic>> putRequest(String endpoint,
      {Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? data}) async {
    try {
      final response = await _dio.put(endpoint,
          queryParameters: queryParameters, data: json.encode(data));
      return response.data;
    } catch (error, stackTrace) {
      print(
          'Error occurred while performing PUT request: $error\nStacktrace: $stackTrace');
      rethrow;
    }
  }

  Future<Map<String, dynamic>> deleteRequest(String endpoint,
      {Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? data}) async {
    try {
      final response = await _dio.delete(endpoint,
          queryParameters: queryParameters, data: json.encode(data));
      return response.data;
    } catch (error, stackTrace) {
      print(
          'Error occurred while performing DELETE request: $error\nStacktrace: $stackTrace');
      rethrow;
    }
  }
}
