import 'package:expense_tracker_app/models/expense_model.dart';
import 'package:expense_tracker_app/repository/expense_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExpenseController extends GetxController {

  final ExpenseRepository repository =
  ExpenseRepository();

  RxList<ExpenseModel> expenseList =
      <ExpenseModel>[].obs;
  RxString searchText="".obs;
  RxBool loading = false.obs;
  RxString selectedFilter = "All".obs;
  final titleController =
  TextEditingController();

  final amountController =
  TextEditingController();

  final noteController =
  TextEditingController();

  RxString category = "Food".obs;

  Rx<DateTime> selectedDate =
      DateTime.now().obs;

  @override
  void onInit() {

    super.onInit();

    repository.getExpenses().listen(

          (event) {

        expenseList.assignAll(event);

      },

    );

  }
  void clearForm() {

    titleController.clear();

    amountController.clear();

    noteController.clear();

    category.value = "Food";

    selectedDate.value = DateTime.now();

  }
  Future addExpense() async {

    loading.value = true;

    ExpenseModel expense = ExpenseModel(
      id: "",
      title: titleController.text,
      amount: double.parse(amountController.text),
      category: category.value,
      note: noteController.text,
      date: selectedDate.value,
    );

    await repository.addExpense(expense);

    clearForm();

    loading.value = false;

    Get.back();
  }  Future deleteExpense(String id) async {

    await repository.deleteExpense(id);

  }
  Future updateExpense(
      ExpenseModel expense,
      ) async {

    loading.value = true;

    ExpenseModel updateData = ExpenseModel(

      id: expense.id,

      title: titleController.text,

      amount: double.parse(
        amountController.text,
      ),

      category: category.value,

      note: noteController.text,

      date: selectedDate.value,

    );

    await repository.updateExpense(
      updateData,
    );

    loading.value = false;

    Get.back();
  }
  List<ExpenseModel> get filteredExpenses {

    final search = searchText.value.toLowerCase();

    return expenseList.where((e){

      return

        e.title.toLowerCase().contains(search)

            ||

            e.category.toLowerCase().contains(search)

            ||

            e.amount.toString().contains(search);

    }).toList();
  }
  List get filteredExpenseList {
    if (searchText.value.isEmpty) {
      return expenseList;
    }

    return expenseList.where((expense) {
      return expense.title
          .toLowerCase()
          .contains(searchText.value.toLowerCase()) ||
          expense.category
              .toLowerCase()
              .contains(searchText.value.toLowerCase());
    }).toList();
  }

///MonthlyExpense()
  double getMonthlyExpense() {

    double total = 0;

    DateTime now = DateTime.now();

    for (var item in expenseList) {

      if (item.date.month == now.month &&
          item.date.year == now.year) {

        total += item.amount;

      }
    }

    return total;
  }
///MonthlyTransactionCount()
  int getMonthlyTransactionCount() {

    DateTime now = DateTime.now();

    return expenseList.where((e) {

      return e.date.month == now.month &&
          e.date.year == now.year;

    }).length;

  }
  String currentMonth() {

    List months = [

      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December",

    ];

    return months[DateTime.now().month - 1];

  }
  RxDouble totalIncome = 0.0.obs;

  final TextEditingController incomeController =
  TextEditingController();
  void addIncome() {

    if (incomeController.text.isEmpty) return;

    totalIncome.value +=
        double.parse(incomeController.text);

    incomeController.clear();

    Get.back();

  }
  double getTotalExpense() {

    double total = 0;

    for (var item in expenseList) {

      total += item.amount;

    }

    return total;

  }
  double getBalance() {

    return totalIncome.value - getTotalExpense();

  }
}