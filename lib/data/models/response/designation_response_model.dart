import 'dart:convert';

class DesignationResponseModel {
  final List<Designation>? designations;

  DesignationResponseModel({
    this.designations,
  });

  factory DesignationResponseModel.fromJson(String str) => DesignationResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DesignationResponseModel.fromMap(Map<String, dynamic> json) => DesignationResponseModel(
        designations: json['designations'] == null
            ? []
            : List<Designation>.from(json['designations']!.map((x) => Designation.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        'designations': designations == null ? [] : List<dynamic>.from(designations!.map((x) => x.toMap())),
      };
}

class Designation {
  final int? id;
  final int? companyId;
  final int? createdBy;
  final String? name;
  final String? description;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Designation({
    this.id,
    this.companyId,
    this.createdBy,
    this.name,
    this.description,
    this.createdAt,
    this.updatedAt,
  });

  factory Designation.fromJson(String str) => Designation.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Designation.fromMap(Map<String, dynamic> json) => Designation(
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
