// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'charge_request_creation_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChargeRequestCreationDTO _$ChargeRequestCreationDTOFromJson(
    Map<String, dynamic> json) {
  return _ChargeRequestCreationDTO.fromJson(json);
}

/// @nodoc
mixin _$ChargeRequestCreationDTO {
  double get maxRequiredPower => throw _privateConstructorUsedError;
  double get requiredCapacity => throw _privateConstructorUsedError;
  DateTime get deadline => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChargeRequestCreationDTOCopyWith<ChargeRequestCreationDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChargeRequestCreationDTOCopyWith<$Res> {
  factory $ChargeRequestCreationDTOCopyWith(ChargeRequestCreationDTO value,
          $Res Function(ChargeRequestCreationDTO) then) =
      _$ChargeRequestCreationDTOCopyWithImpl<$Res, ChargeRequestCreationDTO>;
  @useResult
  $Res call(
      {double maxRequiredPower, double requiredCapacity, DateTime deadline});
}

/// @nodoc
class _$ChargeRequestCreationDTOCopyWithImpl<$Res,
        $Val extends ChargeRequestCreationDTO>
    implements $ChargeRequestCreationDTOCopyWith<$Res> {
  _$ChargeRequestCreationDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? maxRequiredPower = null,
    Object? requiredCapacity = null,
    Object? deadline = null,
  }) {
    return _then(_value.copyWith(
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
abstract class _$$_ChargeRequestCreationDTOCopyWith<$Res>
    implements $ChargeRequestCreationDTOCopyWith<$Res> {
  factory _$$_ChargeRequestCreationDTOCopyWith(
          _$_ChargeRequestCreationDTO value,
          $Res Function(_$_ChargeRequestCreationDTO) then) =
      __$$_ChargeRequestCreationDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double maxRequiredPower, double requiredCapacity, DateTime deadline});
}

/// @nodoc
class __$$_ChargeRequestCreationDTOCopyWithImpl<$Res>
    extends _$ChargeRequestCreationDTOCopyWithImpl<$Res,
        _$_ChargeRequestCreationDTO>
    implements _$$_ChargeRequestCreationDTOCopyWith<$Res> {
  __$$_ChargeRequestCreationDTOCopyWithImpl(_$_ChargeRequestCreationDTO _value,
      $Res Function(_$_ChargeRequestCreationDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? maxRequiredPower = null,
    Object? requiredCapacity = null,
    Object? deadline = null,
  }) {
    return _then(_$_ChargeRequestCreationDTO(
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
class _$_ChargeRequestCreationDTO implements _ChargeRequestCreationDTO {
  _$_ChargeRequestCreationDTO(
      {required this.maxRequiredPower,
      required this.requiredCapacity,
      required this.deadline});

  factory _$_ChargeRequestCreationDTO.fromJson(Map<String, dynamic> json) =>
      _$$_ChargeRequestCreationDTOFromJson(json);

  @override
  final double maxRequiredPower;
  @override
  final double requiredCapacity;
  @override
  final DateTime deadline;

  @override
  String toString() {
    return 'ChargeRequestCreationDTO(maxRequiredPower: $maxRequiredPower, requiredCapacity: $requiredCapacity, deadline: $deadline)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChargeRequestCreationDTO &&
            (identical(other.maxRequiredPower, maxRequiredPower) ||
                other.maxRequiredPower == maxRequiredPower) &&
            (identical(other.requiredCapacity, requiredCapacity) ||
                other.requiredCapacity == requiredCapacity) &&
            (identical(other.deadline, deadline) ||
                other.deadline == deadline));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, maxRequiredPower, requiredCapacity, deadline);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChargeRequestCreationDTOCopyWith<_$_ChargeRequestCreationDTO>
      get copyWith => __$$_ChargeRequestCreationDTOCopyWithImpl<
          _$_ChargeRequestCreationDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChargeRequestCreationDTOToJson(
      this,
    );
  }
}

abstract class _ChargeRequestCreationDTO implements ChargeRequestCreationDTO {
  factory _ChargeRequestCreationDTO(
      {required final double maxRequiredPower,
      required final double requiredCapacity,
      required final DateTime deadline}) = _$_ChargeRequestCreationDTO;

  factory _ChargeRequestCreationDTO.fromJson(Map<String, dynamic> json) =
      _$_ChargeRequestCreationDTO.fromJson;

  @override
  double get maxRequiredPower;
  @override
  double get requiredCapacity;
  @override
  DateTime get deadline;
  @override
  @JsonKey(ignore: true)
  _$$_ChargeRequestCreationDTOCopyWith<_$_ChargeRequestCreationDTO>
      get copyWith => throw _privateConstructorUsedError;
}
