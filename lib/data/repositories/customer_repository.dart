import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartgrid/data/helpers/http_request_helper.dart';
import 'package:smartgrid/data/helpers/smart_grid_api.dart';
import 'package:smartgrid/data/models/customer_creation_dto.dart';
import 'package:smartgrid/data/models/customer_dto.dart';
import 'package:smartgrid/domain/entities/customer_entity.dart';
import 'package:smartgrid/domain/repositories/auth_repository_interface.dart';

final customerRepositoryProvider = Provider<AuthRepositoryInterface>((ref) {
  final customerAuthRepository = CustomerAuthRepository(
    api: SmartGridApi(),
    requestHelper: HttpRequestHelper(),
  );
  return customerAuthRepository;
});

class CustomerAuthRepository implements AuthRepositoryInterface {
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
    int hubid,
    String street,
    String number,
    String postalcode,
    String city,
  ) async {
    CustomerCreationDTO customerCreationDTO = CustomerCreationDTO(
      id: id,
      hubid: hubid,
      street: street,
      number: number,
      postalcode: postalcode,
      city: city,
    );

    CustomerDTO customerDTO = await requestHelper.sendRequest(
      uri: api.customers(),
      method: HttpMethod.post,
      body: customerCreationDTO.toJson(),
      builder: (status, data) {
        if (status == HttpStatusCode.ok) {
          return CustomerDTO.fromJson(data);
        }
        throw Exception(data);
      },
    );

    return CustomerDTO.fromDTO(customerDTO);
  }

  @override
  Future<CustomerEntity> updateCustomer(
    int id,
    int hubid,
    String street,
    String number,
    String postalcode,
    String city,
  ) async {
    CustomerCreationDTO updateDTO = CustomerCreationDTO(
      id: id,
      hubid: hubid,
      street: street,
      number: number,
      postalcode: postalcode,
      city: city,
    );

    CustomerDTO customerDTO = await requestHelper.sendRequest(
      uri: api.customer(id),
      method: HttpMethod.patch,
      body: updateDTO.toJson(),
      builder: (status, data) {
        if (status == HttpStatusCode.ok) {
          return CustomerDTO.fromJson(data);
        }
        throw Exception(data);
      },
    );

    return CustomerDTO.fromDTO(customerDTO);
  }

  @override
  Future<CustomerEntity> signIn(int customerId) async {
    CustomerDTO customerDTO = await requestHelper.sendRequest(
      uri: api.customer(customerId),
      method: HttpMethod.get,
      builder: (status, data) {
        if (status == HttpStatusCode.ok) {
          return CustomerDTO.fromJson(data);
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
