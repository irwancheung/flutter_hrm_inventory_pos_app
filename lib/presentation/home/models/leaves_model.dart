enum LeaveStatus {
  pending,
  approve,
  rejected;

  bool get isPending => this == LeaveStatus.pending;
  bool get isApprove => this == LeaveStatus.approve;
  bool get isRejected => this == LeaveStatus.rejected;
}

class LeavesModel {
  final String user;
  final String leaveType;
  final DateTime startDate;
  final DateTime endDate;
  final LeaveStatus status;
  final String reason;
  final bool isHalfDay;

  LeavesModel({
    required this.user,
    required this.leaveType,
    required this.startDate,
    required this.endDate,
    required this.status,
    required this.reason,
    this.isHalfDay = false,
  });
}

final leaves = [
  LeavesModel(
    user: 'Fauzan',
    leaveType: 'Annual Leave',
    startDate: DateTime.now().subtract(const Duration(days: 21)),
    endDate: DateTime.now(),
    status: LeaveStatus.pending,
    reason: 'Lorem ipsum dolor bro',
  ),
  LeavesModel(
    user: 'Fauzan',
    leaveType: 'Annual Leave',
    startDate: DateTime.now().subtract(const Duration(days: 2)),
    endDate: DateTime.now(),
    status: LeaveStatus.approve,
    reason: 'Lorem ipsum dolor bro',
    isHalfDay: true,
  ),
  LeavesModel(
    user: 'Fauzan',
    leaveType: 'Annual Leave',
    startDate: DateTime.now().subtract(const Duration(days: 2)),
    endDate: DateTime.now(),
    status: LeaveStatus.approve,
    reason: 'Lorem ipsum dolor bro',
    isHalfDay: true,
  ),
  LeavesModel(
    user: 'Fauzan',
    leaveType: 'Annual Leave',
    startDate: DateTime.now().subtract(const Duration(days: 2)),
    endDate: DateTime.now(),
    status: LeaveStatus.rejected,
    reason: 'Lorem ipsum dolor bro',
  ),
];
