// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_creation_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CustomerCreationDTO _$$_CustomerCreationDTOFromJson(
        Map<String, dynamic> json) =>
    _$_CustomerCreationDTO(
      id: json['id'] as int,
      street: json['street'] as String,
      number: json['number'] as String,
      postalcode: json['postalcode'] as String,
      city: json['city'] as String,
    );

Map<String, dynamic> _$$_CustomerCreationDTOToJson(
        _$_CustomerCreationDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'street': instance.street,
      'number': instance.number,
      'postalcode': instance.postalcode,
      'city': instance.city,
    };
