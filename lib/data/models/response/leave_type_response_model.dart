import 'dart:convert';

class LeaveTypeResponseModel {
  final List<LeaveType>? leaveTypes;

  LeaveTypeResponseModel({
    this.leaveTypes,
  });

  factory LeaveTypeResponseModel.fromJson(String str) => LeaveTypeResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LeaveTypeResponseModel.fromMap(Map<String, dynamic> json) => LeaveTypeResponseModel(
        leaveTypes: json['leave_types'] == null
            ? []
            : List<LeaveType>.from(json['leave_types']!.map((x) => LeaveType.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        'leave_types': leaveTypes == null ? [] : List<dynamic>.from(leaveTypes!.map((x) => x.toMap())),
      };
}

class LeaveType {
  final int? id;
  final int? companyId;
  final int? createdBy;
  final String? name;
  final int? isPaid;
  final int? totalLeaves;
  final int? maxLeavePerMonth;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  LeaveType({
    this.id,
    this.companyId,
    this.createdBy,
    this.name,
    this.isPaid,
    this.totalLeaves,
    this.maxLeavePerMonth,
    this.createdAt,
    this.updatedAt,
  });

  factory LeaveType.fromJson(String str) => LeaveType.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LeaveType.fromMap(Map<String, dynamic> json) => LeaveType(
        id: json['id'],
        companyId: json['company_id'],
        createdBy: json['created_by'],
        name: json['name'],
        isPaid: json['is_paid'],
        totalLeaves: json['total_leaves'],
        maxLeavePerMonth: json['max_leave_per_month'],
        createdAt: json['created_at'] == null ? null : DateTime.parse(json['created_at']),
        updatedAt: json['updated_at'] == null ? null : DateTime.parse(json['updated_at']),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'company_id': companyId,
        'created_by': createdBy,
        'name': name,
        'is_paid': isPaid,
        'total_leaves': totalLeaves,
        'max_leave_per_month': maxLeavePerMonth,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };
}
