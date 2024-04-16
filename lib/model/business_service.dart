import 'dart:io';

import 'package:dio/dio.dart';

class BusinessSerivce {
  final String url = 'https://api.yelp.com/v3/businesses/search?location=NYC';
  final yelpToken =
      'Bearer bza6Hp9uiEWv2F86OSEycfB9Sc7-7G9FfMZ1JgtQM3cqSpEnG6CsF_IzpEmouNAdfiXcvmL4DSbMqbsp6jmWpyKJ-DG7-FzN3hfqXxjvQ_jfgvZQWXr5yN9pdIrjZXYx';

  final _dio = Dio();

  Future<dynamic> get() async {
    dynamic responseJson;

    try {
      final response = await _dio.get(url,
          options: Options(
            method: "GET",
            headers: {"Authorization": yelpToken, "Accept": 'application/json'},
          ));
      responseJson = response.data;
    } on SocketException {
      throw DioException.connectionError(
          requestOptions: RequestOptions(), reason: "No Internet Connection");
    }
    return responseJson;
  }
}
