import 'package:freezed_annotation/freezed_annotation.dart';

part 'movies.freezed.dart';
part 'movies.g.dart';

@freezed
class MoviesModel with _$MoviesModel {
  const factory MoviesModel({
    @Default('') String total,
    @Default(0) int page,
    @Default(0) int pages,
    @Default([]) List<TvShowsModel> tvShows,
  }) = _MoviesModel;

  factory MoviesModel.fromJson(Map<String, dynamic> json) =>
      _$MoviesModelFromJson(json);
}

@freezed
class TvShowsModel with _$TvShowsModel {
  const factory TvShowsModel({
    @Default(0) int id,
    @Default('') String name,
    @Default('') String permalink,
    @Default('') String startDate,
    @Default('') String endDate,
    @Default('') String country,
    @Default('') String network,
    @Default('') String status,
    @Default('') String imageThumbnailPath,
  }) = _TvShowsModel;

  factory TvShowsModel.fromJson(Map<String, dynamic> json) =>
      _$TvShowsModelFromJson(json);
}
