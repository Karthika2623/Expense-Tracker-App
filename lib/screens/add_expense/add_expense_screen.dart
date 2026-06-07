import 'package:expense_tracker_app/controller/expense_controller.dart';
import 'package:expense_tracker_app/models/category_model.dart';
import 'package:expense_tracker_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddExpenseScreen extends StatelessWidget {
  AddExpenseScreen({super.key});

  final ExpenseController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Add Expense",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            const Text(
              "Amount",
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 10),

            Container(

              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(

                color: Colors.white,

                borderRadius: BorderRadius.circular(25),

              ),

              child: TextField(

                controller: controller.amountController,

                keyboardType: TextInputType.number,

                style: const TextStyle(

                  fontSize: 40,

                  fontWeight: FontWeight.bold,

                ),

                decoration: const InputDecoration(

                  border: InputBorder.none,

                  prefixText: "₹ ",

                ),

              ),

            ),

            const SizedBox(height: 25),

            const Text(

              "Title",

              style: TextStyle(

                fontWeight: FontWeight.bold,

              ),

            ),

            const SizedBox(height: 10),

            TextField(

              controller: controller.titleController,

              decoration: InputDecoration(

                filled: true,

                fillColor: Colors.white,

                hintText: "Enter title",

                border: OutlineInputBorder(

                  borderRadius: BorderRadius.circular(18),

                  borderSide: BorderSide.none,

                ),

              ),

            ),

            const SizedBox(height: 20),

            const Text(

              "Category",

              style: TextStyle(

                fontWeight: FontWeight.bold,

              ),

            ),

            const SizedBox(height: 10),

            Obx(

                  () => Container(

                padding: const EdgeInsets.symmetric(horizontal: 15),

                decoration: BoxDecoration(

                  color: Colors.white,

                  borderRadius: BorderRadius.circular(18),

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

            const Text(

              "Note",

              style: TextStyle(

                fontWeight: FontWeight.bold,

              ),

            ),

            const SizedBox(height: 10),

            TextField(

              controller: controller.noteController,

              maxLines: 3,

              decoration: InputDecoration(

                filled: true,

                fillColor: Colors.white,

                hintText: "Write note",

                border: OutlineInputBorder(

                  borderRadius: BorderRadius.circular(18),

                  borderSide: BorderSide.none,

                ),

              ),

            ),

            const SizedBox(height: 25),

            ListTile(

              tileColor: Colors.white,

              shape: RoundedRectangleBorder(

                borderRadius: BorderRadius.circular(18),

              ),

              leading: const Icon(Icons.calendar_month),

              title: Obx(

                    () => Text(

                  controller.selectedDate.value

                      .toString()

                      .split(" ")[0],

                ),

              ),

              trailing: const Icon(Icons.arrow_forward_ios),

              onTap: () async {

                DateTime? date = await showDatePicker(

                  context: context,

                  firstDate: DateTime(2024),

                  lastDate: DateTime(2035),

                  initialDate: DateTime.now(),

                );

                if (date != null) {

                  controller.selectedDate.value = date;

                }

              },

            ),

            const SizedBox(height: 40),

            SizedBox(

              width: double.infinity,

              height: 58,

              child: ElevatedButton(

                style: ElevatedButton.styleFrom(

                  backgroundColor: AppColors.primary,

                  shape: RoundedRectangleBorder(

                    borderRadius: BorderRadius.circular(18),

                  ),

                ),

                onPressed: () {

                  controller.addExpense();

                },

                child: const Text(

                  "Save Expense",

                  style: TextStyle(

                    fontSize: 18,

                    color: Colors.white,

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