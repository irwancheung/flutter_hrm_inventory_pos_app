import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/core/core.dart';
import 'package:flutter_hrm_inventory_pos_app/data/data_sources/auth_local_data_source.dart';
import 'package:flutter_hrm_inventory_pos_app/presentation/auth/bloc/login_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/presentation/home/pages/main_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: Assets.images.bgLogin.image(
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 100.0, vertical: 50.0),
              children: [
                Padding(
                  padding: const EdgeInsets.all(85.0),
                  child: Assets.images.logoPrimary.image(),
                ),
                const SpaceHeight(30.0),
                CustomTextField(
                  showLabel: false,
                  controller: emailController,
                  label: 'Email Address',
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Assets.icons.email.svg(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                ),
                const SpaceHeight(18.0),
                CustomTextField(
                  showLabel: false,
                  controller: passwordController,
                  label: 'Password',
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Assets.icons.password.svg(),
                  ),
                  obscureText: true,
                ),
                const SpaceHeight(80.0),
                BlocConsumer<LoginBloc, LoginState>(
                  listener: (context, state) {
                    state.maybeWhen(
                      orElse: () {},
                      loaded: (model) {
                        AuthLocalDataSource().saveAuthData(model);
                        context.pushReplacement(const MainPage());
                      },
                      error: (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(e), backgroundColor: Colors.red),
                        );
                      },
                    );
                  },
                  builder: (context, state) {
                    return state.maybeWhen(
                      orElse: () {
                        return Button.filled(
                          onPressed: () {
                            context.read<LoginBloc>().add(
                                  LoginEvent.login(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  ),
                                );
                          },
                          label: 'Login',
                        );
                      },
                      loading: () {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
