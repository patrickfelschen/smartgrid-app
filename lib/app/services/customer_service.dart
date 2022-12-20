import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartgrid/data/dtos/customer_creation_dto.dart';
import 'package:smartgrid/data/repositories/customer_repository.dart';
import 'package:smartgrid/domain/entities/customer_entity.dart';
import 'package:smartgrid/domain/repositories/auth_repository.dart';

import '../../data/repositories/test/test_customer_repository.dart';

class CustomerService {
  CustomerService(this.ref);

  final Ref ref;
  final Provider<AuthRepository> _authRepository =
      testCustomerRepositoryProvider;
  //final Provider<AuthRepository> _authRepository = customerAuthRepositoryProvider;

  Future<CustomerEntity> signUp(CustomerCreationDTO creationDTO) async {
    CustomerEntity entity = await ref.read(_authRepository).signUp(
          creationDTO.id,
          creationDTO.hubId,
          creationDTO.street,
          creationDTO.number,
          creationDTO.postalcode,
          creationDTO.city,
        );
    return entity;
  }

  Future<CustomerEntity> signIn(int id) async {
    CustomerEntity entity = await ref.read(_authRepository).signIn(id);
    return entity;
  }
}

final customerServiceProvider = Provider<CustomerService>((ref) {
  return CustomerService(ref);
});
