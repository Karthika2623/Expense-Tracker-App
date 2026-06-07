import 'package:expense_tracker_app/controller/expense_controller.dart';
import 'package:expense_tracker_app/utils/app_colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransactionsScreen extends StatelessWidget {
  TransactionsScreen({super.key});

  final ExpenseController controller = Get.find();

  double getTotalExpense() {
    double total = 0;

    for (var item in controller.expenseList) {
      total += item.amount;
    }

    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F7FB),

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          "Transactions",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.tune, color: Colors.black54),
          ),
        ],
      ),

      body: Obx(() {
        return Column(
          children: [
            const SizedBox(height: 20),

            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(
                children: [
                  Text(
                    "₹ ${getTotalExpense().toStringAsFixed(0)}",
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 240,
                    child: BarChart(
                      BarChartData(
                        alignment: BarChartAlignment.spaceAround,
                        maxY: getTotalExpense() == 0 ? 100 : getTotalExpense(),

                        borderData: FlBorderData(show: false),

                        gridData: FlGridData(
                          show: true,
                          drawVerticalLine: false,
                          horizontalInterval: getTotalExpense() == 0
                              ? 20
                              : getTotalExpense() / 5,
                        ),

                        titlesData: FlTitlesData(
                          topTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),

                          rightTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),

                          leftTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              reservedSize: 35,
                              interval: getTotalExpense() == 0
                                  ? 20
                                  : getTotalExpense() / 5,
                              getTitlesWidget: (value, meta) {
                                return Text(
                                  "₹${value.toInt()}",
                                  style: const TextStyle(
                                    fontSize: 10,
                                    color: Colors.grey,
                                  ),
                                );
                              },
                            ),
                          ),

                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: (value, meta) {
                                int i = value.toInt();

                                if (i >= controller.expenseList.length) {
                                  return const SizedBox();
                                }

                                return Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: Text(
                                    "${i + 1}",
                                    style: const TextStyle(
                                      fontSize: 11,
                                      color: Colors.grey,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),

                        barGroups: List.generate(
                          controller.expenseList.length,
                          (index) {
                            final amount = controller.expenseList[index].amount;

                            return BarChartGroupData(
                              x: index,
                              barsSpace: 4,
                              barRods: [
                                BarChartRodData(
                                  toY: amount,
                                  width: 8,
                                  borderRadius: BorderRadius.circular(20),
                                  gradient: const LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    colors: [
                                      Color(0xff49C6FF),
                                      Color(0xff8A5CFF),
                                    ],
                                  ),
                                ),

                                BarChartRodData(
                                  toY: amount * 0.75,
                                  width: 8,
                                  borderRadius: BorderRadius.circular(20),
                                  gradient: const LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    colors: [
                                      Color(0xffFF8A65),
                                      Color(0xffFF5CA8),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: controller.expenseList.isEmpty
                  ? const Center(child: Text("No Expenses Added"))
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 15),

                      itemCount: controller.expenseList.length,

                      itemBuilder: (context, index) {
                        final expense = controller.expenseList[index];

                        return Container(
                          margin: const EdgeInsets.only(bottom: 12),

                          padding: const EdgeInsets.all(15),

                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(18),
                          ),

                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 24,
                                backgroundColor: AppColors.primary.withOpacity(
                                  0.15,
                                ),
                                child: const Icon(
                                  Icons.account_balance_wallet,
                                  color: AppColors.primary,
                                ),
                              ),

                              const SizedBox(width: 12),

                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      expense.category,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),

                                    const SizedBox(height: 4),

                                    Text(
                                      expense.title,
                                      style: const TextStyle(fontSize: 15),
                                    ),
                                  ],
                                ),
                              ),

                              Text(
                                "₹${expense.amount}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            ),
          ],
        );
      }),
    );
  }
}
