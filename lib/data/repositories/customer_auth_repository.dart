import 'dart:convert';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartgrid/data/dtos/customer_creation_dto.dart';
import 'package:smartgrid/data/helpers/smart_grid_api.dart';
import 'package:smartgrid/domain/entities/customer_entity.dart';
import 'package:smartgrid/domain/repositories/auth_repository.dart';

import 'package:http/http.dart' as http;

import '../dtos/customer_dto.dart';

class CustomerAuthRepository implements AuthRepository {
  CustomerAuthRepository({required this.api, required this.client});

  final SmartGridApi api;
  final http.Client client;

  @override
  Stream<CustomerEntity?> authStateChanges() {
    // TODO: implement authStateChanges
    throw UnimplementedError();
  }

  @override
  Future<CustomerEntity> signUp(
    int id,
    int hubId,
    String street,
    String number,
    String postalcode,
    String city,
  ) async {
    CustomerCreationDTO customerCreationDTO = CustomerCreationDTO(
      id: id,
      hubId: hubId,
      street: street,
      number: number,
      postalcode: postalcode,
      city: city,
    );

    CustomerDTO customerDTO = await _postData(
      uri: api.customers(),
      body: customerCreationDTO.toMap(),
      builder: (data) => CustomerDTO.fromMap(data),
    );

    return CustomerDTO.fromDTO(customerDTO);
  }

  @override
  Future<CustomerEntity> signIn(int id) async {
    CustomerDTO customerDTO = await _getData(
      uri: api.customer(id),
      builder: (data) => CustomerDTO.fromMap(data),
    );

    return CustomerDTO.fromDTO(customerDTO);
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  Future<T> _getData<T>({
    required Uri uri,
    required T Function(dynamic data) builder,
  }) async {
    print("GET $uri");
    try {
      final response = await client.get(uri);
      switch (response.statusCode) {
        case 200:
          final data = json.decode(response.body);
          return builder(data);
        case 401:
          throw Exception("invalidApiKey");
        //throw const APIError.invalidApiKey();
        case 404:
          throw Exception("notFound");
        //throw const APIError.notFound();
        default:
          throw Exception("unknown");
        //throw const APIError.unknown();
      }
    } on SocketException catch (e) {
      throw Exception("noInternetConnection");
      //throw const APIError.noInternetConnection();
    }
  }

  Future<T> _postData<T>({
    required Uri uri,
    required Object body,
    required T Function(dynamic data) builder,
  }) async {
    print("POST $uri BODY $body");
    try {
      final response = await client.post(
        uri,
        body: body,
      );
      switch (response.statusCode) {
        case 200:
          final data = json.decode(response.body);
          return builder(data);
        case 401:
          throw Exception("invalidApiKey");
        //throw const APIError.invalidApiKey();
        case 404:
          throw Exception("notFound");
        //throw const APIError.notFound();
        default:
          throw Exception("unknown");
        //throw const APIError.unknown();
      }
    } on SocketException catch (e) {
      throw Exception("noInternetConnection");
      //throw const APIError.noInternetConnection();
    }
  }
}

final customerAuthRepositoryProvider = Provider<AuthRepository>((ref) {
  final customerAuthRepository = CustomerAuthRepository(
    api: SmartGridApi(),
    client: http.Client(),
  );
  // ref.onDispose(() => customerAuthRepository.signOut());
  return customerAuthRepository;
});
