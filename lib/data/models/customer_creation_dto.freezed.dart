// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_creation_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CustomerCreationDTO _$CustomerCreationDTOFromJson(Map<String, dynamic> json) {
  return _CustomerCreationDTO.fromJson(json);
}

/// @nodoc
mixin _$CustomerCreationDTO {
  int get id => throw _privateConstructorUsedError;
  int get hubid => throw _privateConstructorUsedError;
  String get street => throw _privateConstructorUsedError;
  String get number => throw _privateConstructorUsedError;
  String get postalcode => throw _privateConstructorUsedError;
  String get city => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomerCreationDTOCopyWith<CustomerCreationDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerCreationDTOCopyWith<$Res> {
  factory $CustomerCreationDTOCopyWith(
          CustomerCreationDTO value, $Res Function(CustomerCreationDTO) then) =
      _$CustomerCreationDTOCopyWithImpl<$Res, CustomerCreationDTO>;
  @useResult
  $Res call(
      {int id,
      int hubid,
      String street,
      String number,
      String postalcode,
      String city});
}

/// @nodoc
class _$CustomerCreationDTOCopyWithImpl<$Res, $Val extends CustomerCreationDTO>
    implements $CustomerCreationDTOCopyWith<$Res> {
  _$CustomerCreationDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? hubid = null,
    Object? street = null,
    Object? number = null,
    Object? postalcode = null,
    Object? city = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      hubid: null == hubid
          ? _value.hubid
          : hubid // ignore: cast_nullable_to_non_nullable
              as int,
      street: null == street
          ? _value.street
          : street // ignore: cast_nullable_to_non_nullable
              as String,
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String,
      postalcode: null == postalcode
          ? _value.postalcode
          : postalcode // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CustomerCreationDTOCopyWith<$Res>
    implements $CustomerCreationDTOCopyWith<$Res> {
  factory _$$_CustomerCreationDTOCopyWith(_$_CustomerCreationDTO value,
          $Res Function(_$_CustomerCreationDTO) then) =
      __$$_CustomerCreationDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int hubid,
      String street,
      String number,
      String postalcode,
      String city});
}

/// @nodoc
class __$$_CustomerCreationDTOCopyWithImpl<$Res>
    extends _$CustomerCreationDTOCopyWithImpl<$Res, _$_CustomerCreationDTO>
    implements _$$_CustomerCreationDTOCopyWith<$Res> {
  __$$_CustomerCreationDTOCopyWithImpl(_$_CustomerCreationDTO _value,
      $Res Function(_$_CustomerCreationDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? hubid = null,
    Object? street = null,
    Object? number = null,
    Object? postalcode = null,
    Object? city = null,
  }) {
    return _then(_$_CustomerCreationDTO(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      hubid: null == hubid
          ? _value.hubid
          : hubid // ignore: cast_nullable_to_non_nullable
              as int,
      street: null == street
          ? _value.street
          : street // ignore: cast_nullable_to_non_nullable
              as String,
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String,
      postalcode: null == postalcode
          ? _value.postalcode
          : postalcode // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CustomerCreationDTO implements _CustomerCreationDTO {
  _$_CustomerCreationDTO(
      {required this.id,
      required this.hubid,
      required this.street,
      required this.number,
      required this.postalcode,
      required this.city});

  factory _$_CustomerCreationDTO.fromJson(Map<String, dynamic> json) =>
      _$$_CustomerCreationDTOFromJson(json);

  @override
  final int id;
  @override
  final int hubid;
  @override
  final String street;
  @override
  final String number;
  @override
  final String postalcode;
  @override
  final String city;

  @override
  String toString() {
    return 'CustomerCreationDTO(id: $id, hubid: $hubid, street: $street, number: $number, postalcode: $postalcode, city: $city)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CustomerCreationDTO &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.hubid, hubid) || other.hubid == hubid) &&
            (identical(other.street, street) || other.street == street) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.postalcode, postalcode) ||
                other.postalcode == postalcode) &&
            (identical(other.city, city) || other.city == city));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, hubid, street, number, postalcode, city);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CustomerCreationDTOCopyWith<_$_CustomerCreationDTO> get copyWith =>
      __$$_CustomerCreationDTOCopyWithImpl<_$_CustomerCreationDTO>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CustomerCreationDTOToJson(
      this,
    );
  }
}

abstract class _CustomerCreationDTO implements CustomerCreationDTO {
  factory _CustomerCreationDTO(
      {required final int id,
      required final int hubid,
      required final String street,
      required final String number,
      required final String postalcode,
      required final String city}) = _$_CustomerCreationDTO;

  factory _CustomerCreationDTO.fromJson(Map<String, dynamic> json) =
      _$_CustomerCreationDTO.fromJson;

  @override
  int get id;
  @override
  int get hubid;
  @override
  String get street;
  @override
  String get number;
  @override
  String get postalcode;
  @override
  String get city;
  @override
  @JsonKey(ignore: true)
  _$$_CustomerCreationDTOCopyWith<_$_CustomerCreationDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
