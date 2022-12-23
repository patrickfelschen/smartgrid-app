// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'charge_plan_time_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChargePlanTimeDTO _$ChargePlanTimeDTOFromJson(Map<String, dynamic> json) {
  return _ChargePlanTimeDTO.fromJson(json);
}

/// @nodoc
mixin _$ChargePlanTimeDTO {
  DateTime get time => throw _privateConstructorUsedError;
  set time(DateTime value) => throw _privateConstructorUsedError;
  double get power => throw _privateConstructorUsedError;
  set power(double value) => throw _privateConstructorUsedError;
  double get gCO2eqPerkWh => throw _privateConstructorUsedError;
  set gCO2eqPerkWh(double value) => throw _privateConstructorUsedError;
  double get powerGridCapacity => throw _privateConstructorUsedError;
  set powerGridCapacity(double value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChargePlanTimeDTOCopyWith<ChargePlanTimeDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChargePlanTimeDTOCopyWith<$Res> {
  factory $ChargePlanTimeDTOCopyWith(
          ChargePlanTimeDTO value, $Res Function(ChargePlanTimeDTO) then) =
      _$ChargePlanTimeDTOCopyWithImpl<$Res, ChargePlanTimeDTO>;
  @useResult
  $Res call(
      {DateTime time,
      double power,
      double gCO2eqPerkWh,
      double powerGridCapacity});
}

/// @nodoc
class _$ChargePlanTimeDTOCopyWithImpl<$Res, $Val extends ChargePlanTimeDTO>
    implements $ChargePlanTimeDTOCopyWith<$Res> {
  _$ChargePlanTimeDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? power = null,
    Object? gCO2eqPerkWh = null,
    Object? powerGridCapacity = null,
  }) {
    return _then(_value.copyWith(
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
      power: null == power
          ? _value.power
          : power // ignore: cast_nullable_to_non_nullable
              as double,
      gCO2eqPerkWh: null == gCO2eqPerkWh
          ? _value.gCO2eqPerkWh
          : gCO2eqPerkWh // ignore: cast_nullable_to_non_nullable
              as double,
      powerGridCapacity: null == powerGridCapacity
          ? _value.powerGridCapacity
          : powerGridCapacity // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ChargePlanTimeDTOCopyWith<$Res>
    implements $ChargePlanTimeDTOCopyWith<$Res> {
  factory _$$_ChargePlanTimeDTOCopyWith(_$_ChargePlanTimeDTO value,
          $Res Function(_$_ChargePlanTimeDTO) then) =
      __$$_ChargePlanTimeDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime time,
      double power,
      double gCO2eqPerkWh,
      double powerGridCapacity});
}

/// @nodoc
class __$$_ChargePlanTimeDTOCopyWithImpl<$Res>
    extends _$ChargePlanTimeDTOCopyWithImpl<$Res, _$_ChargePlanTimeDTO>
    implements _$$_ChargePlanTimeDTOCopyWith<$Res> {
  __$$_ChargePlanTimeDTOCopyWithImpl(
      _$_ChargePlanTimeDTO _value, $Res Function(_$_ChargePlanTimeDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? power = null,
    Object? gCO2eqPerkWh = null,
    Object? powerGridCapacity = null,
  }) {
    return _then(_$_ChargePlanTimeDTO(
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
      power: null == power
          ? _value.power
          : power // ignore: cast_nullable_to_non_nullable
              as double,
      gCO2eqPerkWh: null == gCO2eqPerkWh
          ? _value.gCO2eqPerkWh
          : gCO2eqPerkWh // ignore: cast_nullable_to_non_nullable
              as double,
      powerGridCapacity: null == powerGridCapacity
          ? _value.powerGridCapacity
          : powerGridCapacity // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChargePlanTimeDTO implements _ChargePlanTimeDTO {
  _$_ChargePlanTimeDTO(
      {required this.time,
      required this.power,
      required this.gCO2eqPerkWh,
      required this.powerGridCapacity});

  factory _$_ChargePlanTimeDTO.fromJson(Map<String, dynamic> json) =>
      _$$_ChargePlanTimeDTOFromJson(json);

  @override
  DateTime time;
  @override
  double power;
  @override
  double gCO2eqPerkWh;
  @override
  double powerGridCapacity;

  @override
  String toString() {
    return 'ChargePlanTimeDTO(time: $time, power: $power, gCO2eqPerkWh: $gCO2eqPerkWh, powerGridCapacity: $powerGridCapacity)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChargePlanTimeDTOCopyWith<_$_ChargePlanTimeDTO> get copyWith =>
      __$$_ChargePlanTimeDTOCopyWithImpl<_$_ChargePlanTimeDTO>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChargePlanTimeDTOToJson(
      this,
    );
  }
}

abstract class _ChargePlanTimeDTO implements ChargePlanTimeDTO {
  factory _ChargePlanTimeDTO(
      {required DateTime time,
      required double power,
      required double gCO2eqPerkWh,
      required double powerGridCapacity}) = _$_ChargePlanTimeDTO;

  factory _ChargePlanTimeDTO.fromJson(Map<String, dynamic> json) =
      _$_ChargePlanTimeDTO.fromJson;

  @override
  DateTime get time;
  set time(DateTime value);
  @override
  double get power;
  set power(double value);
  @override
  double get gCO2eqPerkWh;
  set gCO2eqPerkWh(double value);
  @override
  double get powerGridCapacity;
  set powerGridCapacity(double value);
  @override
  @JsonKey(ignore: true)
  _$$_ChargePlanTimeDTOCopyWith<_$_ChargePlanTimeDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
