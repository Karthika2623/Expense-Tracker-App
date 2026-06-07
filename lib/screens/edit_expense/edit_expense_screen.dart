import 'package:expense_tracker_app/controller/expense_controller.dart';
import 'package:expense_tracker_app/models/category_model.dart';
import 'package:expense_tracker_app/models/expense_model.dart';
import 'package:expense_tracker_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditExpenseScreen extends StatefulWidget {
  final ExpenseModel expense;

  const EditExpenseScreen({
    super.key,
    required this.expense,
  });

  @override
  State<EditExpenseScreen> createState() => _EditExpenseScreenState();
}

class _EditExpenseScreenState extends State<EditExpenseScreen> {
  final ExpenseController controller = Get.find();

  @override
  void initState() {
    super.initState();

    // PRELOAD DATA ONCE (important fix)
    controller.titleController.text = widget.expense.title;
    controller.amountController.text = widget.expense.amount.toString();
    controller.noteController.text = widget.expense.note;
    controller.category.value = widget.expense.category;
    controller.selectedDate.value = widget.expense.date;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        title: const Text(
          "Edit Expense",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // AMOUNT
            const Text("Amount", style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 10),

            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                controller: controller.amountController,
                keyboardType: TextInputType.number,
                style: const TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  prefixText: "₹ ",
                ),
              ),
            ),

            const SizedBox(height: 20),

            // TITLE
            const Text("Title"),
            const SizedBox(height: 10),

            TextField(
              controller: controller.titleController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "Enter title",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // CATEGORY
            const Text("Category"),
            const SizedBox(height: 10),

            Obx(
                  () => Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: DropdownButton(
                  value: controller.category.value,
                  isExpanded: true,
                  underline: const SizedBox(),
                  items: categories.map((e) {
                    return DropdownMenuItem(
                      value: e.name,
                      child: Text("${e.icon} ${e.name}"),
                    );
                  }).toList(),
                  onChanged: (value) {
                    controller.category.value = value!;
                  },
                ),
              ),
            ),

            const SizedBox(height: 20),

            // NOTE
            const Text("Note"),
            const SizedBox(height: 10),

            TextField(
              controller: controller.noteController,
              maxLines: 3,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "Write note",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // DATE
            Obx(
                  () => ListTile(
                tileColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                leading: const Icon(Icons.calendar_month),
                title: Text(
                  controller.selectedDate.value.toString().split(" ")[0],
                ),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () async {
                  DateTime? date = await showDatePicker(
                    context: context,
                    firstDate: DateTime(2024),
                    lastDate: DateTime(2035),
                    initialDate: controller.selectedDate.value,
                  );

                  if (date != null) {
                    controller.selectedDate.value = date;
                  }
                },
              ),
            ),

            const SizedBox(height: 30),

            // UPDATE BUTTON
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () {
                  controller.updateExpense(widget.expense);
                  Get.back();
                },
                child: const Text(
                  "UPDATE EXPENSE",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}