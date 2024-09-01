import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_hrm_inventory_pos_app/core/constants/variables.dart';
import 'package:flutter_hrm_inventory_pos_app/data/data_sources/auth_local_data_source.dart';
import 'package:flutter_hrm_inventory_pos_app/data/models/response/auth_response_model.dart';
import 'package:http/http.dart' as http;

class AuthRemoteDataSource {
  Future<Either<String, AuthResponseModel>> login({
    required String email,
    required String password,
  }) async {
    final url = Uri.parse('${Variables.baseUrl}/api/login');
    final headers = _setHeaders();
    final body = {
      'email': email,
      'password': password,
    };

    final response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(body),
    );

    if (response.statusCode != 200) return left(response.body);

    final responseBody = jsonDecode(response.body) as Map<String, dynamic>;

    return right(AuthResponseModel.fromJson(jsonEncode(responseBody['data'])));
  }

  Future<Either<String, String>> logout() async {
    final authData = await AuthLocalDataSource().getAuthData();

    final url = Uri.parse('${Variables.baseUrl}/api/logout');
    final headers = _setHeaders({
      'Authorization': 'Bearer ${authData.token}',
    });

    AuthLocalDataSource().removeAuthData();

    final response = await http.post(
      url,
      headers: headers,
    );

    if (response.statusCode != 200) return left(response.body);

    return right('Logout success');
  }

  Map<String, String> _setHeaders([Map<String, String>? headers]) {
    final h = {
      'content-type': 'application/json',
      'accept': 'application/json',
    };

    if (headers != null) {
      h.addAll(headers);
    }

    return h;
  }
}
