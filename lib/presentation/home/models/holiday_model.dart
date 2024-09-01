class HolidayModel {
  final String holidayName;
  final DateTime datetime;

  HolidayModel({
    required this.holidayName,
    required this.datetime,
  });
}

final holidays = [
  HolidayModel(
    holidayName: 'Libur Cuti Bersama',
    datetime: DateTime.now(),
  ),
  HolidayModel(
    holidayName: 'Libur Hari Ulang Tahun Perusahaan',
    datetime: DateTime.now(),
  ),
  HolidayModel(
    holidayName: 'Libur Hari Kemerdekaan',
    datetime: DateTime.now(),
  ),
  HolidayModel(
    holidayName: 'Libur Hari Pahlawan',
    datetime: DateTime.now(),
  ),
];
