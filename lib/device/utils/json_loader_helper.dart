import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class JsonLoaderHelper {
  Future<dynamic> loadJson(String jsonFile) async {
    String data = await rootBundle.loadString(
      'assets/json/test/$jsonFile',
    );
    return json.decode(data);
  }
}
