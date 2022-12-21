import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartgrid/data/dtos/customer_dto.dart';
import 'package:smartgrid/domain/entities/customer_entity.dart';

import '../../../domain/repositories/auth_repository.dart';

import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class TestCustomerRepository implements AuthRepository {
  CustomerEntity? _currentUser;

  Future<Map<String, dynamic>> _loadJson(String jsonFile) async {
    String data = await rootBundle.loadString(
      'assets/json/test/$jsonFile',
    );
    Map<String, dynamic> jsonData = json.decode(data);
    return jsonData;
  }

  @override
  Future<CustomerEntity?> getCurrentUser() async {
    await Future.delayed(const Duration(seconds: 1));
    return _currentUser;
  }

  @override
  Future<CustomerEntity> signIn(int id) async {
    Map<String, dynamic> jsonData = await _loadJson(
      "customers_get_id_res.json",
    );
    CustomerDTO dto = CustomerDTO.fromMap(jsonData);
    CustomerEntity customer = CustomerDTO.fromDTO(dto);
    _currentUser = customer;
    return customer;
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
    Map<String, dynamic> jsonData = await _loadJson(
      "customers_post_res.json",
    );
    CustomerDTO dto = CustomerDTO.fromMap(jsonData);
    CustomerEntity customer = CustomerDTO.fromDTO(dto);
    _currentUser = customer;
    return customer;
  }

  @override
  Future<void> signOut() async {
    await Future.delayed(const Duration(seconds: 1));
    _currentUser = null;
  }
}

final testCustomerRepositoryProvider = Provider<AuthRepository>((ref) {
  final customerAuthRepository = TestCustomerRepository();
  return customerAuthRepository;
});
