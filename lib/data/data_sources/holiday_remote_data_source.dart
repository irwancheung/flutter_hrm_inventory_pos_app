import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_hrm_inventory_pos_app/core/constants/variables.dart';
import 'package:flutter_hrm_inventory_pos_app/core/utils/http_functions.dart';
import 'package:flutter_hrm_inventory_pos_app/data/data_sources/auth_local_data_source.dart';
import 'package:flutter_hrm_inventory_pos_app/data/models/response/holiday_response_model.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class HolidayRemoteDataSource {
  static const _path = '/api/holidays';

  Future<Either<String, HolidayResponseModel>> getHolidays() async {
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

    return right(HolidayResponseModel.fromJson(data));
  }

  Future<Either<String, String>> createHoliday({
    required String name,
    required int year,
    required int month,
    required DateTime date,
    required bool isWeekend,
  }) async {
    final authData = await AuthLocalDataSource().getAuthData();

    final url = Uri.parse('${Variables.baseUrl}$_path');
    final headers = setHeaders({
      'Authorization': 'Bearer ${authData.token}',
    });

    final body = {
      'name': name,
      'year': year,
      'month': month,
      'date': DateFormat('yyyy-MM-dd').format(date),
      'is_weekend': isWeekend,
    };

    final response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(body),
    );

    if (response.statusCode != 201) return left(response.body);

    return right('Holiday created successfully');
  }

  Future<Either<String, String>> updateHoliday({
    required int id,
    required String name,
    required int year,
    required int month,
    required DateTime date,
    required bool isWeekend,
  }) async {
    final authData = await AuthLocalDataSource().getAuthData();

    final url = Uri.parse('${Variables.baseUrl}$_path/$id');
    final headers = setHeaders({
      'Authorization': 'Bearer ${authData.token}',
    });

    final body = {
      'name': name,
      'year': year,
      'month': month,
      'date': DateFormat('yyyy-MM-dd').format(date),
      'is_weekend': isWeekend,
    };

    final response = await http.put(
      url,
      headers: headers,
      body: jsonEncode(body),
    );

    if (response.statusCode != 200) return left(response.body);

    return right('Holiday updated successfully');
  }

  Future<Either<String, String>> deleteHoliday(int id) async {
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

    return right('Holiday deleted successfully');
  }
}
