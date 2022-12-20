import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

enum HttpStatusCode { ok, error, noInternet, unknown }

enum HttpMethod { get, post, patch, delete }

class HttpRequestHelper {
  final http.Client client = http.Client();

  Future<T> sendRequest<T>({
    required Uri uri,
    required HttpMethod method,
    Object? body,
    required T Function(HttpStatusCode status, dynamic data) builder,
  }) async {
    //print("GET $uri");
    try {
      Response response;
      switch (method) {
        case HttpMethod.get:
          response = await client.get(uri);
          break;
        case HttpMethod.post:
          response = await client.post(
            uri,
            body: body,
          );
          break;
        case HttpMethod.patch:
          response = await client.patch(
            uri,
            body: body,
          );
          break;
        case HttpMethod.delete:
          response = await client.delete(
            uri,
            body: body,
          );
          break;
      }
      switch (response.statusCode) {
        case 200:
          final data = json.decode(response.body);
          return builder(HttpStatusCode.ok, data);
        case 400:
          final data = json.decode(response.body);
          return builder(HttpStatusCode.error, data);
        default:
          return builder(HttpStatusCode.unknown, null);
      }
    } on SocketException catch (_) {
      return builder(HttpStatusCode.noInternet, null);
    }
  }
}
