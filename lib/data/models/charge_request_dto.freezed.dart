// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'charge_request_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChargeRequestDTO _$ChargeRequestDTOFromJson(Map<String, dynamic> json) {
  return _ChargeRequestDTO.fromJson(json);
}

/// @nodoc
mixin _$ChargeRequestDTO {
  int get id => throw _privateConstructorUsedError;
  set id(int value) => throw _privateConstructorUsedError;
  double get maxRequiredPower => throw _privateConstructorUsedError;
  set maxRequiredPower(double value) => throw _privateConstructorUsedError;
  double get requiredCapacity => throw _privateConstructorUsedError;
  set requiredCapacity(double value) => throw _privateConstructorUsedError;
  DateTime get deadline => throw _privateConstructorUsedError;
  set deadline(DateTime value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChargeRequestDTOCopyWith<ChargeRequestDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChargeRequestDTOCopyWith<$Res> {
  factory $ChargeRequestDTOCopyWith(
          ChargeRequestDTO value, $Res Function(ChargeRequestDTO) then) =
      _$ChargeRequestDTOCopyWithImpl<$Res, ChargeRequestDTO>;
  @useResult
  $Res call(
      {int id,
      double maxRequiredPower,
      double requiredCapacity,
      DateTime deadline});
}

/// @nodoc
class _$ChargeRequestDTOCopyWithImpl<$Res, $Val extends ChargeRequestDTO>
    implements $ChargeRequestDTOCopyWith<$Res> {
  _$ChargeRequestDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? maxRequiredPower = null,
    Object? requiredCapacity = null,
    Object? deadline = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      maxRequiredPower: null == maxRequiredPower
          ? _value.maxRequiredPower
          : maxRequiredPower // ignore: cast_nullable_to_non_nullable
              as double,
      requiredCapacity: null == requiredCapacity
          ? _value.requiredCapacity
          : requiredCapacity // ignore: cast_nullable_to_non_nullable
              as double,
      deadline: null == deadline
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ChargeRequestDTOCopyWith<$Res>
    implements $ChargeRequestDTOCopyWith<$Res> {
  factory _$$_ChargeRequestDTOCopyWith(
          _$_ChargeRequestDTO value, $Res Function(_$_ChargeRequestDTO) then) =
      __$$_ChargeRequestDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      double maxRequiredPower,
      double requiredCapacity,
      DateTime deadline});
}

/// @nodoc
class __$$_ChargeRequestDTOCopyWithImpl<$Res>
    extends _$ChargeRequestDTOCopyWithImpl<$Res, _$_ChargeRequestDTO>
    implements _$$_ChargeRequestDTOCopyWith<$Res> {
  __$$_ChargeRequestDTOCopyWithImpl(
      _$_ChargeRequestDTO _value, $Res Function(_$_ChargeRequestDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? maxRequiredPower = null,
    Object? requiredCapacity = null,
    Object? deadline = null,
  }) {
    return _then(_$_ChargeRequestDTO(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      maxRequiredPower: null == maxRequiredPower
          ? _value.maxRequiredPower
          : maxRequiredPower // ignore: cast_nullable_to_non_nullable
              as double,
      requiredCapacity: null == requiredCapacity
          ? _value.requiredCapacity
          : requiredCapacity // ignore: cast_nullable_to_non_nullable
              as double,
      deadline: null == deadline
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChargeRequestDTO implements _ChargeRequestDTO {
  _$_ChargeRequestDTO(
      {required this.id,
      required this.maxRequiredPower,
      required this.requiredCapacity,
      required this.deadline});

  factory _$_ChargeRequestDTO.fromJson(Map<String, dynamic> json) =>
      _$$_ChargeRequestDTOFromJson(json);

  @override
  int id;
  @override
  double maxRequiredPower;
  @override
  double requiredCapacity;
  @override
  DateTime deadline;

  @override
  String toString() {
    return 'ChargeRequestDTO(id: $id, maxRequiredPower: $maxRequiredPower, requiredCapacity: $requiredCapacity, deadline: $deadline)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChargeRequestDTOCopyWith<_$_ChargeRequestDTO> get copyWith =>
      __$$_ChargeRequestDTOCopyWithImpl<_$_ChargeRequestDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChargeRequestDTOToJson(
      this,
    );
  }
}

abstract class _ChargeRequestDTO implements ChargeRequestDTO {
  factory _ChargeRequestDTO(
      {required int id,
      required double maxRequiredPower,
      required double requiredCapacity,
      required DateTime deadline}) = _$_ChargeRequestDTO;

  factory _ChargeRequestDTO.fromJson(Map<String, dynamic> json) =
      _$_ChargeRequestDTO.fromJson;

  @override
  int get id;
  set id(int value);
  @override
  double get maxRequiredPower;
  set maxRequiredPower(double value);
  @override
  double get requiredCapacity;
  set requiredCapacity(double value);
  @override
  DateTime get deadline;
  set deadline(DateTime value);
  @override
  @JsonKey(ignore: true)
  _$$_ChargeRequestDTOCopyWith<_$_ChargeRequestDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
