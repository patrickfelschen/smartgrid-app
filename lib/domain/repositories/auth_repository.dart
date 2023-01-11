import 'package:smartgrid/domain/entities/customer_entity.dart';

abstract class AuthRepository {
  Future<CustomerEntity?> getCurrentUser();

  Future<CustomerEntity> signUp(
    int id,
    int hubid,
    String street,
    String number,
    String postalcode,
    String city,
  );

  Future<CustomerEntity> updateCustomer(
    int id,
    int hubid,
    String street,
    String number,
    String postalcode,
    String city,
  );

  Future<CustomerEntity> signIn(int id);

  Future<void> signOut();
}
