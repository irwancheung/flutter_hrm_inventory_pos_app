import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:flutter_hrm_inventory_pos_app/core/core.dart';

class AddNewStaffMember extends StatefulWidget {
  const AddNewStaffMember({super.key});

  @override
  State<AddNewStaffMember> createState() => _AddNewStaffMemberState();
}

class _AddNewStaffMemberState extends State<AddNewStaffMember> {
  final statuses = ['Enable', 'Disable'];
  final shifts = ['Pagi', 'Siang', 'Malam'];

  late final TextEditingController warehouseController;
  late final TextEditingController roleController;
  late final TextEditingController nameController;
  late final TextEditingController usernameController;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController phoneNumberController;
  late final TextEditingController statusController;
  late final TextEditingController departmentController;
  late final TextEditingController designationController;
  late final TextEditingController shiftController;
  late final TextEditingController addressController;

  @override
  void initState() {
    warehouseController = TextEditingController();
    roleController = TextEditingController();
    nameController = TextEditingController();
    usernameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    phoneNumberController = TextEditingController();
    statusController = TextEditingController();
    departmentController = TextEditingController();
    designationController = TextEditingController();
    shiftController = TextEditingController();
    addressController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    warehouseController.dispose();
    roleController.dispose();
    nameController.dispose();
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    phoneNumberController.dispose();
    statusController.dispose();
    departmentController.dispose();
    designationController.dispose();
    shiftController.dispose();
    addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.deviceWidth - 600.0,
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(120.0),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Add New Staff Member',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SpaceHeight(4.0),
                Text('Please Complete Add New Staff Member'),
                SpaceHeight(16.0),
                Divider(),
              ],
            ),
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            Row(
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Profile Image',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SpaceHeight(4.0),
                    Text('Upload profile picture'),
                  ],
                ),
                const SpaceWidth(75.0),
                ClipOval(
                  child: CachedNetworkImage(
                    imageUrl: 'https://assets.ggwp.id/2023/06/R-1-640x360.jpg',
                    height: 64.0,
                    width: 64.0,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {},
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Delete',
                      style: TextStyle(
                        color: AppColors.red,
                      ),
                    ),
                  ),
                ),
                const SpaceWidth(8.0),
                InkWell(
                  onTap: () {},
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Update',
                      style: TextStyle(
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SpaceHeight(16.0),
            const Divider(),
            Row(
              children: [
                Flexible(
                  child: CustomTextField(
                    controller: warehouseController,
                    label: 'Warehouse',
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                  ),
                ),
                const SpaceWidth(16.0),
                Flexible(
                  child: CustomTextField(
                    controller: roleController,
                    label: 'Role',
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                  ),
                ),
              ],
            ),
            const SpaceHeight(16.0),
            CustomTextField(
              controller: nameController,
              label: 'Name',
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
            ),
            const SpaceHeight(16.0),
            CustomTextField(
              controller: usernameController,
              label: 'User Name',
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
            ),
            const SpaceHeight(16.0),
            CustomTextField(
              controller: emailController,
              label: 'Email Address',
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
            ),
            const SpaceHeight(16.0),
            CustomTextField(
              controller: passwordController,
              label: 'Password',
              obscureText: true,
              textInputAction: TextInputAction.next,
            ),
            const SpaceHeight(16.0),
            Row(
              children: [
                Flexible(
                  child: CustomTextField(
                    controller: phoneNumberController,
                    label: 'Phone Number',
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SpaceWidth(16.0),
                Flexible(
                  child: CustomDropdown(
                    value: statuses.first,
                    items: statuses,
                    label: 'Status',
                    onChanged: (value) {
                      statusController.text = value ?? '';
                      setState(() {});
                    },
                  ),
                ),
              ],
            ),
            const SpaceHeight(16.0),
            Row(
              children: [
                Flexible(
                  child: CustomTextField(
                    controller: departmentController,
                    label: 'Department',
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                  ),
                ),
                const SpaceWidth(16.0),
                Flexible(
                  child: CustomTextField(
                    controller: designationController,
                    label: 'Designation',
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                  ),
                ),
              ],
            ),
            const SpaceHeight(16.0),
            Row(
              children: [
                Flexible(
                  child: CustomDropdown(
                    value: shifts.first,
                    items: shifts,
                    label: 'Shift',
                    onChanged: (value) {
                      shiftController.text = value ?? '';
                      setState(() {});
                    },
                  ),
                ),
                const SpaceWidth(16.0),
                Flexible(
                  child: CustomTextField(
                    controller: addressController,
                    label: 'Adress',
                    keyboardType: TextInputType.text,
                  ),
                ),
              ],
            ),
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
