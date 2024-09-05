import 'package:flutter/material.dart';

const List<String> _dayNames = [
  'Minggu',
  'Senin',
  'Selasa',
  'Rabu',
  'Kamis',
  'Jumat',
  'Sabtu',
];

const List<String> _monthNames = [
  'Januari',
  'Februari',
  'Maret',
  'April',
  'Mei',
  'Juni',
  'Juli',
  'Agustus',
  'September',
  'Oktober',
  'November',
  'Desember',
];

extension DateTimeExt on DateTime {
  String toFormattedDate() {
    final dayName = _dayNames[weekday - 1];
    final monthName = _monthNames[month - 1];
    return '$dayName, $day $monthName $year';
  }

  String toFormattedTime() {
    final String hour = this.hour.toString().padLeft(2, '0');
    final String minute = this.minute.toString().padLeft(2, '0');
    return '$hour:$minute WIB';
  }
}

extension TimeOfDayExt on TimeOfDay {
  String toFormattedTime({bool includeWIB = true}) {
    final String hour = this.hour.toString().padLeft(2, '0');
    final String minute = this.minute.toString().padLeft(2, '0');

    if (includeWIB) {
      return '$hour:$minute WIB';
    }

    return '$hour:$minute';
  }
}
