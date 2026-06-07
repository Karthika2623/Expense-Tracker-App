import 'package:expense_tracker_app/screens/login/login_screen.dart';
import 'package:expense_tracker_app/screens/register/register_screen.dart';
import 'package:get/get.dart';
abstract class AppRoutes {

  static const login = "/login";
  static const register = "/register";
  static const home = "/home";
}


class AppPages {
  static final routes = [

    GetPage(
      name: AppRoutes.login,
      page: () => LoginScreen(),
    ),

    GetPage(
      name: AppRoutes.register,
      page: () => RegisterScreen(),
    ),

  ];
}