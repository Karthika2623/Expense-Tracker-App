import 'package:expense_tracker_app/controller/auth_controller.dart';
import 'package:expense_tracker_app/controller/dashboard_controller.dart';
import 'package:expense_tracker_app/controller/expense_controller.dart';
import 'package:expense_tracker_app/controller/income_controller.dart';
import 'package:expense_tracker_app/controller/theme_controller.dart';
import 'package:get/get.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut<AuthController>(() => AuthController(), fenix: true);

    Get.lazyPut<ExpenseController>(() => ExpenseController(), fenix: true);

    Get.lazyPut<DashboardController>(
          () => DashboardController(),
      fenix: true,
    );
    Get.lazyPut<IncomeController>(
          () => IncomeController(),
      fenix: true,
    );
    Get.lazyPut<ThemeController>(
          () => ThemeController(),
      fenix: true,
    );
  }
}