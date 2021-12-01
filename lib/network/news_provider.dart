import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:news_project/network/response/headlines_response.dart';

class NewsProvider {
  static final String _BASEURL = "https://newsapi.org";
  static final String _API_PREFIX = "/v2";

  final String _topHeadlines = _BASEURL + _API_PREFIX + "/top-headlines";

  Dio _dio = new Dio();

  ProviderData() {
    BaseOptions options =
        BaseOptions(receiveTimeout: 10000, connectTimeout: 10000);
    _dio = Dio(options);
  }

  Future<HeadlinesResponse> headlinesProses() async {
    try {
      Response response = await _dio.get(
        _topHeadlines,
        queryParameters: {
          "apiKey": "cba9a2c71fa9489f9460e178cc485ca0",
          "country": "id",
        },
      );
      return HeadlinesResponse.fromJson(response.data);
    } on DioError catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return HeadlinesResponse.withError(_handleError(error));
      // return NearbyMustahikResponse.withError("Error");
    }
  }

  String _handleError(DioError error) {
    String errorDescription = "";
    if (error is DioError) {
      switch (error.type) {
        case DioErrorType.cancel:
          errorDescription = "Request to API server was cancelled";
          break;
        case DioErrorType.connectTimeout:
          errorDescription = "Connection timeout with API server";
          break;
        case DioErrorType.other:
          errorDescription =
              "Connection to API server failed due to internet connection";
          break;
        case DioErrorType.receiveTimeout:
          errorDescription = "Receive timeout in connection with API server";
          break;
        case DioErrorType.response:
          errorDescription = "Received invalid status code: ${error.response!.statusCode}";
          break;
        case DioErrorType.sendTimeout:
          break;
      }
    } else {
      errorDescription = "Unexpected error occured";
    }
    return errorDescription;
  }
}
