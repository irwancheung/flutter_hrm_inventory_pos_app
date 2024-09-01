import 'package:flutter_hrm_inventory_pos_app/data/models/response/auth_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthLocalDataSource {
  Future<void> saveAuthData(AuthResponseModel model) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_data', model.toJson());
  }

  Future<void> removeAuthData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_data');
  }

  Future<AuthResponseModel> getAuthData() async {
    final prefs = await SharedPreferences.getInstance();
    final json = prefs.getString('auth_data');

    return AuthResponseModel.fromJson(json!);
  }

  Future<bool> isUserLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey('auth_data');
  }

  Future<User> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final authData = prefs.getString('auth_data');
    final model = AuthResponseModel.fromJson(authData!);

    return model.user!;
  }
}
