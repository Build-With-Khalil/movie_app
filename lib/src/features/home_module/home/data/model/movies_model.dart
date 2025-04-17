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
  const TvShowsModel({
    super.id,
    super.name,
    super.permalink,
    super.startDate,
    super.endDate,
    super.country,
    super.network,
    super.status,
    super.imageThumbnailPath,
  });

  factory TvShowsModel.fromJson(Map<String, dynamic> json) => TvShowsModel(
        id: json['id'] ?? 0,
        name: json['name'] ?? '',
        permalink: json['permalink'] ?? '',
        startDate: json['start_date'] ?? '',
        endDate: json['end_date'] ?? '',
        country: json['country'] ?? '',
        network: json['network'] ?? '',
        status: json['status'] ?? '',
        imageThumbnailPath: json['image_thumbnail_path'] ?? '',
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
