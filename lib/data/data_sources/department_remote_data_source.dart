import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_hrm_inventory_pos_app/core/constants/variables.dart';
import 'package:flutter_hrm_inventory_pos_app/core/utils/http_functions.dart';
import 'package:flutter_hrm_inventory_pos_app/data/data_sources/auth_local_data_source.dart';
import 'package:flutter_hrm_inventory_pos_app/data/models/response/department_response_model.dart';
import 'package:http/http.dart' as http;

class DepartmentRemoteDataSource {
  Future<Either<String, DepartmentResponseModel>> getDepartments() async {
    final authData = await AuthLocalDataSource().getAuthData();

    final url = Uri.parse('${Variables.baseUrl}/api/departments');
    final headers = setHeaders({
      'Authorization': 'Bearer ${authData.token}',
    });

    final response = await http.get(
      url,
      headers: headers,
    );

    if (response.statusCode != 200) return left(response.body);

    final data = getDataJsonFromResponse(response);

    return right(DepartmentResponseModel.fromJson(data));
  }

  Future<Either<String, String>> createDepartment({
    required String name,
    required String description,
  }) async {
    final authData = await AuthLocalDataSource().getAuthData();

    final url = Uri.parse('${Variables.baseUrl}/api/departments');
    final headers = setHeaders({
      'Authorization': 'Bearer ${authData.token}',
    });

    final body = {
      'name': name,
      'description': description,
    };

    final response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(body),
    );

    if (response.statusCode != 201) return left(response.body);

    return right('Department created successfully');
  }

  Future<Either<String, String>> updateDepartment({
    required int id,
    required String name,
    required String description,
  }) async {
    final authData = await AuthLocalDataSource().getAuthData();

    final url = Uri.parse('${Variables.baseUrl}/api/departments/$id');
    final headers = setHeaders({
      'Authorization': 'Bearer ${authData.token}',
    });

    final body = {
      'name': name,
      'description': description,
    };

    final response = await http.put(
      url,
      headers: headers,
      body: jsonEncode(body),
    );

    if (response.statusCode != 200) return left(response.body);

    return right('Department updated successfully');
  }

  Future<Either<String, String>> deleteDepartment(int id) async {
    final authData = await AuthLocalDataSource().getAuthData();

    final url = Uri.parse('${Variables.baseUrl}/api/departments/$id');
    final headers = setHeaders({
      'Authorization': 'Bearer ${authData.token}',
    });

    print(url);

    final response = await http.delete(
      url,
      headers: headers,
    );

    if (response.statusCode != 200) return left(response.body);

    return right('Department deleted successfully');
  }
}
