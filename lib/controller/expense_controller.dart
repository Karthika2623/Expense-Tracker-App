import 'package:expense_tracker_app/models/expense_model.dart';
import 'package:expense_tracker_app/repository/expense_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExpenseController extends GetxController {

  final ExpenseRepository repository =
  ExpenseRepository();

  RxList<ExpenseModel> expenseList =
      <ExpenseModel>[].obs;

  RxBool loading = false.obs;

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

}