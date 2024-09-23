import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/core/core.dart';
import 'package:flutter_hrm_inventory_pos_app/data/models/request/staff_request_model.dart';
import 'package:flutter_hrm_inventory_pos_app/data/models/response/department_response_model.dart';
import 'package:flutter_hrm_inventory_pos_app/data/models/response/designation_response_model.dart';
import 'package:flutter_hrm_inventory_pos_app/data/models/response/role_response_model.dart';
import 'package:flutter_hrm_inventory_pos_app/data/models/response/shift_response_model.dart';
import 'package:flutter_hrm_inventory_pos_app/presentation/home/bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';

class AddNewStaffMember extends StatefulWidget {
  const AddNewStaffMember({super.key});

  @override
  State<AddNewStaffMember> createState() => _AddNewStaffMemberState();
}

class _AddNewStaffMemberState extends State<AddNewStaffMember> {
  final statuses = ['Enable', 'Disable'];

  late final TextEditingController nameController;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController phoneNumberController;
  late final TextEditingController statusController;
  late final TextEditingController addressController;

  XFile? image;
  int? roleId;
  int? shiftId;
  int? departmentId;
  int? designationId;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    phoneNumberController = TextEditingController();
    statusController = TextEditingController();
    addressController = TextEditingController();

    context.read<GetRolesBloc>().add(const GetRolesEvent.getRoles());
    context.read<GetShiftsBloc>().add(const GetShiftsEvent.getShifts());
    context.read<GetDepartmentsBloc>().add(const GetDepartmentsEvent.getDepartments());
    context.read<GetDesignationsBloc>().add(const GetDesignationsEvent.getDesignations());
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    phoneNumberController.dispose();
    statusController.dispose();
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
                const Spacer(),
                InkWell(
                  onTap: () {
                    ImagePicker().pickImage(source: ImageSource.gallery).then((value) {
                      if (value != null) {
                        image = value;
                        setState(() {});
                      }
                    });
                  },
                  child: image != null
                      ? ClipOval(
                          child: Image.file(
                          File(image!.path),
                          height: 64.0,
                          width: 64.0,
                          fit: BoxFit.cover,
                        ))
                      : const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Upload Image',
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
                  child: BlocBuilder<GetRolesBloc, GetRolesState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        loaded: (roles) {
                          return CustomDropdown<Role>(
                            value: roles.first,
                            items: roles,
                            label: 'Role',
                            onChanged: (value) {
                              roleId = value?.id;
                              setState(() {});
                            },
                          );
                        },
                        orElse: () {
                          return const Center(child: CircularProgressIndicator());
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
            const SpaceHeight(16.0),
            CustomTextField(
              controller: nameController,
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
                  child: BlocBuilder<GetDepartmentsBloc, GetDepartmentsState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        loaded: (departments) {
                          return CustomDropdown<Department>(
                            value: departments.first,
                            items: departments,
                            label: 'Department',
                            onChanged: (value) {
                              departmentId = value?.id;
                              setState(() {});
                            },
                          );
                        },
                        orElse: () {
                          return const Center(child: CircularProgressIndicator());
                        },
                      );
                    },
                  ),
                ),
                const SpaceWidth(16.0),
                Flexible(
                  child: BlocBuilder<GetDesignationsBloc, GetDesignationsState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        loaded: (designations) {
                          return CustomDropdown<Designation>(
                            value: designations.first,
                            items: designations,
                            label: 'Designation',
                            onChanged: (value) {
                              designationId = value?.id;
                              setState(() {});
                            },
                          );
                        },
                        orElse: () {
                          return const Center(child: CircularProgressIndicator());
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
            const SpaceHeight(16.0),
            Row(
              children: [
                Flexible(
                  child: BlocBuilder<GetShiftsBloc, GetShiftsState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        loaded: (shifts) {
                          return CustomDropdown<Shift>(
                            value: shifts.first,
                            items: shifts,
                            label: 'Shift',
                            onChanged: (value) {
                              shiftId = value?.id;
                              setState(() {});
                            },
                          );
                        },
                        orElse: () {
                          return const Center(child: CircularProgressIndicator());
                        },
                      );
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
                    child: BlocConsumer<CreateStaffBloc, CreateStaffState>(
                      listener: (context, state) {
                        state.maybeWhen(
                          loaded: () {
                            context.read<GetStaffsBloc>().add(const GetStaffsEvent.getStaffs());
                            context.pop();
                          },
                          error: (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(e), backgroundColor: Colors.red),
                            );
                          },
                          orElse: () {},
                        );
                      },
                      builder: (context, state) {
                        return state.maybeWhen(
                          loading: () => const Center(child: CircularProgressIndicator()),
                          orElse: () {
                            return Button.filled(
                              onPressed: () {
                                final staff = StaffRequestModel(
                                  name: nameController.text,
                                  email: emailController.text,
                                  password: passwordController.text,
                                  username: nameController.text,
                                  isSuperadmin: 0,
                                  roleId: roleId!,
                                  userType: 'staff',
                                  loginEnabled: 1,
                                  status: 'active',
                                  phone: phoneNumberController.text,
                                  address: addressController.text,
                                  departmentId: departmentId!,
                                  designationId: designationId!,
                                  shiftId: shiftId!,
                                );

                                print(staff.toJson());

                                context.read<CreateStaffBloc>().add(CreateStaffEvent.createStaff(
                                      data: staff,
                                      photo: image!,
                                    ));
                              },
                              label: 'Create',
                            );
                          },
                        );
                      },
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
