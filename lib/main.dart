import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/core/core.dart';
import 'package:flutter_hrm_inventory_pos_app/data/data_sources/data_sources.dart';
import 'package:flutter_hrm_inventory_pos_app/presentation/auth/bloc/bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/presentation/auth/pages/splash_page.dart';
import 'package:flutter_hrm_inventory_pos_app/presentation/home/bloc/bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginBloc(AuthRemoteDataSource())),
        BlocProvider(create: (context) => LogoutBloc(AuthRemoteDataSource())),
        BlocProvider(create: (context) => GetDepartmentsBloc(DepartmentRemoteDataSource())),
        BlocProvider(create: (context) => CreateDepartmentBloc(DepartmentRemoteDataSource())),
        BlocProvider(create: (context) => UpdateDepartmentBloc(DepartmentRemoteDataSource())),
        BlocProvider(create: (context) => DeleteDepartmentBloc(DepartmentRemoteDataSource())),
        BlocProvider(create: (context) => GetDesignationsBloc(DesignationRemoteDataSource())),
        BlocProvider(create: (context) => CreateDesignationBloc(DesignationRemoteDataSource())),
        BlocProvider(create: (context) => UpdateDesignationBloc(DesignationRemoteDataSource())),
        BlocProvider(create: (context) => DeleteDesignationBloc(DesignationRemoteDataSource())),
        BlocProvider(create: (context) => GetHolidaysBloc(HolidayRemoteDataSource())),
        BlocProvider(create: (context) => CreateHolidayBloc(HolidayRemoteDataSource())),
        BlocProvider(create: (context) => UpdateHolidayBloc(HolidayRemoteDataSource())),
        BlocProvider(create: (context) => DeleteHolidayBloc(HolidayRemoteDataSource())),
        BlocProvider(create: (context) => GetBasicSalariesBloc(BasicSalaryRemoteDataSource())),
        BlocProvider(create: (context) => CreateBasicSalaryBloc(BasicSalaryRemoteDataSource())),
        BlocProvider(create: (context) => UpdateBasicSalaryBloc(BasicSalaryRemoteDataSource())),
        BlocProvider(create: (context) => DeleteBasicSalaryBloc(BasicSalaryRemoteDataSource())),
        BlocProvider(create: (context) => GetLeaveTypesBloc(LeaveTypeRemoteDataSource())),
        BlocProvider(create: (context) => CreateLeaveTypeBloc(LeaveTypeRemoteDataSource())),
        BlocProvider(create: (context) => UpdateLeaveTypeBloc(LeaveTypeRemoteDataSource())),
        BlocProvider(create: (context) => DeleteLeaveTypeBloc(LeaveTypeRemoteDataSource())),
        BlocProvider(create: (context) => GetShiftsBloc(ShiftRemoteDataSource())),
        BlocProvider(create: (context) => CreateShiftBloc(ShiftRemoteDataSource())),
        BlocProvider(create: (context) => UpdateShiftBloc(ShiftRemoteDataSource())),
        BlocProvider(create: (context) => DeleteShiftBloc(ShiftRemoteDataSource())),
        BlocProvider(create: (context) => GetRolesBloc(RoleRemoteDataSource())),
        BlocProvider(create: (context) => CreateRoleBloc(RoleRemoteDataSource())),
        BlocProvider(create: (context) => UpdateRoleBloc(RoleRemoteDataSource())),
        BlocProvider(create: (context) => DeleteRoleBloc(RoleRemoteDataSource())),
        BlocProvider(create: (context) => GetStaffsBloc(StaffRemoteDataSource())),
        BlocProvider(create: (context) => CreateStaffBloc(StaffRemoteDataSource())),
      ],
      child: MaterialApp(
        title: 'Flutter HRM Inventory POS App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
          scaffoldBackgroundColor: AppColors.background,
          dialogBackgroundColor: AppColors.white,
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: AppColors.white,
          ),
          bottomSheetTheme: const BottomSheetThemeData(backgroundColor: AppColors.white),
          dividerTheme: const DividerThemeData(color: AppColors.stroke),
          textTheme: GoogleFonts.interTextTheme(
            Theme.of(context).textTheme,
          ),
          appBarTheme: AppBarTheme(
            color: AppColors.white,
            elevation: 0,
            titleTextStyle: GoogleFonts.inter(
              color: AppColors.black,
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
            ),
            iconTheme: const IconThemeData(
              color: AppColors.black,
            ),
            centerTitle: true,
          ),
          listTileTheme: const ListTileThemeData(
            titleTextStyle: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
          ),
        ),
        home: const SplashPage(),
      ),
    );
  }
}
