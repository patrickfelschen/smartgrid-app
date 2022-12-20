import 'package:smartgrid/domain/entities/customer_entity.dart';

abstract class AuthRepository {
  Future<CustomerEntity?> getCurrentUser();

  Future<CustomerEntity> signUp(
    int id,
    int hubId,
    String street,
    String number,
    String postalcode,
    String city,
  );

  Future<CustomerEntity> signIn(int id);

  Future<void> signOut();
}
