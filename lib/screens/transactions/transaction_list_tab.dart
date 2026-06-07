import 'package:expense_tracker_app/controller/expense_controller.dart';
import 'package:expense_tracker_app/utils/app_colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class TransactionsListTab extends StatelessWidget {
  TransactionsListTab({super.key});

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
      body: Obx(() {
        return SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: TextField(
                  onChanged: (value) {
                    controller.searchText.value = value;
                  },
                  decoration: InputDecoration(
                    hintText: "Search Expense...",
                    prefixIcon: const Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 5),
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
              const SizedBox(height:10),
              Obx(
                    () => Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),

                  padding: const EdgeInsets.all(20),

                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xff49C6FF), Color(0xff8A5CFF)],
                    ),

                    borderRadius: BorderRadius.circular(20),
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Text(
                        controller.currentMonth(),

                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                        ),
                      ),

                      const SizedBox(height: 10),

                      Text(
                        "₹ ${controller.getMonthlyExpense().toStringAsFixed(2)}",

                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 15),

                      Row(
                        children: [
                          const Icon(Icons.receipt_long, color: Colors.white),

                          const SizedBox(width: 8),

                          Text(
                            "${controller.getMonthlyTransactionCount()} Transactions",

                            style: const TextStyle(
                              color: Colors.white,

                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Obx(() {
                final data = controller.filteredExpenses;

                if (data.isEmpty) {
                  return const Padding(
                    padding: EdgeInsets.all(20),
                    child: Center(
                      child: Text("No Expenses Added"),
                    ),
                  );
                }

                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final expense = data[index];

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
                            backgroundColor: AppColors.primary.withOpacity(.15),
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
                                Text(expense.title),
                              ],
                            ),
                          ),

                          Text(
                            "₹${expense.amount}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }),
              // Obx(() {
              //   final data = controller.filteredExpenses;
              //
              //   if (data.isEmpty) {
              //     return const Center(child: Text("No Expenses Added"));
              //   }
              //
              //   return ListView.builder(
              //     padding: const EdgeInsets.symmetric(horizontal: 15),
              //     itemCount: data.length,
              //     itemBuilder: (context, index) {
              //       final expense = data[index];
              //
              //       return Container(
              //         margin: const EdgeInsets.only(bottom: 12),
              //         padding: const EdgeInsets.all(15),
              //         decoration: BoxDecoration(
              //           color: Colors.white,
              //           borderRadius: BorderRadius.circular(18),
              //         ),
              //         child: Row(
              //           children: [
              //             CircleAvatar(
              //               radius: 24,
              //               backgroundColor: AppColors.primary.withOpacity(.15),
              //               child: const Icon(
              //                 Icons.account_balance_wallet,
              //                 color: AppColors.primary,
              //               ),
              //             ),
              //
              //             const SizedBox(width: 12),
              //
              //             Expanded(
              //               child: Column(
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   Text(
              //                     expense.category,
              //                     style: const TextStyle(
              //                       fontSize: 16,
              //                       fontWeight: FontWeight.bold,
              //                     ),
              //                   ),
              //
              //                   const SizedBox(height: 4),
              //
              //                   Text(expense.title),
              //                 ],
              //               ),
              //             ),
              //
              //             Text(
              //               "₹${expense.amount}",
              //               style: const TextStyle(fontWeight: FontWeight.bold),
              //             ),
              //           ],
              //         ),
              //       );
              //     },
              //   );
              // }),
            ],
          ),
        );
      }),
    );
  }
}