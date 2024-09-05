import 'dart:convert';

class ShiftResponseModel {
  final List<Shift>? shifts;

  ShiftResponseModel({
    this.shifts,
  });

  factory ShiftResponseModel.fromJson(String str) => ShiftResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ShiftResponseModel.fromMap(Map<String, dynamic> json) => ShiftResponseModel(
        shifts: json['shifts'] == null ? [] : List<Shift>.from(json['shifts']!.map((x) => Shift.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        'shifts': shifts == null ? [] : List<dynamic>.from(shifts!.map((x) => x.toMap())),
      };
}

class Shift {
  final int? id;
  final int? companyId;
  final String? name;
  final String? clockInTime;
  final String? clockOutTime;
  final dynamic lateMarkAfter;
  final dynamic earlyClockInTime;
  final dynamic allowClockOutUntil;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Shift({
    this.id,
    this.companyId,
    this.name,
    this.clockInTime,
    this.clockOutTime,
    this.lateMarkAfter,
    this.earlyClockInTime,
    this.allowClockOutUntil,
    this.createdAt,
    this.updatedAt,
  });

  factory Shift.fromJson(String str) => Shift.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Shift.fromMap(Map<String, dynamic> json) => Shift(
        id: json['id'],
        companyId: json['company_id'],
        name: json['name'],
        clockInTime: json['clock_in_time'],
        clockOutTime: json['clock_out_time'],
        lateMarkAfter: json['late_mark_after'],
        earlyClockInTime: json['early_clock_in_time'],
        allowClockOutUntil: json['allow_clock_out_until'],
        createdAt: json['created_at'] == null ? null : DateTime.parse(json['created_at']),
        updatedAt: json['updated_at'] == null ? null : DateTime.parse(json['updated_at']),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'company_id': companyId,
        'name': name,
        'clock_in_time': clockInTime,
        'clock_out_time': clockOutTime,
        'late_mark_after': lateMarkAfter,
        'early_clock_in_time': earlyClockInTime,
        'allow_clock_out_until': allowClockOutUntil,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };
}
