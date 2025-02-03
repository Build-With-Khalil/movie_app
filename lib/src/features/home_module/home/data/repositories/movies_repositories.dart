import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../../../core/services/dio_services.dart';
import '../../../../../core/utils/constants/app_urls.dart';
import '../model/movies_model.dart';

class MoviesRepository {
  Future<MovieModel> getApi({required int page}) async {
    final dio = DioService(
      BaseOptions(
        baseUrl: AppUrls.baseUrl2,
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 3),
      ),
    );
    final response = await dio.get(
      AppUrls.endPoint2,
      queryParameters: {
        AppUrls.queryParameter: page,
      },
    );

    if (kDebugMode) {
      print("API Raw Response: ${response.data.toString()}");
    }

    return MovieModel.fromJson(response.data);
  }
}
