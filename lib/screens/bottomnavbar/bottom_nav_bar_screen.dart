import 'package:expense_tracker_app/controller/expense_controller.dart';
import 'package:expense_tracker_app/screens/add_expense/add_expense_screen.dart';
import 'package:expense_tracker_app/screens/dashboard/home.dart';
import 'package:expense_tracker_app/screens/transactions/transactions_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int currentIndex = 0;

  final List<Widget> screens = [HomeScreen(), TransactionsScreen()];
  final ExpenseController controller = Get.put(ExpenseController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: GestureDetector(
        onTap: () {
          controller.clearForm();
          Get.to(() => AddExpenseScreen());
        },
        child: Container(
          height: 65,
          width: 65,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [Color(0xff49C6FF), Color(0xff8A5CFF), Color(0xffFF8A65)],
            ),
          ),
          child: const Icon(Icons.add, color: Colors.white, size: 34),
        ),
      ),

      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),

        notchMargin: 10,

        elevation: 10,

        color: Colors.white,

        child: SizedBox(
          height: 65,

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,

            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    currentIndex = 0;
                  });
                },
                icon: Icon(
                  Icons.grid_view_rounded,
                  color: currentIndex == 0 ? Colors.blue : Colors.grey,
                  size: 28,
                ),
              ),
              const SizedBox(width: 40),
              IconButton(
                onPressed: () {
                  setState(() {
                    currentIndex = 1;
                  });
                },
                icon: Icon(
                  Icons.bar_chart,

                  color: currentIndex == 1 ? Colors.blue : Colors.grey,

                  size: 28,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
