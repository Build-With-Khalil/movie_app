import '../../domain/entity/tv_show_entity.dart';

class MovieModel {
  final int? total;
  final int? page;
  final int? pages;
  final List<TvShowsModel>? tvShows;

  MovieModel({this.total, this.page, this.pages, this.tvShows});

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        total: json['total'] ?? 0,
        page: json['page'] ?? 0,
        pages: json['pages'] ?? 0,
        tvShows: (json['tv_shows'] as List<dynamic>?)
                ?.map(
                  (e) => TvShowsModel.fromJson(e),
                )
                .toList() ??
            [],
      );

  Map<String, dynamic> toJson() => {
        'total': total,
        'page': page,
        'pages': pages,
        'tv_shows': tvShows?.toList(),
      };
}

class TvShowsModel extends TvShowsEntity {
  final int? id;
  final String? name;
  final String? permalink;
  final String? startDate;
  final String? endDate;
  final String? country;
  final String? network;
  final String? status;
  final String? imageThumbnailPath;

  const TvShowsModel(
    this.id,
    this.name,
    this.permalink,
    this.startDate,
    this.endDate,
    this.country,
    this.network,
    this.status,
    this.imageThumbnailPath,
  ) : super(
          id,
          name,
          permalink,
          startDate,
          endDate,
          country,
          network,
          status,
          imageThumbnailPath,
        );

  factory TvShowsModel.fromJson(Map<String, dynamic> json) => TvShowsModel(
        json['id'] ?? 0,
        json['name'] ?? '',
        json['permalink'] ?? '',
        json['start_date'] ?? '',
        json['end_date'] ?? '',
        json['country'] ?? '',
        json['network'] ?? '',
        json['status'] ?? '',
        json['image_thumbnail_path'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'permalink': permalink,
        'start_date': startDate,
        'end_date': endDate,
        'country': country,
        'network': network,
        'status': status,
        'image_thumbnail_path': imageThumbnailPath,
      };
}
