import 'dart:io';

import 'package:dio/dio.dart';

enum HttpStatusCode { ok, error, noInternet, unknown }

enum HttpMethod { get, post, patch, delete }

class HttpRequestHelper {
  //final http.Client client = http.Client();
  final Dio client = Dio();

  Future<T> sendRequest<T>({
    required Uri uri,
    required HttpMethod method,
    Object? body,
    required T Function(HttpStatusCode status, dynamic data) builder,
  }) async {
    try {
      Response response;

      switch (method) {
        case HttpMethod.get:
          print("HTTP_REQUEST_HELPER::sendRequest::GET::$uri");
          try {
            response = await client.get(uri.toString());
            print("HTTP_REQUEST_HELPER::sendRequest::Response: $response");
          } catch (e) {
            print(e);
            response = await client.get(uri.toString());
          }

          break;
        case HttpMethod.post:
          print("HTTP_REQUEST_HELPER::sendRequest::POST::$body");
          response = await client.post(
            uri.toString(),
            data: body,
            //headers: {"Content-Type": "application/json"},
          );
          print(response);
          break;
        case HttpMethod.patch:
          response = await client.patch(
            uri.toString(),
            data: body,
          );
          break;
        case HttpMethod.delete:
          response = await client.delete(
            uri.toString(),
            data: body,
          );
          break;
      }
      switch (response.statusCode) {
        case 200:
          final data = response.data;
          const status = HttpStatusCode.ok;
          print("\n$method\n$uri\n$status\n$body\n$data\n");
          return builder(status, data);
        case 500:
          //final data = response.data;
          const status = HttpStatusCode.error;
          print("\n$method\n$uri\n$status\n$body\n");
          return builder(status, null);
        default:
          const status = HttpStatusCode.unknown;
          print("\n$method\n$uri\n$status\n$body\n");
          return builder(status, null);
      }
    } on SocketException catch (_) {
      const status = HttpStatusCode.noInternet;
      print("\n$method\n$uri\n$status\n$body\n");
      return builder(status, null);
    }
  }
}
