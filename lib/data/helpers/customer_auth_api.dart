import '../constants.dart';

/// Uri builder class for the Smart Grid API
class CustomerAuthApi {
  static const String _apiBaseUrl = kSmartGridApiBaseUrl;
  static const String _apiPath = "/api/v1/";

  Uri customers() => _buildUri(
        endpoint: "customers/",
      );

  Uri customer(int customerId) => _buildUri(
        endpoint: "customers/$customerId",
      );

  Uri _buildUri({
    required String endpoint,
  }) {
    return Uri(
      scheme: "http",
      host: _apiBaseUrl,
      path: "$_apiPath$endpoint",
    );
  }
}

//https://github.com/bizz84/open_weather_example_flutter/blob/main/lib/src/api/api.dart
