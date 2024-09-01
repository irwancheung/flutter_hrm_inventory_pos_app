class UserManagementModel {
  final String roleName;
  final String description;

  UserManagementModel({
    required this.roleName,
    required this.description,
  });
}

final List<UserManagementModel> userManagements = [
  UserManagementModel(
    roleName: 'Admin',
    description: 'Admin is allowed to manage everything of the app.',
  ),
  UserManagementModel(
    roleName: 'Cashier',
    description: 'Taking money for business',
  ),
  UserManagementModel(
    roleName: 'Stock Manager',
    description:
        'Stock Manager is allowed to manage everything related to stocks.',
  ),
  UserManagementModel(
    roleName: 'Salesman',
    description: 'Salesman is allowed to manage everything related to sales.',
  ),
];
