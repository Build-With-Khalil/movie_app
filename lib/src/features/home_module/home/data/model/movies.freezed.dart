// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movies.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MoviesModel _$MoviesModelFromJson(Map<String, dynamic> json) {
  return _MoviesModel.fromJson(json);
}

/// @nodoc
mixin _$MoviesModel {
  String get total => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  int get pages => throw _privateConstructorUsedError;
  List<TvShowsModel> get tvShows => throw _privateConstructorUsedError;

  /// Serializes this MoviesModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MoviesModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MoviesModelCopyWith<MoviesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MoviesModelCopyWith<$Res> {
  factory $MoviesModelCopyWith(
          MoviesModel value, $Res Function(MoviesModel) then) =
      _$MoviesModelCopyWithImpl<$Res, MoviesModel>;
  @useResult
  $Res call({String total, int page, int pages, List<TvShowsModel> tvShows});
}

/// @nodoc
class _$MoviesModelCopyWithImpl<$Res, $Val extends MoviesModel>
    implements $MoviesModelCopyWith<$Res> {
  _$MoviesModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MoviesModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? page = null,
    Object? pages = null,
    Object? tvShows = null,
  }) {
    return _then(_value.copyWith(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as String,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      pages: null == pages
          ? _value.pages
          : pages // ignore: cast_nullable_to_non_nullable
              as int,
      tvShows: null == tvShows
          ? _value.tvShows
          : tvShows // ignore: cast_nullable_to_non_nullable
              as List<TvShowsModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MoviesModelImplCopyWith<$Res>
    implements $MoviesModelCopyWith<$Res> {
  factory _$$MoviesModelImplCopyWith(
          _$MoviesModelImpl value, $Res Function(_$MoviesModelImpl) then) =
      __$$MoviesModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String total, int page, int pages, List<TvShowsModel> tvShows});
}

/// @nodoc
class __$$MoviesModelImplCopyWithImpl<$Res>
    extends _$MoviesModelCopyWithImpl<$Res, _$MoviesModelImpl>
    implements _$$MoviesModelImplCopyWith<$Res> {
  __$$MoviesModelImplCopyWithImpl(
      _$MoviesModelImpl _value, $Res Function(_$MoviesModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of MoviesModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? page = null,
    Object? pages = null,
    Object? tvShows = null,
  }) {
    return _then(_$MoviesModelImpl(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as String,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      pages: null == pages
          ? _value.pages
          : pages // ignore: cast_nullable_to_non_nullable
              as int,
      tvShows: null == tvShows
          ? _value._tvShows
          : tvShows // ignore: cast_nullable_to_non_nullable
              as List<TvShowsModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MoviesModelImpl implements _MoviesModel {
  const _$MoviesModelImpl(
      {this.total = '',
      this.page = 0,
      this.pages = 0,
      final List<TvShowsModel> tvShows = const []})
      : _tvShows = tvShows;

  factory _$MoviesModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MoviesModelImplFromJson(json);

  @override
  @JsonKey()
  final String total;
  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final int pages;
  final List<TvShowsModel> _tvShows;
  @override
  @JsonKey()
  List<TvShowsModel> get tvShows {
    if (_tvShows is EqualUnmodifiableListView) return _tvShows;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tvShows);
  }

  @override
  String toString() {
    return 'MoviesModel(total: $total, page: $page, pages: $pages, tvShows: $tvShows)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MoviesModelImpl &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.pages, pages) || other.pages == pages) &&
            const DeepCollectionEquality().equals(other._tvShows, _tvShows));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, total, page, pages,
      const DeepCollectionEquality().hash(_tvShows));

  /// Create a copy of MoviesModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MoviesModelImplCopyWith<_$MoviesModelImpl> get copyWith =>
      __$$MoviesModelImplCopyWithImpl<_$MoviesModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MoviesModelImplToJson(
      this,
    );
  }
}

abstract class _MoviesModel implements MoviesModel {
  const factory _MoviesModel(
      {final String total,
      final int page,
      final int pages,
      final List<TvShowsModel> tvShows}) = _$MoviesModelImpl;

  factory _MoviesModel.fromJson(Map<String, dynamic> json) =
      _$MoviesModelImpl.fromJson;

  @override
  String get total;
  @override
  int get page;
  @override
  int get pages;
  @override
  List<TvShowsModel> get tvShows;

  /// Create a copy of MoviesModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MoviesModelImplCopyWith<_$MoviesModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TvShowsModel _$TvShowsModelFromJson(Map<String, dynamic> json) {
  return _TvShowsModel.fromJson(json);
}

/// @nodoc
mixin _$TvShowsModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get permalink => throw _privateConstructorUsedError;
  String get startDate => throw _privateConstructorUsedError;
  String get endDate => throw _privateConstructorUsedError;
  String get country => throw _privateConstructorUsedError;
  String get network => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get imageThumbnailPath => throw _privateConstructorUsedError;

  /// Serializes this TvShowsModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TvShowsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TvShowsModelCopyWith<TvShowsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TvShowsModelCopyWith<$Res> {
  factory $TvShowsModelCopyWith(
          TvShowsModel value, $Res Function(TvShowsModel) then) =
      _$TvShowsModelCopyWithImpl<$Res, TvShowsModel>;
  @useResult
  $Res call(
      {int id,
      String name,
      String permalink,
      String startDate,
      String endDate,
      String country,
      String network,
      String status,
      String imageThumbnailPath});
}

/// @nodoc
class _$TvShowsModelCopyWithImpl<$Res, $Val extends TvShowsModel>
    implements $TvShowsModelCopyWith<$Res> {
  _$TvShowsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TvShowsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? permalink = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? country = null,
    Object? network = null,
    Object? status = null,
    Object? imageThumbnailPath = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      permalink: null == permalink
          ? _value.permalink
          : permalink // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      network: null == network
          ? _value.network
          : network // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      imageThumbnailPath: null == imageThumbnailPath
          ? _value.imageThumbnailPath
          : imageThumbnailPath // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TvShowsModelImplCopyWith<$Res>
    implements $TvShowsModelCopyWith<$Res> {
  factory _$$TvShowsModelImplCopyWith(
          _$TvShowsModelImpl value, $Res Function(_$TvShowsModelImpl) then) =
      __$$TvShowsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String permalink,
      String startDate,
      String endDate,
      String country,
      String network,
      String status,
      String imageThumbnailPath});
}

