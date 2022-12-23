// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_info_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DashboardInfoDTO _$DashboardInfoDTOFromJson(Map<String, dynamic> json) {
  return _DashboardInfoDTO.fromJson(json);
}

/// @nodoc
mixin _$DashboardInfoDTO {
  double get totalCo2ValueSmart => throw _privateConstructorUsedError;
  double get totalCo2ValueNotSmart => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DashboardInfoDTOCopyWith<DashboardInfoDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardInfoDTOCopyWith<$Res> {
  factory $DashboardInfoDTOCopyWith(
          DashboardInfoDTO value, $Res Function(DashboardInfoDTO) then) =
      _$DashboardInfoDTOCopyWithImpl<$Res, DashboardInfoDTO>;
  @useResult
  $Res call({double totalCo2ValueSmart, double totalCo2ValueNotSmart});
}

/// @nodoc
class _$DashboardInfoDTOCopyWithImpl<$Res, $Val extends DashboardInfoDTO>
    implements $DashboardInfoDTOCopyWith<$Res> {
  _$DashboardInfoDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCo2ValueSmart = null,
    Object? totalCo2ValueNotSmart = null,
  }) {
    return _then(_value.copyWith(
      totalCo2ValueSmart: null == totalCo2ValueSmart
          ? _value.totalCo2ValueSmart
          : totalCo2ValueSmart // ignore: cast_nullable_to_non_nullable
              as double,
      totalCo2ValueNotSmart: null == totalCo2ValueNotSmart
          ? _value.totalCo2ValueNotSmart
          : totalCo2ValueNotSmart // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DashboardInfoDTOCopyWith<$Res>
    implements $DashboardInfoDTOCopyWith<$Res> {
  factory _$$_DashboardInfoDTOCopyWith(
          _$_DashboardInfoDTO value, $Res Function(_$_DashboardInfoDTO) then) =
      __$$_DashboardInfoDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double totalCo2ValueSmart, double totalCo2ValueNotSmart});
}

/// @nodoc
class __$$_DashboardInfoDTOCopyWithImpl<$Res>
    extends _$DashboardInfoDTOCopyWithImpl<$Res, _$_DashboardInfoDTO>
    implements _$$_DashboardInfoDTOCopyWith<$Res> {
  __$$_DashboardInfoDTOCopyWithImpl(
      _$_DashboardInfoDTO _value, $Res Function(_$_DashboardInfoDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCo2ValueSmart = null,
    Object? totalCo2ValueNotSmart = null,
  }) {
    return _then(_$_DashboardInfoDTO(
      totalCo2ValueSmart: null == totalCo2ValueSmart
          ? _value.totalCo2ValueSmart
          : totalCo2ValueSmart // ignore: cast_nullable_to_non_nullable
              as double,
      totalCo2ValueNotSmart: null == totalCo2ValueNotSmart
          ? _value.totalCo2ValueNotSmart
          : totalCo2ValueNotSmart // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DashboardInfoDTO implements _DashboardInfoDTO {
  _$_DashboardInfoDTO(
      {required this.totalCo2ValueSmart, required this.totalCo2ValueNotSmart});

  factory _$_DashboardInfoDTO.fromJson(Map<String, dynamic> json) =>
      _$$_DashboardInfoDTOFromJson(json);

  @override
  final double totalCo2ValueSmart;
  @override
  final double totalCo2ValueNotSmart;

  @override
  String toString() {
    return 'DashboardInfoDTO(totalCo2ValueSmart: $totalCo2ValueSmart, totalCo2ValueNotSmart: $totalCo2ValueNotSmart)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DashboardInfoDTO &&
            (identical(other.totalCo2ValueSmart, totalCo2ValueSmart) ||
                other.totalCo2ValueSmart == totalCo2ValueSmart) &&
            (identical(other.totalCo2ValueNotSmart, totalCo2ValueNotSmart) ||
                other.totalCo2ValueNotSmart == totalCo2ValueNotSmart));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, totalCo2ValueSmart, totalCo2ValueNotSmart);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DashboardInfoDTOCopyWith<_$_DashboardInfoDTO> get copyWith =>
      __$$_DashboardInfoDTOCopyWithImpl<_$_DashboardInfoDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DashboardInfoDTOToJson(
      this,
    );
  }
}

abstract class _DashboardInfoDTO implements DashboardInfoDTO {
  factory _DashboardInfoDTO(
      {required final double totalCo2ValueSmart,
      required final double totalCo2ValueNotSmart}) = _$_DashboardInfoDTO;

  factory _DashboardInfoDTO.fromJson(Map<String, dynamic> json) =
      _$_DashboardInfoDTO.fromJson;

  @override
  double get totalCo2ValueSmart;
  @override
  double get totalCo2ValueNotSmart;
  @override
  @JsonKey(ignore: true)
  _$$_DashboardInfoDTOCopyWith<_$_DashboardInfoDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
