import 'package:smartgrid/utils/constants.dart';

/// Uri builder class for the Smart Grid API
class SmartGridApi {
  static const String _apiBaseUrl = Constants.smartGridApiBaseUrl;
  static const String _apiPath = "/App/";

  // POST Kunde erstellen
  Uri customers() => _buildUri(
        endpoint: "customers/",
      );

  // GET Kunde erhalten
  // PATCH Kunde bearbeiten
  Uri customer(int customerId) => _buildUri(
        endpoint: "customers/$customerId",
      );

  // GET Alle Geräte erhalten
  Uri devices(int customerId) => _buildUri(
        endpoint: "customers/$customerId/devices/",
      );

  // PATCH Gerät bearbeiten
  Uri device(int customerId, int deviceId) => _buildUri(
        endpoint: "customers/$customerId/devices/$deviceId",
      );

  // POST Ladeantrag erstellen
  Uri chargeRequests(int customerId, int deviceId) => _buildUri(
        endpoint: "customers/$customerId/devices/$deviceId/charge-requests/",
      );

  // GET Ladeplan erhalten
  Uri chargePlans(int customerId) => _buildUri(
        endpoint: "customers/$customerId/charge-plans/",
      );

  // GET Ladeplan erhalten
  // PATCH Ladeplan abbrechen
  Uri chargePlan(int customerId, int chargePlanId) => _buildUri(
        endpoint: "customers/$customerId/charge-plans/$chargePlanId",
      );

  // GET Dasboardinfo erhalten
  Uri dashboard(int customerId) => _buildUri(
        endpoint: "customers/$customerId/dashboard/",
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
