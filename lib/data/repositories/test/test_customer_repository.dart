import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartgrid/data/dtos/customer_dto.dart';
import 'package:smartgrid/device/utils/json_loader_helper.dart';
import 'package:smartgrid/domain/entities/customer_entity.dart';

import '../../../domain/repositories/auth_repository.dart';

class TestCustomerRepository implements AuthRepository {
  final JsonLoaderHelper jsonLoaderHelper;

  TestCustomerRepository({
    required this.jsonLoaderHelper,
  });

  @override
  CustomerEntity? currentUser;

  @override
  Future<CustomerEntity?> getCurrentUser() async {
    await Future.delayed(const Duration(seconds: 1));
    return currentUser;
  }

  @override
  Future<CustomerEntity> signIn(int id) async {
    dynamic jsonData = await jsonLoaderHelper.loadJson(
      "customers_get_id_res.json",
    );
    await Future.delayed(const Duration(seconds: 2));
    CustomerDTO dto = CustomerDTO.fromMap(jsonData);
    CustomerEntity customer = CustomerDTO.fromDTO(dto);
    currentUser = customer;
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
    dynamic jsonData = await jsonLoaderHelper.loadJson(
      "customers_post_res.json",
    );
    CustomerDTO dto = CustomerDTO.fromMap(jsonData);
    CustomerEntity customer = CustomerDTO.fromDTO(dto);
    currentUser = customer;
    return customer;
  }

  @override
  Future<void> signOut() async {
    await Future.delayed(const Duration(seconds: 1));
    currentUser = null;
  }
}

final testCustomerRepositoryProvider = Provider<AuthRepository>((ref) {
  final customerAuthRepository = TestCustomerRepository(
    jsonLoaderHelper: JsonLoaderHelper(),
  );
  return customerAuthRepository;
});
