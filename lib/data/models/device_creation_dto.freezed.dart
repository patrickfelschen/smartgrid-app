// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_creation_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DeviceCreationDTO _$DeviceCreationDTOFromJson(Map<String, dynamic> json) {
  return _DeviceCreationDTO.fromJson(json);
}

/// @nodoc
mixin _$DeviceCreationDTO {
  int get id => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  double get maxPower => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeviceCreationDTOCopyWith<DeviceCreationDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeviceCreationDTOCopyWith<$Res> {
  factory $DeviceCreationDTOCopyWith(
          DeviceCreationDTO value, $Res Function(DeviceCreationDTO) then) =
      _$DeviceCreationDTOCopyWithImpl<$Res, DeviceCreationDTO>;
  @useResult
  $Res call({int id, String description, double maxPower});
}

/// @nodoc
class _$DeviceCreationDTOCopyWithImpl<$Res, $Val extends DeviceCreationDTO>
    implements $DeviceCreationDTOCopyWith<$Res> {
  _$DeviceCreationDTOCopyWithImpl(this._value, this._then);

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
abstract class _$$_DeviceCreationDTOCopyWith<$Res>
    implements $DeviceCreationDTOCopyWith<$Res> {
  factory _$$_DeviceCreationDTOCopyWith(_$_DeviceCreationDTO value,
          $Res Function(_$_DeviceCreationDTO) then) =
      __$$_DeviceCreationDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String description, double maxPower});
}

/// @nodoc
class __$$_DeviceCreationDTOCopyWithImpl<$Res>
    extends _$DeviceCreationDTOCopyWithImpl<$Res, _$_DeviceCreationDTO>
    implements _$$_DeviceCreationDTOCopyWith<$Res> {
  __$$_DeviceCreationDTOCopyWithImpl(
      _$_DeviceCreationDTO _value, $Res Function(_$_DeviceCreationDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? description = null,
    Object? maxPower = null,
  }) {
    return _then(_$_DeviceCreationDTO(
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
class _$_DeviceCreationDTO implements _DeviceCreationDTO {
  _$_DeviceCreationDTO(
      {required this.id, required this.description, required this.maxPower});

  factory _$_DeviceCreationDTO.fromJson(Map<String, dynamic> json) =>
      _$$_DeviceCreationDTOFromJson(json);

  @override
  final int id;
  @override
  final String description;
  @override
  final double maxPower;

  @override
  String toString() {
    return 'DeviceCreationDTO(id: $id, description: $description, maxPower: $maxPower)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeviceCreationDTO &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.maxPower, maxPower) ||
                other.maxPower == maxPower));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, description, maxPower);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeviceCreationDTOCopyWith<_$_DeviceCreationDTO> get copyWith =>
      __$$_DeviceCreationDTOCopyWithImpl<_$_DeviceCreationDTO>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DeviceCreationDTOToJson(
      this,
    );
  }
}

abstract class _DeviceCreationDTO implements DeviceCreationDTO {
  factory _DeviceCreationDTO(
      {required final int id,
      required final String description,
      required final double maxPower}) = _$_DeviceCreationDTO;

  factory _DeviceCreationDTO.fromJson(Map<String, dynamic> json) =
      _$_DeviceCreationDTO.fromJson;

  @override
  int get id;
  @override
  String get description;
  @override
  double get maxPower;
  @override
  @JsonKey(ignore: true)
  _$$_DeviceCreationDTOCopyWith<_$_DeviceCreationDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
