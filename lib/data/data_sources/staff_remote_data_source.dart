import 'package:dartz/dartz.dart';
import 'package:flutter_hrm_inventory_pos_app/core/constants/variables.dart';
import 'package:flutter_hrm_inventory_pos_app/core/utils/http_functions.dart';
import 'package:flutter_hrm_inventory_pos_app/data/data_sources/auth_local_data_source.dart';
import 'package:flutter_hrm_inventory_pos_app/data/models/request/staff_request_model.dart';
import 'package:flutter_hrm_inventory_pos_app/data/models/response/staff_response_model.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class StaffRemoteDataSource {
  static const _path = '/api/staffs';

  Future<Either<String, StaffResponseModel>> getStaffs() async {
    final authData = await AuthLocalDataSource().getAuthData();

    final url = Uri.parse('${Variables.baseUrl}$_path');
    final headers = setHeaders({'Authorization': 'Bearer ${authData.token}'});

    final response = await http.get(
      url,
      headers: headers,
    );

    if (response.statusCode != 200) return left(response.body);

    final data = getDataJsonFromResponse(response);

    return right(StaffResponseModel.fromJson(data));
  }

  Future<Either<String, String>> createStaff({
    required StaffRequestModel data,
    required XFile photo,
  }) async {
    final authData = await AuthLocalDataSource().getAuthData();

    final url = Uri.parse('${Variables.baseUrl}$_path');
    final headers = setHeaders({'Authorization': 'Bearer ${authData.token}'});
    final request = http.MultipartRequest('POST', url);
    request.headers.addAll(headers);
    request.fields.addAll(data.toMultipartRequestFields());
    request.files.add(await http.MultipartFile.fromPath('profile_image', photo.path));

    final response = await request.send();
    if (response.statusCode != 201) return left(await response.stream.bytesToString());

    return right('Staff created successfully');
  }
}
