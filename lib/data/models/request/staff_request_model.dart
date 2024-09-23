import 'dart:convert';

class StaffRequestModel {
  final String name;
  final String email;
  final String password;
  final String username;
  final int isSuperadmin;
  final int roleId;
  final String userType;
  final int loginEnabled;
  final String status;
  final String phone;
  final String address;
  final int departmentId;
  final int designationId;
  final int shiftId;

  StaffRequestModel({
    required this.name,
    required this.email,
    required this.password,
    required this.username,
    required this.isSuperadmin,
    required this.roleId,
    required this.userType,
    required this.loginEnabled,
    required this.status,
    required this.phone,
    required this.address,
    required this.departmentId,
    required this.designationId,
    required this.shiftId,
  });

  factory StaffRequestModel.fromJson(String str) => StaffRequestModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory StaffRequestModel.fromMap(Map<String, dynamic> json) => StaffRequestModel(
        name: json['name'],
        email: json['email'],
        password: json['password'],
        username: json['username'],
        isSuperadmin: json['is_superadmin'],
        roleId: json['role_id'],
        userType: json['user_type'],
        loginEnabled: json['login_enabled'],
        status: json['status'],
        phone: json['phone'],
        address: json['address'],
        departmentId: json['department_id'],
        designationId: json['designation_id'],
        shiftId: json['shift_id'],
      );

  Map<String, dynamic> toMap() => {
        'name': name,
        'email': email,
        'password': password,
        'username': username,
        'is_superadmin': isSuperadmin,
        'role_id': roleId,
        'user_type': userType,
        'login_enabled': loginEnabled,
        'status': status,
        'phone': phone,
        'address': address,
        'department_id': departmentId,
        'designation_id': designationId,
        'shift_id': shiftId,
      };

  Map<String, String> toMultipartRequestFields() => {
        'name': name,
        'email': email,
        'password': password,
        'username': username,
        'is_superadmin': isSuperadmin.toString(),
        'role_id': roleId.toString(),
        'user_type': userType,
        'login_enabled': loginEnabled.toString(),
        'status': status,
        'phone': phone,
        'address': address,
        'department_id': departmentId.toString(),
        'designation_id': designationId.toString(),
        'shift_id': shiftId.toString(),
      };
}
