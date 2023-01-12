import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartgrid/data/models/customer_creation_dto.dart';
import 'package:smartgrid/data/repositories/customer_repository.dart';
import 'package:smartgrid/domain/entities/customer_entity.dart';
import 'package:smartgrid/domain/repositories/auth_repository_interface.dart';
import 'package:smartgrid/utils/constants.dart';

import '../../data/repositories/test/test_customer_repository.dart';

final customerServiceProvider = Provider<CustomerService>((ref) {
  return CustomerService(ref);
});

class CustomerService {
  CustomerService(this.ref);

  final Ref ref;

  final Provider<AuthRepositoryInterface> _authRepository = Constants.testMode
      ? testCustomerRepositoryProvider
      : customerRepositoryProvider;

  Future<CustomerEntity> getCurrentCustomer() async {
    CustomerEntity? currentCustomer =
        await ref.read(_authRepository).getCurrentUser();

    if (currentCustomer == null) {
      throw Exception();
    }

    return currentCustomer;
  }

  Future<CustomerEntity> signUp(CustomerCreationDTO creationDTO) async {
    CustomerEntity entity = await ref.read(_authRepository).signUp(
          creationDTO.id,
          // creationDTO.hubid,
          creationDTO.street,
          creationDTO.number,
          creationDTO.postalcode,
          creationDTO.city,
        );
    return entity;
  }

  Future<CustomerEntity> updateCustomer(CustomerCreationDTO creationDTO) async {
    CustomerEntity entity = await ref.read(_authRepository).updateCustomer(
          creationDTO.id,
          // creationDTO.hubid,
          creationDTO.street,
          creationDTO.number,
          creationDTO.postalcode,
          creationDTO.city,
        );
    return entity;
  }

  Future<CustomerEntity> signIn(int customerId) async {
    print("CUSTOMER_SERVICE::signIn::$customerId");
    CustomerEntity entity = await ref.read(_authRepository).signIn(customerId);
    return entity;
  }

  Future<void> signOut() async {
    await ref.read(_authRepository).signOut();
  }
}