/// @nodoc
class __$$TvShowsModelImplCopyWithImpl<$Res>
    extends _$TvShowsModelCopyWithImpl<$Res, _$TvShowsModelImpl>
    implements _$$TvShowsModelImplCopyWith<$Res> {
  __$$TvShowsModelImplCopyWithImpl(
      _$TvShowsModelImpl _value, $Res Function(_$TvShowsModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TvShowsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? permalink = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? country = null,
    Object? network = null,
    Object? status = null,
    Object? imageThumbnailPath = null,
  }) {
    return _then(_$TvShowsModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      permalink: null == permalink
          ? _value.permalink
          : permalink // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      network: null == network
          ? _value.network
          : network // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      imageThumbnailPath: null == imageThumbnailPath
          ? _value.imageThumbnailPath
          : imageThumbnailPath // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TvShowsModelImpl implements _TvShowsModel {
  const _$TvShowsModelImpl(
      {this.id = 0,
      this.name = '',
      this.permalink = '',
      this.startDate = '',
      this.endDate = '',
      this.country = '',
      this.network = '',
      this.status = '',
      this.imageThumbnailPath = ''});

  factory _$TvShowsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TvShowsModelImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String permalink;
  @override
  @JsonKey()
  final String startDate;
  @override
  @JsonKey()
  final String endDate;
  @override
  @JsonKey()
  final String country;
  @override
  @JsonKey()
  final String network;
  @override
  @JsonKey()
  final String status;
  @override
  @JsonKey()
  final String imageThumbnailPath;

  @override
  String toString() {
    return 'TvShowsModel(id: $id, name: $name, permalink: $permalink, startDate: $startDate, endDate: $endDate, country: $country, network: $network, status: $status, imageThumbnailPath: $imageThumbnailPath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TvShowsModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.permalink, permalink) ||
                other.permalink == permalink) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.network, network) || other.network == network) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.imageThumbnailPath, imageThumbnailPath) ||
                other.imageThumbnailPath == imageThumbnailPath));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, permalink, startDate,
      endDate, country, network, status, imageThumbnailPath);

  /// Create a copy of TvShowsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TvShowsModelImplCopyWith<_$TvShowsModelImpl> get copyWith =>
      __$$TvShowsModelImplCopyWithImpl<_$TvShowsModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TvShowsModelImplToJson(
      this,
    );
  }
}

abstract class _TvShowsModel implements TvShowsModel {
  const factory _TvShowsModel(
      {final int id,
      final String name,
      final String permalink,
      final String startDate,
      final String endDate,
      final String country,
      final String network,
      final String status,
      final String imageThumbnailPath}) = _$TvShowsModelImpl;

  factory _TvShowsModel.fromJson(Map<String, dynamic> json) =
      _$TvShowsModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get permalink;
  @override
  String get startDate;
  @override
  String get endDate;
  @override
  String get country;
  @override
  String get network;
  @override
  String get status;
  @override
  String get imageThumbnailPath;

  /// Create a copy of TvShowsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TvShowsModelImplCopyWith<_$TvShowsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
