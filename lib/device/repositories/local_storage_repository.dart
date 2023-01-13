import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:smartgrid/data/models/customer_dto.dart';
import 'package:smartgrid/domain/repositories/local_storage_repository_interface.dart';

final localStorageRepositoryProvider =
    Provider<LocalStorageRepositoryInterface>((ref) {
  return LocalStorageRepository();
});

class LocalStorageRepository implements LocalStorageRepositoryInterface {
  final String userBoxName = "auth";
  final String userKeyName = "user";

  @override
  Future<bool> persistUserInformation(CustomerDTO dto) async {
    Box<String> userBox = await Hive.openBox(userBoxName);
    Map<String, dynamic> userJson = dto.toJson();
    String userJsonString = json.encode(userJson);
    try {
      await userBox.put(userKeyName, userJsonString);
    } catch (e) {
      return false;
    }
    return true;
  }

  @override
  Future<bool> deleteUserInformation() async {
    Box<String> userBox = await Hive.openBox(userBoxName);
    try {
      await userBox.delete(userKeyName);
    } catch (e) {
      return false;
    }
    return true;
  }

  @override
  Future<CustomerDTO> loadUserInformation() async {
    Box<String> userBox = await Hive.openBox(userBoxName);
    if (!userBox.containsKey(userKeyName)) {
      throw Exception("No user in box");
    }
    String? userJsonString = userBox.get(userKeyName);
    if (userJsonString == null || userJsonString.isEmpty) {
      throw Exception("User in box is null or empty");
    }
    Map<String, dynamic> userJson = json.decode(userJsonString);
    return CustomerDTO.fromJson(userJson);
  }
}
