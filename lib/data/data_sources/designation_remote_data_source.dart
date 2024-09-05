import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_hrm_inventory_pos_app/core/constants/variables.dart';
import 'package:flutter_hrm_inventory_pos_app/core/utils/http_functions.dart';
import 'package:flutter_hrm_inventory_pos_app/data/data_sources/auth_local_data_source.dart';
import 'package:flutter_hrm_inventory_pos_app/data/models/response/designation_response_model.dart';
import 'package:http/http.dart' as http;

class DesignationRemoteDataSource {
  static const _path = '/api/designations';

  Future<Either<String, DesignationResponseModel>> getDesignations() async {
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

    return right(DesignationResponseModel.fromJson(data));
  }

  Future<Either<String, String>> createDesignation({
    required String name,
    required String description,
  }) async {
    final authData = await AuthLocalDataSource().getAuthData();

    final url = Uri.parse('${Variables.baseUrl}$_path');
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

    return right('Designation created successfully');
  }

  Future<Either<String, String>> updateDesignation({
    required int id,
    required String name,
    required String description,
  }) async {
    final authData = await AuthLocalDataSource().getAuthData();

    final url = Uri.parse('${Variables.baseUrl}$_path/$id');
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

    return right('Designation updated successfully');
  }

  Future<Either<String, String>> deleteDesignation(int id) async {
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

    return right('Designation deleted successfully');
  }
}
