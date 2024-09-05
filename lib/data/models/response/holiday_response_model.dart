import 'dart:convert';

class HolidayResponseModel {
  final List<Holiday>? holidays;

  HolidayResponseModel({
    this.holidays,
  });

  factory HolidayResponseModel.fromJson(String str) => HolidayResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory HolidayResponseModel.fromMap(Map<String, dynamic> json) => HolidayResponseModel(
        holidays: json['holidays'] == null ? [] : List<Holiday>.from(json['holidays']!.map((x) => Holiday.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        'holidays': holidays == null ? [] : List<dynamic>.from(holidays!.map((x) => x.toMap())),
      };
}

class Holiday {
  final int? id;
  final int? companyId;
  final int? createdBy;
  final String? name;
  final DateTime? date;
  final int? month;
  final int? year;
  final int? isWeekend;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Holiday({
    this.id,
    this.companyId,
    this.createdBy,
    this.name,
    this.date,
    this.month,
    this.year,
    this.isWeekend,
    this.createdAt,
    this.updatedAt,
  });

  factory Holiday.fromJson(String str) => Holiday.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Holiday.fromMap(Map<String, dynamic> json) => Holiday(
        id: json['id'],
        companyId: json['company_id'],
        createdBy: json['created_by'],
        name: json['name'],
        date: json['date'] == null ? null : DateTime.parse(json['date']),
        month: json['month'],
        year: json['year'],
        isWeekend: json['is_weekend'],
        createdAt: json['created_at'] == null ? null : DateTime.parse(json['created_at']),
        updatedAt: json['updated_at'] == null ? null : DateTime.parse(json['updated_at']),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'company_id': companyId,
        'created_by': createdBy,
        'name': name,
        'date':
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        'month': month,
        'year': year,
        'is_weekend': isWeekend,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };
}
