import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {

  RxBool isDark = false.obs;

  void changeTheme(bool value) {

    isDark.value = value;

    Get.changeThemeMode(
      value ? ThemeMode.dark : ThemeMode.light,
    );
  }
}