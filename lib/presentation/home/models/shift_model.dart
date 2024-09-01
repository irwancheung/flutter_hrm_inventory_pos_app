class ShiftModel {
  final String name;
  final DateTime clockInTime;
  final DateTime clockOutTime;
  final int lateMarkAfter;
  final bool isSelfClocking;

  ShiftModel({
    required this.name,
    required this.clockInTime,
    required this.clockOutTime,
    required this.lateMarkAfter,
    required this.isSelfClocking,
  });

  String get selfClocking => isSelfClocking ? 'Yes' : 'No';
}

final shifts = [
  ShiftModel(
    name: 'Pagi',
    clockInTime: DateTime.now().subtract(const Duration(minutes: 20)),
    clockOutTime: DateTime.now(),
    lateMarkAfter: 20,
    isSelfClocking: true,
  ),
  ShiftModel(
    name: 'Pagi',
    clockInTime: DateTime.now().subtract(const Duration(minutes: 20)),
    clockOutTime: DateTime.now(),
    lateMarkAfter: 20,
    isSelfClocking: false,
  ),
  ShiftModel(
    name: 'Pagi',
    clockInTime: DateTime.now().subtract(const Duration(minutes: 20)),
    clockOutTime: DateTime.now(),
    lateMarkAfter: 20,
    isSelfClocking: true,
  ),
  ShiftModel(
    name: 'Pagi',
    clockInTime: DateTime.now().subtract(const Duration(minutes: 20)),
    clockOutTime: DateTime.now(),
    lateMarkAfter: 20,
    isSelfClocking: true,
  ),
  ShiftModel(
    name: 'Pagi',
    clockInTime: DateTime.now().subtract(const Duration(minutes: 20)),
    clockOutTime: DateTime.now(),
    lateMarkAfter: 20,
    isSelfClocking: false,
  ),
  ShiftModel(
    name: 'Pagi',
    clockInTime: DateTime.now().subtract(const Duration(minutes: 10)),
    clockOutTime: DateTime.now(),
    lateMarkAfter: 20,
    isSelfClocking: false,
  ),
  ShiftModel(
    name: 'Pagi',
    clockInTime: DateTime.now().subtract(const Duration(minutes: 20)),
    clockOutTime: DateTime.now(),
    lateMarkAfter: 20,
    isSelfClocking: true,
  ),
  ShiftModel(
    name: 'Pagi',
    clockInTime: DateTime.now().subtract(const Duration(minutes: 30)),
    clockOutTime: DateTime.now(),
    lateMarkAfter: 20,
    isSelfClocking: true,
  ),
  ShiftModel(
    name: 'Pagi',
    clockInTime: DateTime.now().subtract(const Duration(minutes: 20)),
    clockOutTime: DateTime.now(),
    lateMarkAfter: 20,
    isSelfClocking: true,
  ),
];
