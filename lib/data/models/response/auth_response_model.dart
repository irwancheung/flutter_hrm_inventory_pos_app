import 'dart:convert';

class AuthResponseModel {
  final User? user;
  final String? token;

  AuthResponseModel({
    this.user,
    this.token,
  });

  factory AuthResponseModel.fromJson(String str) => AuthResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AuthResponseModel.fromMap(Map<String, dynamic> json) => AuthResponseModel(
        user: json['user'] == null ? null : User.fromMap(json['user']),
        token: json['token'],
      );

  Map<String, dynamic> toMap() => {
        'user': user?.toMap(),
        'token': token,
      };
}

class User {
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
  final dynamic departmentId;
  final dynamic designationId;
  final dynamic shiftId;

  User({
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
  });

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
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
      };
}
