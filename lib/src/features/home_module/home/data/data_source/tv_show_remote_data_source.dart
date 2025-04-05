import 'package:dio/dio.dart';
import 'package:movie_app/src/core/services/dio_services.dart';
import 'package:movie_app/src/core/utils/constants/app_urls.dart';

import '../model/movies_model.dart';

abstract class TvShowRemoteDataSource {
  Future<List<TvShowsModel>> getTvShows();
}

class TvShowRemoteDataSourceImpl implements TvShowRemoteDataSource {
  @override
  Future<List<TvShowsModel>> getTvShows() async {
    final dio = DioService(
      BaseOptions(
        baseUrl: AppUrls.baseUrl2,
        connectTimeout: Duration(seconds: 10),
        receiveTimeout: Duration(seconds: 10),
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );
    try {
      final response = await dio.get(AppUrls.endPoint2);
      print('Response data: ${response.data}');
      final data = response.data['tv_shows'] as List;
      return data.map((e) => TvShowsModel.fromJson(e)).toList();
    } catch (e) {
      throw Exception('Failed to fetch TV shows');
    }
  }
}
