import 'package:equatable/equatable.dart';

class TvShowsEntity extends Equatable {
  final int? id;
  final String? name;
  final String? permalink;
  final String? startDate;
  final String? endDate;
  final String? country;
  final String? network;
  final String? status;
  final String? imageThumbnailPath;

  const TvShowsEntity({
    this.id,
    this.name,
    this.permalink,
    this.startDate,
    this.endDate,
    this.country,
    this.network,
    this.status,
    this.imageThumbnailPath,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        permalink,
        startDate,
        endDate,
        country,
        network,
        status,
        imageThumbnailPath,
      ];
}
