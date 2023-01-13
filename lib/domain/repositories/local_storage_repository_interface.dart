import 'package:smartgrid/data/models/customer_dto.dart';

abstract class LocalStorageRepositoryInterface {
  Future<bool> persistUserInformation(CustomerDTO dto);
  Future<CustomerDTO> loadUserInformation();
  Future<bool> deleteUserInformation();
}
