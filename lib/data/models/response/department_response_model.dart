import 'dart:convert';

class DepartmentResponseModel {
  final List<Department>? departments;

  DepartmentResponseModel({
    this.departments,
  });

  factory DepartmentResponseModel.fromJson(String str) => DepartmentResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DepartmentResponseModel.fromMap(Map<String, dynamic> json) => DepartmentResponseModel(
        departments: json['departments'] == null
            ? []
            : List<Department>.from(json['departments']!.map((x) => Department.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        'departments': departments == null ? [] : List<dynamic>.from(departments!.map((x) => x.toMap())),
      };
}

class Department {
  final int? id;
  final int? companyId;
  final int? createdBy;
  final String? name;
  final String? description;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Department({
    this.id,
    this.companyId,
    this.createdBy,
    this.name,
    this.description,
    this.createdAt,
    this.updatedAt,
  });

  factory Department.fromJson(String str) => Department.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Department.fromMap(Map<String, dynamic> json) => Department(
        id: json['id'],
        companyId: json['company_id'],
        createdBy: json['created_by'],
        name: json['name'],
        description: json['description'],
        createdAt: json['created_at'] == null ? null : DateTime.parse(json['created_at']),
        updatedAt: json['updated_at'] == null ? null : DateTime.parse(json['updated_at']),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'company_id': companyId,
        'created_by': createdBy,
        'name': name,
        'description': description,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };

  @override
  String toString() {
    return name.toString();
  }
}
