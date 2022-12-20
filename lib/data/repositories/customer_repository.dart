import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartgrid/data/dtos/customer_creation_dto.dart';
import 'package:smartgrid/data/helpers/smart_grid_api.dart';
import 'package:smartgrid/domain/entities/customer_entity.dart';
import 'package:smartgrid/domain/repositories/auth_repository.dart';

import '../dtos/customer_dto.dart';
import '../helpers/http_request_helper.dart';

class CustomerAuthRepository implements AuthRepository {
  CustomerAuthRepository({
    required this.api,
    required this.requestHelper,
  });

  final SmartGridApi api;
  final HttpRequestHelper requestHelper;

  CustomerEntity? _currentUser;

  @override
  Future<CustomerEntity?> getCurrentUser() async {
    await Future.delayed(const Duration(seconds: 1));
    return _currentUser;
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

    CustomerDTO customerDTO = await requestHelper.sendRequest(
      uri: api.customers(),
      method: HttpMethod.post,
      body: customerCreationDTO.toMap(),
      builder: (status, data) {
        if (status == HttpStatusCode.ok) {
          return CustomerDTO.fromMap(data);
        }
        throw Exception(data);
      },
    );

    return CustomerDTO.fromDTO(customerDTO);
  }

  @override
  Future<CustomerEntity> signIn(int id) async {
    CustomerDTO customerDTO = await requestHelper.sendRequest(
      uri: api.customer(id),
      method: HttpMethod.get,
      builder: (status, data) {
        if (status == HttpStatusCode.ok) {
          return CustomerDTO.fromMap(data);
        }
        throw Exception(data);
      },
    );

    return CustomerDTO.fromDTO(customerDTO);
  }

  @override
  Future<void> signOut() async {
    await Future.delayed(const Duration(seconds: 1));
    _currentUser = null;
  }
}

final customerRepositoryProvider = Provider<AuthRepository>((ref) {
  final customerAuthRepository = CustomerAuthRepository(
    api: SmartGridApi(),
    requestHelper: HttpRequestHelper(),
  );
  // ref.onDispose(() => customerAuthRepository.signOut());
  return customerAuthRepository;
});
