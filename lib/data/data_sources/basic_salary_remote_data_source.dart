import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_hrm_inventory_pos_app/core/constants/variables.dart';
import 'package:flutter_hrm_inventory_pos_app/core/utils/http_functions.dart';
import 'package:flutter_hrm_inventory_pos_app/data/data_sources/auth_local_data_source.dart';
import 'package:flutter_hrm_inventory_pos_app/data/models/response/basic_salary_response_model.dart';
import 'package:http/http.dart' as http;

class BasicSalaryRemoteDataSource {
  static const _path = '/api/basic-salaries';

  Future<Either<String, BasicSalaryResponseModel>> getBasicSalaries() async {
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

    return right(BasicSalaryResponseModel.fromJson(data));
  }

  Future<Either<String, String>> createBasicSalary({
    required int userId,
    required double basicSalary,
  }) async {
    final authData = await AuthLocalDataSource().getAuthData();

    final url = Uri.parse('${Variables.baseUrl}$_path');
    final headers = setHeaders({
      'Authorization': 'Bearer ${authData.token}',
    });

    final body = {
      'user_id': userId,
      'basic_salary': basicSalary,
    };

    final response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(body),
    );

    if (response.statusCode != 201) return left(response.body);

    return right('Basic salary created successfully');
  }

  Future<Either<String, String>> updateBasicSalary({
    required int id,
    required int userId,
    required double basicSalary,
  }) async {
    final authData = await AuthLocalDataSource().getAuthData();

    final url = Uri.parse('${Variables.baseUrl}$_path/$id');
    final headers = setHeaders({
      'Authorization': 'Bearer ${authData.token}',
    });

    final body = {
      'id': id,
      'user_id': userId,
      'basic_salary': basicSalary,
    };

    final response = await http.put(
      url,
      headers: headers,
      body: jsonEncode(body),
    );

    if (response.statusCode != 200) return left(response.body);

    return right('Basic salary updated successfully');
  }

  Future<Either<String, String>> deleteBasicSalary(int id) async {
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

    return right('Basic salary deleted successfully');
  }
}
