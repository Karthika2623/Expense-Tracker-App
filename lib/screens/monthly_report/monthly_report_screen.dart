import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/expense_controller.dart';

class MonthlyReportScreen extends StatelessWidget {
  MonthlyReportScreen({super.key});

  final ExpenseController controller = Get.find();

  Map<String, double> getMonthlyData() {
    Map<String, double> data = {};

    for (var expense in controller.expenseList) {
      String month =
          "${expense.date.month.toString().padLeft(2, '0')}-${expense.date.year}";

      data[month] = (data[month] ?? 0) + expense.amount;
    }

    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F7FB),

      appBar: AppBar(
        title: const Text(
          "Monthly Report",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),

      body: Obx(() {
        final report = getMonthlyData();

        if (report.isEmpty) {
          return const Center(
            child: Text(
              "No Expense Data",
              style: TextStyle(fontSize: 18),
            ),
          );
        }

        final months = report.keys.toList();

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: months.length,
          itemBuilder: (context, index) {
            String month = months[index];

            return Container(
              margin: const EdgeInsets.only(bottom: 15),
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [

                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.blue.shade100,
                    child: const Icon(
                      Icons.calendar_month,
                      color: Colors.blue,
                    ),
                  ),

                  const SizedBox(width: 15),

                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [

                        Text(
                          month,
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 5),

                        const Text(
                          "Monthly Expense",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Text(
                    "₹${report[month]!.toStringAsFixed(0)}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            );
          },
        );
      }),
    );
  }
}