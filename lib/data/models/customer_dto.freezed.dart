// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CustomerDTO _$CustomerDTOFromJson(Map<String, dynamic> json) {
  return _CustomerDTO.fromJson(json);
}

/// @nodoc
mixin _$CustomerDTO {
  int get id => throw _privateConstructorUsedError;
  int get hubid => throw _privateConstructorUsedError;
  String get street => throw _privateConstructorUsedError;
  String get number => throw _privateConstructorUsedError;
  String get postalcode => throw _privateConstructorUsedError;
  String get city => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomerDTOCopyWith<CustomerDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerDTOCopyWith<$Res> {
  factory $CustomerDTOCopyWith(
          CustomerDTO value, $Res Function(CustomerDTO) then) =
      _$CustomerDTOCopyWithImpl<$Res, CustomerDTO>;
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
class _$CustomerDTOCopyWithImpl<$Res, $Val extends CustomerDTO>
    implements $CustomerDTOCopyWith<$Res> {
  _$CustomerDTOCopyWithImpl(this._value, this._then);

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
abstract class _$$_CustomerDTOCopyWith<$Res>
    implements $CustomerDTOCopyWith<$Res> {
  factory _$$_CustomerDTOCopyWith(
          _$_CustomerDTO value, $Res Function(_$_CustomerDTO) then) =
      __$$_CustomerDTOCopyWithImpl<$Res>;
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
class __$$_CustomerDTOCopyWithImpl<$Res>
    extends _$CustomerDTOCopyWithImpl<$Res, _$_CustomerDTO>
    implements _$$_CustomerDTOCopyWith<$Res> {
  __$$_CustomerDTOCopyWithImpl(
      _$_CustomerDTO _value, $Res Function(_$_CustomerDTO) _then)
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
    return _then(_$_CustomerDTO(
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
class _$_CustomerDTO implements _CustomerDTO {
  _$_CustomerDTO(
      {required this.id,
      required this.hubid,
      required this.street,
      required this.number,
      required this.postalcode,
      required this.city});

  factory _$_CustomerDTO.fromJson(Map<String, dynamic> json) =>
      _$$_CustomerDTOFromJson(json);

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
    return 'CustomerDTO(id: $id, hubid: $hubid, street: $street, number: $number, postalcode: $postalcode, city: $city)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CustomerDTO &&
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
  _$$_CustomerDTOCopyWith<_$_CustomerDTO> get copyWith =>
      __$$_CustomerDTOCopyWithImpl<_$_CustomerDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CustomerDTOToJson(
      this,
    );
  }
}

abstract class _CustomerDTO implements CustomerDTO {
  factory _CustomerDTO(
      {required final int id,
      required final int hubid,
      required final String street,
      required final String number,
      required final String postalcode,
      required final String city}) = _$_CustomerDTO;

  factory _CustomerDTO.fromJson(Map<String, dynamic> json) =
      _$_CustomerDTO.fromJson;

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
  _$$_CustomerDTOCopyWith<_$_CustomerDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
