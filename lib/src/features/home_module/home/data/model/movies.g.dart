// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MoviesModelImpl _$$MoviesModelImplFromJson(Map<String, dynamic> json) =>
    _$MoviesModelImpl(
      total: json['total'] as String? ?? '',
      page: (json['page'] as num?)?.toInt() ?? 0,
      pages: (json['pages'] as num?)?.toInt() ?? 0,
      tvShows: (json['tvShows'] as List<dynamic>?)
              ?.map((e) => TvShowsModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$MoviesModelImplToJson(_$MoviesModelImpl instance) =>
    <String, dynamic>{
      'total': instance.total,
      'page': instance.page,
      'pages': instance.pages,
      'tvShows': instance.tvShows,
    };

_$TvShowsModelImpl _$$TvShowsModelImplFromJson(Map<String, dynamic> json) =>
    _$TvShowsModelImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: json['name'] as String? ?? '',
      permalink: json['permalink'] as String? ?? '',
      startDate: json['startDate'] as String? ?? '',
      endDate: json['endDate'] as String? ?? '',
      country: json['country'] as String? ?? '',
      network: json['network'] as String? ?? '',
      status: json['status'] as String? ?? '',
      imageThumbnailPath: json['imageThumbnailPath'] as String? ?? '',
    );

Map<String, dynamic> _$$TvShowsModelImplToJson(_$TvShowsModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'permalink': instance.permalink,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'country': instance.country,
      'network': instance.network,
      'status': instance.status,
      'imageThumbnailPath': instance.imageThumbnailPath,
    };
