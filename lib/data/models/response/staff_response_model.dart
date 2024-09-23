import 'dart:convert';

import 'package:flutter_hrm_inventory_pos_app/data/models/response/department_response_model.dart';
import 'package:flutter_hrm_inventory_pos_app/data/models/response/designation_response_model.dart';
import 'package:flutter_hrm_inventory_pos_app/data/models/response/role_response_model.dart';
import 'package:flutter_hrm_inventory_pos_app/data/models/response/shift_response_model.dart';

class StaffResponseModel {
  final List<Staff>? staffs;

  StaffResponseModel({
    this.staffs,
  });

  factory StaffResponseModel.fromJson(String str) => StaffResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory StaffResponseModel.fromMap(Map<String, dynamic> json) => StaffResponseModel(
        staffs: json['staffs'] == null ? [] : List<Staff>.from(json['staffs']!.map((x) => Staff.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        'staffs': staffs == null ? [] : List<dynamic>.from(staffs!.map((x) => x.toMap())),
      };
}

class Staff {
  final int? id;
  final String? name;
  final String? email;
  final DateTime? emailVerifiedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? username;
  final int? companyId;
  final int? isSuperadmin;
  final int? roleId;
  final String? userType;
  final int? loginEnabled;
  final String? profileImage;
  final String? status;
  final String? phone;
  final String? address;
  final int? departmentId;
  final int? designationId;
  final int? shiftId;
  final Department? department;
  final Designation? designation;
  final Shift? shift;
  final Role? role;

  Staff({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
    this.username,
    this.companyId,
    this.isSuperadmin,
    this.roleId,
    this.userType,
    this.loginEnabled,
    this.profileImage,
    this.status,
    this.phone,
    this.address,
    this.departmentId,
    this.designationId,
    this.shiftId,
    this.department,
    this.designation,
    this.shift,
    this.role,
  });

  factory Staff.fromJson(String str) => Staff.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Staff.fromMap(Map<String, dynamic> json) => Staff(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        emailVerifiedAt: json['email_verified_at'] == null ? null : DateTime.parse(json['email_verified_at']),
        createdAt: json['created_at'] == null ? null : DateTime.parse(json['created_at']),
        updatedAt: json['updated_at'] == null ? null : DateTime.parse(json['updated_at']),
        username: json['username'],
        companyId: json['company_id'],
        isSuperadmin: json['is_superadmin'],
        roleId: json['role_id'],
        userType: json['user_type'],
        loginEnabled: json['login_enabled'],
        profileImage: json['profile_image'],
        status: json['status'],
        phone: json['phone'],
        address: json['address'],
        departmentId: json['department_id'],
        designationId: json['designation_id'],
        shiftId: json['shift_id'],
        department: json['department'] == null ? null : Department.fromMap(json['department']),
        designation: json['designation'] == null ? null : Designation.fromMap(json['designation']),
        shift: json['shift'] == null ? null : Shift.fromMap(json['shift']),
        role: json['role'] == null ? null : Role.fromMap(json['role']),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'email': email,
        'email_verified_at': emailVerifiedAt?.toIso8601String(),
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'username': username,
        'company_id': companyId,
        'is_superadmin': isSuperadmin,
        'role_id': roleId,
        'user_type': userType,
        'login_enabled': loginEnabled,
        'profile_image': profileImage,
        'status': status,
        'phone': phone,
        'address': address,
        'department_id': departmentId,
        'designation_id': designationId,
        'shift_id': shiftId,
        'department': department?.toMap(),
        'designation': designation?.toMap(),
        'shift': shift?.toMap(),
        'role': role?.toMap(),
      };
}
