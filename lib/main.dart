import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/core/core.dart';
import 'package:flutter_hrm_inventory_pos_app/data/data_sources/auth_remote_data_source.dart';
import 'package:flutter_hrm_inventory_pos_app/presentation/auth/bloc/login_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/presentation/auth/bloc/logout_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/presentation/auth/pages/splash_page.dart';
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
