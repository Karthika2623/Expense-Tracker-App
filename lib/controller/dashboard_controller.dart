import 'package:expense_tracker_app/controller/expense_controller.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {

  final ExpenseController expenseController =
  Get.find();

  RxDouble totalExpense = 0.0.obs;

  RxInt totalTransaction = 0.obs;

  @override
  void onInit() {

    super.onInit();

    ever(

      expenseController.expenseList,

          (_) {

        calculate();

      },

    );

    calculate();

  }

  void calculate() {

    double total = 0;

    for (var expense in expenseController.expenseList) {

      total += expense.amount;

    }

    totalExpense.value = total;

    totalTransaction.value =
        expenseController.expenseList.length;

  }

}