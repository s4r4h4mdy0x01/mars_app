import 'package:dio/dio.dart';

class Api {
  late final Dio dio;
  Api() {
    dio = Dio(
      BaseOptions(
          baseUrl: 'https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity',
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
          method: 'GET',
          queryParameters: {
            'api_key': 'DN9uIpqHTzotJCPDrhD6zRnNMHeemrypLCcWB8q8'
          }),
    );
  }
  Future<List<dynamic>> getLatestPhotos() async {
    try {
      final Response response = await dio.request("/latest_photos");
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
}
