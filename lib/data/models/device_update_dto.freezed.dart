// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_update_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DeviceUpdateDTO _$DeviceUpdateDTOFromJson(Map<String, dynamic> json) {
  return _DeviceUpdateDTO.fromJson(json);
}

/// @nodoc
mixin _$DeviceUpdateDTO {
  String get description => throw _privateConstructorUsedError;
  double get maxPower => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeviceUpdateDTOCopyWith<DeviceUpdateDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeviceUpdateDTOCopyWith<$Res> {
  factory $DeviceUpdateDTOCopyWith(
          DeviceUpdateDTO value, $Res Function(DeviceUpdateDTO) then) =
      _$DeviceUpdateDTOCopyWithImpl<$Res, DeviceUpdateDTO>;
  @useResult
  $Res call({String description, double maxPower});
}

/// @nodoc
class _$DeviceUpdateDTOCopyWithImpl<$Res, $Val extends DeviceUpdateDTO>
    implements $DeviceUpdateDTOCopyWith<$Res> {
  _$DeviceUpdateDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? maxPower = null,
  }) {
    return _then(_value.copyWith(
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      maxPower: null == maxPower
          ? _value.maxPower
          : maxPower // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DeviceUpdateDTOCopyWith<$Res>
    implements $DeviceUpdateDTOCopyWith<$Res> {
  factory _$$_DeviceUpdateDTOCopyWith(
          _$_DeviceUpdateDTO value, $Res Function(_$_DeviceUpdateDTO) then) =
      __$$_DeviceUpdateDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String description, double maxPower});
}

/// @nodoc
class __$$_DeviceUpdateDTOCopyWithImpl<$Res>
    extends _$DeviceUpdateDTOCopyWithImpl<$Res, _$_DeviceUpdateDTO>
    implements _$$_DeviceUpdateDTOCopyWith<$Res> {
  __$$_DeviceUpdateDTOCopyWithImpl(
      _$_DeviceUpdateDTO _value, $Res Function(_$_DeviceUpdateDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? maxPower = null,
  }) {
    return _then(_$_DeviceUpdateDTO(
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      maxPower: null == maxPower
          ? _value.maxPower
          : maxPower // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DeviceUpdateDTO implements _DeviceUpdateDTO {
  _$_DeviceUpdateDTO({required this.description, required this.maxPower});

  factory _$_DeviceUpdateDTO.fromJson(Map<String, dynamic> json) =>
      _$$_DeviceUpdateDTOFromJson(json);

  @override
  final String description;
  @override
  final double maxPower;

  @override
  String toString() {
    return 'DeviceUpdateDTO(description: $description, maxPower: $maxPower)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeviceUpdateDTO &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.maxPower, maxPower) ||
                other.maxPower == maxPower));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, description, maxPower);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeviceUpdateDTOCopyWith<_$_DeviceUpdateDTO> get copyWith =>
      __$$_DeviceUpdateDTOCopyWithImpl<_$_DeviceUpdateDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DeviceUpdateDTOToJson(
      this,
    );
  }
}

abstract class _DeviceUpdateDTO implements DeviceUpdateDTO {
  factory _DeviceUpdateDTO(
      {required final String description,
      required final double maxPower}) = _$_DeviceUpdateDTO;

  factory _DeviceUpdateDTO.fromJson(Map<String, dynamic> json) =
      _$_DeviceUpdateDTO.fromJson;

  @override
  String get description;
  @override
  double get maxPower;
  @override
  @JsonKey(ignore: true)
  _$$_DeviceUpdateDTOCopyWith<_$_DeviceUpdateDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
