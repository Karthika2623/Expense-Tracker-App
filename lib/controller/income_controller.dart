import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/income_model.dart';
import '../services/income_service.dart';

class IncomeController extends GetxController {

  final IncomeService service = IncomeService();

  TextEditingController titleController =
  TextEditingController();

  TextEditingController amountController =
  TextEditingController();

  Rx<DateTime> selectedDate =
      DateTime.now().obs;

  RxList<IncomeModel> incomeList =
      <IncomeModel>[].obs;

  @override
  void onInit() {
    super.onInit();

    service.getIncome().listen((event) {
      incomeList.value = event;
    });
  }

  Future<void> addIncome() async {

    final income = IncomeModel(
      id: "",
      title: titleController.text,
      amount:
      double.parse(amountController.text),
      date: selectedDate.value,
    );

    await service.addIncome(income);

    titleController.clear();
    amountController.clear();

    Get.back();
  }

  Future<void> deleteIncome(String id) async {
    await service.deleteIncome(id);
  }

  double totalIncome() {

    double total = 0;

    for (var item in incomeList) {
      total += item.amount;
    }

    return total;
  }
}