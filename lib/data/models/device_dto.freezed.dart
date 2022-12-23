// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DeviceDTO _$DeviceDTOFromJson(Map<String, dynamic> json) {
  return _DeviceDTO.fromJson(json);
}

/// @nodoc
mixin _$DeviceDTO {
  int get id => throw _privateConstructorUsedError;
  set id(int value) => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  set description(String value) => throw _privateConstructorUsedError;
  double get maxPower => throw _privateConstructorUsedError;
  set maxPower(double value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeviceDTOCopyWith<DeviceDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeviceDTOCopyWith<$Res> {
  factory $DeviceDTOCopyWith(DeviceDTO value, $Res Function(DeviceDTO) then) =
      _$DeviceDTOCopyWithImpl<$Res, DeviceDTO>;
  @useResult
  $Res call({int id, String description, double maxPower});
}

/// @nodoc
class _$DeviceDTOCopyWithImpl<$Res, $Val extends DeviceDTO>
    implements $DeviceDTOCopyWith<$Res> {
  _$DeviceDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? description = null,
    Object? maxPower = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
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
abstract class _$$_DeviceDTOCopyWith<$Res> implements $DeviceDTOCopyWith<$Res> {
  factory _$$_DeviceDTOCopyWith(
          _$_DeviceDTO value, $Res Function(_$_DeviceDTO) then) =
      __$$_DeviceDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String description, double maxPower});
}

/// @nodoc
class __$$_DeviceDTOCopyWithImpl<$Res>
    extends _$DeviceDTOCopyWithImpl<$Res, _$_DeviceDTO>
    implements _$$_DeviceDTOCopyWith<$Res> {
  __$$_DeviceDTOCopyWithImpl(
      _$_DeviceDTO _value, $Res Function(_$_DeviceDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? description = null,
    Object? maxPower = null,
  }) {
    return _then(_$_DeviceDTO(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
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
class _$_DeviceDTO implements _DeviceDTO {
  _$_DeviceDTO(
      {required this.id, required this.description, required this.maxPower});

  factory _$_DeviceDTO.fromJson(Map<String, dynamic> json) =>
      _$$_DeviceDTOFromJson(json);

  @override
  int id;
  @override
  String description;
  @override
  double maxPower;

  @override
  String toString() {
    return 'DeviceDTO(id: $id, description: $description, maxPower: $maxPower)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeviceDTOCopyWith<_$_DeviceDTO> get copyWith =>
      __$$_DeviceDTOCopyWithImpl<_$_DeviceDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DeviceDTOToJson(
      this,
    );
  }
}

abstract class _DeviceDTO implements DeviceDTO {
  factory _DeviceDTO(
      {required int id,
      required String description,
      required double maxPower}) = _$_DeviceDTO;

  factory _DeviceDTO.fromJson(Map<String, dynamic> json) =
      _$_DeviceDTO.fromJson;

  @override
  int get id;
  set id(int value);
  @override
  String get description;
  set description(String value);
  @override
  double get maxPower;
  set maxPower(double value);
  @override
  @JsonKey(ignore: true)
  _$$_DeviceDTOCopyWith<_$_DeviceDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
