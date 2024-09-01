import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/core/core.dart';
import 'package:flutter_hrm_inventory_pos_app/data/data_sources/auth_local_data_source.dart';
import 'package:flutter_hrm_inventory_pos_app/presentation/auth/bloc/logout_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/presentation/auth/pages/login_page.dart';

class AppBarWidget extends StatelessWidget {
  final String title;

  const AppBarWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Button.outlined(
            onPressed: () {},
            label: 'Clock In',
            icon: Assets.icons.clockIn.svg(),
            color: AppColors.background,
            textColor: AppColors.primary,
            fontSize: 14.0,
            width: 170.0,
          ),
          Button.outlined(
            onPressed: () {
              // context.push(const DashboardPosPage());
            },
            label: 'POS',
            icon: Assets.icons.pos.svg(),
            color: AppColors.background,
            textColor: AppColors.primary,
            fontSize: 14.0,
            width: 170.0,
          ),
          BlocConsumer<LogoutBloc, LogoutState>(
            listener: (context, state) {
              state.maybeWhen(
                orElse: () {},
                loaded: () {
                  AuthLocalDataSource().removeAuthData();
                  context.pushAndRemoveUntil(const LoginPage(), (route) => false);
                },
                error: (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(e), backgroundColor: Colors.red),
                  );
                },
              );
            },
            builder: (context, state) {
              return Button.outlined(
                onPressed: () {
                  context.read<LogoutBloc>().add(const LogoutEvent.logout());
                },
                label: 'Logout',
                icon: Assets.icons.logout.svg(),
                color: AppColors.background,
                textColor: AppColors.primary,
                fontSize: 14.0,
                width: 170.0,
              );
            },
          ),
        ],
      ),
    );
  }
}
