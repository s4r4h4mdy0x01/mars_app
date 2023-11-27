import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';

class Api {
  late final Dio _dio;
  Api() {
    _dio = Dio(
      BaseOptions(
          baseUrl: 'https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity',
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
          method: 'GET',
          queryParameters: {
            'api_key':
                'DN9uIpqHTzotJCPDrhD6zRnNMHeemrypLCcWB8q8' // lock app is task
          }),
    );
    _dio.interceptors.add(RetryInterceptor(
        dio: _dio,
        retries: 3,
        logPrint: log,
        retryDelays: const [
          Duration(seconds: 3), // wait 3 sec before the first retry
          Duration(seconds: 5), // wait 5 sec before the second retry
          Duration(seconds: 6),
        ],
        retryableExtraStatuses: {
          status403Forbidden //403
        }));
  }
  Future<List<dynamic>> getLatestPhotos() async {
    try {
      final Response response = await _dio.request("/latest_photos");
      print(response.data['latest_photos']);

      return response.data['latest_photos'];
    } catch (e) {
      if (e is DioException) {
        print('Dio Exception ${e.toString()}');
      } else {
        print('other error ...! ${e.toString()}');
      }
    }
    return [];
  }

  Future<List<dynamic>> getPhotoByDate(String earthDate, {int? page}) async {
    try {
      final Response response = await _dio.request(
        "/photos",
        queryParameters: {
          "earth_date": earthDate,
          "page": page,
        },
      );
      return response.data['photos'];
    } catch (e) {
      if (e is DioException) {
        print('Dio Exception ${e.toString()}');
      } else {
        print('other error ...! ${e.toString()}');
      }
    }
    return [];
  }

  Future<Map<String, dynamic>> getRoverData() async {
    try {
      final Response response = await _dio.request('');
      print(response.data['rover']['max_date']);
      return response.data['rover'];
    } catch (e) {
      if (e is DioException) {
        print('Dio Exception ${e.toString()}');
      } else {
        print('other error ...! ${e.toString()}');
      }
    }
    return {};
  }
}
