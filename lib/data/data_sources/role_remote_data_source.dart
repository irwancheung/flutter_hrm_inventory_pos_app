import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_hrm_inventory_pos_app/core/constants/variables.dart';
import 'package:flutter_hrm_inventory_pos_app/core/utils/http_functions.dart';
import 'package:flutter_hrm_inventory_pos_app/data/data_sources/auth_local_data_source.dart';
import 'package:flutter_hrm_inventory_pos_app/data/models/response/role_response_model.dart';
import 'package:http/http.dart' as http;

class RoleRemoteDataSource {
  static const _path = '/api/roles';

  Future<Either<String, RoleResponseModel>> getRoles() async {
    final authData = await AuthLocalDataSource().getAuthData();

    final url = Uri.parse('${Variables.baseUrl}$_path');
    final headers = setHeaders({
      'Authorization': 'Bearer ${authData.token}',
    });

    final response = await http.get(
      url,
      headers: headers,
    );

    if (response.statusCode != 200) return left(response.body);

    final data = getDataJsonFromResponse(response);

    return right(RoleResponseModel.fromJson(data));
  }

  Future<Either<String, String>> createRole({
    required String name,
    required String displayName,
    required String description,
  }) async {
    final authData = await AuthLocalDataSource().getAuthData();

    final url = Uri.parse('${Variables.baseUrl}$_path');
    final headers = setHeaders({
      'Authorization': 'Bearer ${authData.token}',
    });

    final body = {
      'name': name,
      'displayName': displayName,
      'description': description,
    };

    final response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(body),
    );

    if (response.statusCode != 201) return left(response.body);

    return right('Role created successfully');
  }

  Future<Either<String, String>> updateRole({
    required int id,
    required String name,
    required String displayName,
    required String description,
  }) async {
    final authData = await AuthLocalDataSource().getAuthData();

    final url = Uri.parse('${Variables.baseUrl}$_path/$id');
    final headers = setHeaders({
      'Authorization': 'Bearer ${authData.token}',
    });

    final body = {
      'name': name,
      'displayName': displayName,
      'description': description,
    };

    final response = await http.put(
      url,
      headers: headers,
      body: jsonEncode(body),
    );

    if (response.statusCode != 200) return left(response.body);

    return right('Role updated successfully');
  }

  Future<Either<String, String>> deleteRole(int id) async {
    final authData = await AuthLocalDataSource().getAuthData();

    final url = Uri.parse('${Variables.baseUrl}$_path/$id');
    final headers = setHeaders({
      'Authorization': 'Bearer ${authData.token}',
    });

    final response = await http.delete(
      url,
      headers: headers,
    );

    if (response.statusCode != 200) return left(response.body);

    return right('Role deleted successfully');
  }
}
