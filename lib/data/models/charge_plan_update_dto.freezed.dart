// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'charge_plan_update_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChargePlanUpdateDTO _$ChargePlanUpdateDTOFromJson(Map<String, dynamic> json) {
  return _ChargePlanUpdateDTO.fromJson(json);
}

/// @nodoc
mixin _$ChargePlanUpdateDTO {
  String get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChargePlanUpdateDTOCopyWith<ChargePlanUpdateDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChargePlanUpdateDTOCopyWith<$Res> {
  factory $ChargePlanUpdateDTOCopyWith(
          ChargePlanUpdateDTO value, $Res Function(ChargePlanUpdateDTO) then) =
      _$ChargePlanUpdateDTOCopyWithImpl<$Res, ChargePlanUpdateDTO>;
  @useResult
  $Res call({String status});
}

/// @nodoc
class _$ChargePlanUpdateDTOCopyWithImpl<$Res, $Val extends ChargePlanUpdateDTO>
    implements $ChargePlanUpdateDTOCopyWith<$Res> {
  _$ChargePlanUpdateDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ChargePlanUpdateDTOCopyWith<$Res>
    implements $ChargePlanUpdateDTOCopyWith<$Res> {
  factory _$$_ChargePlanUpdateDTOCopyWith(_$_ChargePlanUpdateDTO value,
          $Res Function(_$_ChargePlanUpdateDTO) then) =
      __$$_ChargePlanUpdateDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status});
}

/// @nodoc
class __$$_ChargePlanUpdateDTOCopyWithImpl<$Res>
    extends _$ChargePlanUpdateDTOCopyWithImpl<$Res, _$_ChargePlanUpdateDTO>
    implements _$$_ChargePlanUpdateDTOCopyWith<$Res> {
  __$$_ChargePlanUpdateDTOCopyWithImpl(_$_ChargePlanUpdateDTO _value,
      $Res Function(_$_ChargePlanUpdateDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
  }) {
    return _then(_$_ChargePlanUpdateDTO(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChargePlanUpdateDTO implements _ChargePlanUpdateDTO {
  _$_ChargePlanUpdateDTO({required this.status});

  factory _$_ChargePlanUpdateDTO.fromJson(Map<String, dynamic> json) =>
      _$$_ChargePlanUpdateDTOFromJson(json);

  @override
  final String status;

  @override
  String toString() {
    return 'ChargePlanUpdateDTO(status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChargePlanUpdateDTO &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChargePlanUpdateDTOCopyWith<_$_ChargePlanUpdateDTO> get copyWith =>
      __$$_ChargePlanUpdateDTOCopyWithImpl<_$_ChargePlanUpdateDTO>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChargePlanUpdateDTOToJson(
      this,
    );
  }
}

abstract class _ChargePlanUpdateDTO implements ChargePlanUpdateDTO {
  factory _ChargePlanUpdateDTO({required final String status}) =
      _$_ChargePlanUpdateDTO;

  factory _ChargePlanUpdateDTO.fromJson(Map<String, dynamic> json) =
      _$_ChargePlanUpdateDTO.fromJson;

  @override
  String get status;
  @override
  @JsonKey(ignore: true)
  _$$_ChargePlanUpdateDTOCopyWith<_$_ChargePlanUpdateDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
