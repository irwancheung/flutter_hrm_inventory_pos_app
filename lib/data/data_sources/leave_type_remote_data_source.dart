import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_hrm_inventory_pos_app/core/constants/variables.dart';
import 'package:flutter_hrm_inventory_pos_app/core/utils/http_functions.dart';
import 'package:flutter_hrm_inventory_pos_app/data/data_sources/auth_local_data_source.dart';
import 'package:flutter_hrm_inventory_pos_app/data/models/response/leave_type_response_model.dart';
import 'package:http/http.dart' as http;

class LeaveTypeRemoteDataSource {
  static const _path = '/api/leave-types';

  Future<Either<String, LeaveTypeResponseModel>> getLeaveTypes() async {
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

    return right(LeaveTypeResponseModel.fromJson(data));
  }

  Future<Either<String, String>> createLeaveType({
    required String name,
    required bool isPaid,
    required int totalLeaves,
    required int maxLeavePerMonth,
  }) async {
    final authData = await AuthLocalDataSource().getAuthData();

    final url = Uri.parse('${Variables.baseUrl}$_path');
    final headers = setHeaders({
      'Authorization': 'Bearer ${authData.token}',
    });

    final body = {
      'name': name,
      'is_paid': isPaid,
      'total_leaves': totalLeaves,
      'max_leave_per_month': maxLeavePerMonth,
    };

    final response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(body),
    );

    if (response.statusCode != 201) return left(response.body);

    return right('Leave type created successfully');
  }

  Future<Either<String, String>> updateLeaveType({
    required int id,
    required String name,
    required bool isPaid,
    required int totalLeaves,
    required int maxLeavePerMonth,
  }) async {
    final authData = await AuthLocalDataSource().getAuthData();

    final url = Uri.parse('${Variables.baseUrl}$_path/$id');
    final headers = setHeaders({
      'Authorization': 'Bearer ${authData.token}',
    });

    final body = {
      'id': id,
      'name': name,
      'is_paid': isPaid,
      'total_leaves': totalLeaves,
      'max_leave_per_month': maxLeavePerMonth,
    };

    final response = await http.put(
      url,
      headers: headers,
      body: jsonEncode(body),
    );

    if (response.statusCode != 200) return left(response.body);

    return right('Leave type updated successfully');
  }

  Future<Either<String, String>> deleteLeaveType(int id) async {
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

    return right('Leave type deleted successfully');
  }
}
