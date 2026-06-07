import 'package:expense_tracker_app/screens/bottomnavbar/bottom_nav_bar_screen.dart';
import 'package:expense_tracker_app/screens/dashboard/home.dart';
import 'package:expense_tracker_app/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {

  final AuthService authService = AuthService();

  RxBool loading = false.obs;

  TextEditingController emailController =
  TextEditingController();

  TextEditingController passwordController =
  TextEditingController();
  Future login() async {
    try {
      loading.value = true;

      UserCredential user = await authService.login(
        emailController.text.trim(),
        passwordController.text.trim(),
      );

      print(user.user?.uid);
      print(user.user?.email);
      print("LOGIN SUCCESS");

      Get.offAll(() => BottomNavScreen());

    } catch (e) {
      print("LOGIN ERROR : $e");

      Get.snackbar(
        "Error",
        e.toString(),
      );
    }

    loading.value = false;
  }
  // Future login() async {
  //
  //   try {
  //
  //     loading.value = true;
  //
  //     await authService.login(
  //
  //       emailController.text.trim(),
  //
  //       passwordController.text.trim(),
  //
  //     );
  //
  //     Get.snackbar(
  //
  //       "Success",
  //
  //       "Login Successfully",
  //
  //     );
  //     Get.offAll(
  //           () => HomeScreen(),
  //     );
  //   } catch (e) {
  //
  //     Get.snackbar(
  //
  //       "Error",
  //
  //       e.toString(),
  //
  //     );
  //
  //   }
  //
  //   loading.value = false;
  //
  // }

  Future register() async {

    try {

      loading.value = true;

      await authService.register(

        emailController.text.trim(),

        passwordController.text.trim(),

      );

      Get.back();

      Get.snackbar(

        "Success",

        "Account Created",

      );

    } catch (e) {

      Get.snackbar(

        "Error",

        e.toString(),

      );

    }

    loading.value = false;

  }

}