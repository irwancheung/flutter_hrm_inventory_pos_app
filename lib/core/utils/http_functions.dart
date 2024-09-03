import 'dart:convert';

import 'package:http/http.dart' as http;

String getDataJsonFromResponse(http.Response response) {
  final body = jsonDecode(response.body) as Map<String, dynamic>;

  return jsonEncode(body['data']);
}

Map<String, String> setHeaders([Map<String, String>? headers]) {
  final h = {
    'content-type': 'application/json',
    'accept': 'application/json',
  };

  if (headers != null) {
    h.addAll(headers);
  }

  return h;
}
