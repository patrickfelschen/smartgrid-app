import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartgrid/data/dtos/customer_creation_dto.dart';
import 'package:smartgrid/data/repositories/customer_auth_repository.dart';
import 'package:smartgrid/domain/entities/customer_entity.dart';

class CustomerService {
  CustomerService(this.ref);

  final Ref ref;

  Future<CustomerEntity> signUp(CustomerCreationDTO creationDTO) async {
    CustomerEntity entity =
        await ref.read(customerAuthRepositoryProvider).signUp(
              creationDTO.id,
              creationDTO.street,
              creationDTO.number,
              creationDTO.postalcode,
              creationDTO.city,
            );
    return entity;
  }
}

final customerServiceProvider = Provider<CustomerService>((ref) {
  return CustomerService(ref);
});
