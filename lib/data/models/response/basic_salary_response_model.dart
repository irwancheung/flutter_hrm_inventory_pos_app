import 'dart:convert';

class BasicSalaryResponseModel {
  final List<BasicSalary>? basicSalaries;

  BasicSalaryResponseModel({
    this.basicSalaries,
  });

  factory BasicSalaryResponseModel.fromJson(String str) => BasicSalaryResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BasicSalaryResponseModel.fromMap(Map<String, dynamic> json) => BasicSalaryResponseModel(
        basicSalaries: json['basic_salaries'] == null
            ? []
            : List<BasicSalary>.from(json['basic_salaries']!.map((x) => BasicSalary.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        'basic_salaries': basicSalaries == null ? [] : List<dynamic>.from(basicSalaries!.map((x) => x.toMap())),
      };
}

class BasicSalary {
  final int? id;
  final int? companyId;
  final int? userId;
  final String? basicSalary;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  BasicSalary({
    this.id,
    this.companyId,
    this.userId,
    this.basicSalary,
    this.createdAt,
    this.updatedAt,
  });

  factory BasicSalary.fromJson(String str) => BasicSalary.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BasicSalary.fromMap(Map<String, dynamic> json) => BasicSalary(
        id: json['id'],
        companyId: json['company_id'],
        userId: json['user_id'],
        basicSalary: json['basic_salary'],
        createdAt: json['created_at'] == null ? null : DateTime.parse(json['created_at']),
        updatedAt: json['updated_at'] == null ? null : DateTime.parse(json['updated_at']),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'company_id': companyId,
        'user_id': userId,
        'basic_salary': basicSalary,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };
}
