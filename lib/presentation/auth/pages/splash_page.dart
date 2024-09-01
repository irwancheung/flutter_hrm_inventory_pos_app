import 'package:flutter/material.dart';
import 'package:flutter_hrm_inventory_pos_app/core/core.dart';
import 'package:flutter_hrm_inventory_pos_app/data/data_sources/auth_local_data_source.dart';
import 'package:flutter_hrm_inventory_pos_app/presentation/auth/pages/login_page.dart';
import 'package:flutter_hrm_inventory_pos_app/presentation/home/pages/main_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: FutureBuilder(
        future: Future.delayed(const Duration(seconds: 2), () => AuthLocalDataSource().isUserLoggedIn()),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Padding(
              padding: const EdgeInsets.all(80.0),
              child: Center(
                child: Assets.images.logoWhite.image(),
              ),
            );
          }

          if (snapshot.hasData && snapshot.data) {
            return const MainPage();
          }

          return const LoginPage();
        },
      ),
    );
  }
}
