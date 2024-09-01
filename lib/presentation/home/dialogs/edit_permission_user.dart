import 'package:flutter/material.dart';

import 'package:flutter_hrm_inventory_pos_app/core/core.dart';

class EditPermissionUser extends StatefulWidget {
  const EditPermissionUser({super.key});

  @override
  State<EditPermissionUser> createState() => _EditPermissionUserState();
}

class _EditPermissionUserState extends State<EditPermissionUser> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.deviceWidth - 600.0,
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            const Text(
              'HRM Permission',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SpaceHeight(8.0),
            const Divider(),
            const SpaceHeight(8.0),
            Row(
              children: [
                const Expanded(
                  flex: 3,
                  child: Text(
                    'Shifts',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Checkbox(
                        value: true,
                        onChanged: (value) {},
                      ),
                      const Text('View'),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Checkbox(
                        value: false,
                        onChanged: (value) {},
                      ),
                      const Text('Add'),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Checkbox(
                        value: false,
                        onChanged: (value) {},
                      ),
                      const Text('Edit'),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Checkbox(
                        value: true,
                        onChanged: (value) {},
                      ),
                      const Text('Delete'),
                    ],
                  ),
                ),
              ],
            ),
            const SpaceHeight(8.0),
            const Divider(),
            const SpaceHeight(8.0),
            Row(
              children: [
                const Expanded(
                  flex: 3,
                  child: Text(
                    'Departments',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Checkbox(
                        value: true,
                        onChanged: (value) {},
                      ),
                      const Text('View'),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Checkbox(
                        value: false,
                        onChanged: (value) {},
                      ),
                      const Text('Add'),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Checkbox(
                        value: false,
                        onChanged: (value) {},
                      ),
                      const Text('Edit'),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Checkbox(
                        value: true,
                        onChanged: (value) {},
                      ),
                      const Text('Delete'),
                    ],
                  ),
                ),
              ],
            ),
            const SpaceHeight(8.0),
            const Divider(),
            const SpaceHeight(8.0),
            Row(
              children: [
                const Expanded(
                  flex: 3,
                  child: Text(
                    'Designations',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Checkbox(
                        value: true,
                        onChanged: (value) {},
                      ),
                      const Text('View'),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Checkbox(
                        value: false,
                        onChanged: (value) {},
                      ),
                      const Text('Add'),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Checkbox(
                        value: false,
                        onChanged: (value) {},
                      ),
                      const Text('Edit'),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Checkbox(
                        value: true,
                        onChanged: (value) {},
                      ),
                      const Text('Delete'),
                    ],
                  ),
                ),
              ],
            ),
            const SpaceHeight(8.0),
            const Divider(),
            const SpaceHeight(8.0),
            Row(
              children: [
                const Expanded(
                  flex: 3,
                  child: Text(
                    'Leaves',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Checkbox(
                        value: true,
                        onChanged: (value) {},
                      ),
                      const Text('View'),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Checkbox(
                        value: false,
                        onChanged: (value) {},
                      ),
                      const Text('Add'),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Checkbox(
                        value: false,
                        onChanged: (value) {},
                      ),
                      const Text('Edit'),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Checkbox(
                        value: true,
                        onChanged: (value) {},
                      ),
                      const Text('Delete'),
                    ],
                  ),
                ),
              ],
            ),
            const SpaceHeight(8.0),
            const Divider(),
            const SpaceHeight(8.0),
            Row(
              children: [
                const Expanded(
                  flex: 3,
                  child: Text(
                    'Payroll',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Checkbox(
                        value: true,
                        onChanged: (value) {},
                      ),
                      const Text('View'),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Checkbox(
                        value: false,
                        onChanged: (value) {},
                      ),
                      const Text('Add'),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Checkbox(
                        value: false,
                        onChanged: (value) {},
                      ),
                      const Text('Edit'),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Checkbox(
                        value: true,
                        onChanged: (value) {},
                      ),
                      const Text('Delete'),
                    ],
                  ),
                ),
              ],
            ),
            const SpaceHeight(8.0),
            const Divider(),
            const SpaceHeight(8.0),
            Row(
              children: [
                const Expanded(
                  flex: 3,
                  child: Text(
                    'Holiday',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Checkbox(
                        value: true,
                        onChanged: (value) {},
                      ),
                      const Text('View'),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Checkbox(
                        value: false,
                        onChanged: (value) {},
                      ),
                      const Text('Add'),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Checkbox(
                        value: false,
                        onChanged: (value) {},
                      ),
                      const Text('Edit'),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Checkbox(
                        value: true,
                        onChanged: (value) {},
                      ),
                      const Text('Delete'),
                    ],
                  ),
                ),
              ],
            ),
            const SpaceHeight(8.0),
            const Divider(),
            const SpaceHeight(8.0),
            Row(
              children: [
                const Expanded(
                  flex: 3,
                  child: Text(
                    'Attendance',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Checkbox(
                        value: true,
                        onChanged: (value) {},
                      ),
                      const Text('View'),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Checkbox(
                        value: false,
                        onChanged: (value) {},
                      ),
                      const Text('Add'),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Checkbox(
                        value: false,
                        onChanged: (value) {},
                      ),
                      const Text('Edit'),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Checkbox(
                        value: true,
                        onChanged: (value) {},
                      ),
                      const Text('Delete'),
                    ],
                  ),
                ),
              ],
            ),
            const SpaceHeight(8.0),
            const Divider(),
            const SpaceHeight(8.0),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Divider(),
              const SpaceHeight(16.0),
              Row(
                children: [
                  const Spacer(),
                  Flexible(
                    child: Button.outlined(
                      onPressed: () {},
                      label: 'Cancel',
                    ),
                  ),
                  const SpaceWidth(16.0),
                  Flexible(
                    child: Button.filled(
                      onPressed: () {},
                      label: 'Create',
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
