import 'package:expense_tracker_app/controller/expense_controller.dart';
import 'package:expense_tracker_app/screens/edit_expense/edit_expense_screen.dart';
import 'package:expense_tracker_app/screens/transactions/transactions_screen.dart';
import 'package:expense_tracker_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final ExpenseController controller = Get.put(ExpenseController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      body: SafeArea(
        child: Obx(() {
          double total = 0;

          for (var item in controller.expenseList) {
            total += item.amount;
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(20),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                const Text(
                  "Hello 👋",

                  style: TextStyle(color: Colors.grey, fontSize: 18),
                ),

                const SizedBox(height: 5),

                const Text(
                  "Expense Tracker",

                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 25),

                Container(
                  padding: const EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    gradient: AppColors.gradient,

                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Column(
                    children: [

                      const Text(
                        "Total Balance",
                        style: TextStyle(
                          color: Colors.white70,
                        ),
                      ),

                      const SizedBox(height: 10),

                      Text(
                        "₹ ${total.toStringAsFixed(2)}",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 20),

                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [

                          Column(
                            children: [
                              const Text(
                                "Income",
                                style: TextStyle(
                                  color: Colors.white70,
                                ),
                              ),
                              Text(
                                "₹${controller.totalIncome.value}",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),

                          Column(
                            children: [
                              const Text(
                                "Expenses",
                                style: TextStyle(
                                  color: Colors.white70,
                                ),
                              ),
                              Text(
                                "₹${total.toStringAsFixed(0)}",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      const SizedBox(height: 10),
                    ],
                  ),
                ),
                const SizedBox(height: 30),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Recent Transactions",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    GestureDetector(
                      onTap: () {
                        Get.to(
                              () => TransactionsScreen(),
                        );
                      },
                      child: const Text(
                        "View All",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                controller.expenseList.isEmpty
                    ? const Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: 100),
                          child: Text(
                            "No Expense Added",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.expenseList.length > 4
                            ? 4
                            : controller.expenseList.length,
                        itemBuilder: (context, index) {
                          final expense = controller.expenseList[index];
                          return Card(
                            margin: const EdgeInsets.only(bottom: 15),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: AppColors.primary.withOpacity(.1,
                                ),
                                child: const Icon(
                                  Icons.account_balance_wallet,
                                  color: AppColors.primary,
                                ),
                              ),
                              title: Text(
                                expense.category,

                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              subtitle: Text(expense.title,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),),

                              trailing: Column(
                                mainAxisAlignment: MainAxisAlignment.center,

                                children: [
                                  Text(
                                    "₹${expense.amount}",

                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  const SizedBox(height: 5),

                                  Row(
                                    mainAxisSize: MainAxisSize.min,

                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Get.to(
                                            () => EditExpenseScreen(
                                              expense: expense,
                                            ),
                                          );
                                        },

                                        child: const Icon(
                                          Icons.edit_outlined,

                                          color: Colors.blue,

                                          size: 20,
                                        ),
                                      ),

                                      const SizedBox(width: 10),

                                      GestureDetector(
                                        onTap: () {
                                          controller.deleteExpense(expense.id);
                                        },

                                        child: const Icon(
                                          Icons.delete_outline,

                                          color: Colors.red,

                                          size: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
