import 'dart:convert';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartgrid/data/helpers/customer_auth_api.dart';
import 'package:smartgrid/domain/entities/customer_entity.dart';
import 'package:smartgrid/domain/repositories/auth_repository.dart';

import 'package:http/http.dart' as http;

class CustomerAuthRepository implements AuthRepository {
  CustomerAuthRepository({required this.api, required this.client});

  final CustomerAuthApi api;
  final http.Client client;

  @override
  Stream<CustomerEntity?> authStateChanges() {
    // TODO: implement authStateChanges
    throw UnimplementedError();
  }

  @override
  Future<CustomerEntity> signUp(
    int id,
    String street,
    String number,
    String postalcode,
    String city,
  ) async {
    CustomerEntity customerEntity = CustomerEntity(
      id: id,
      street: street,
      number: number,
      postalcode: postalcode,
      city: city,
    );

    CustomerEntity createdEntity = await _postData(
      uri: api.customers(),
      body: customerEntity.toMap(),
      builder: (data) => CustomerEntity.fromMap(data, data.id),
    );

    //await Future.delayed(const Duration(seconds: 1));
    //print(customerEntity);
    return createdEntity;
  }

  @override
  Future<CustomerEntity> signIn(int id) {
    return _getData(
      uri: api.customer(id),
      builder: (data) => CustomerEntity.fromMap(data, data.id),
    );
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
    } on SocketException catch (_) {
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
    } on SocketException catch (_) {
      throw Exception("noInternetConnection");
      //throw const APIError.noInternetConnection();
    }
  }
}

final customerAuthRepositoryProvider = Provider<CustomerAuthRepository>((ref) {
  final customerAuthRepository = CustomerAuthRepository(
    api: CustomerAuthApi(),
    client: http.Client(),
  );
  // ref.onDispose(() => customerAuthRepository.signOut());
  return customerAuthRepository;
});
