import 'package:expense_tracker_app/controller/expense_controller.dart';
import 'package:expense_tracker_app/screens/add_expense/add_expense_screen.dart';
import 'package:expense_tracker_app/screens/dashboard/home.dart';
import 'package:expense_tracker_app/screens/monthly_report/monthly_report_screen.dart';
import 'package:expense_tracker_app/screens/profile/profile_screen.dart';
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

  final List<Widget> screens = [
    HomeScreen(),
    TransactionsScreen(),
    MonthlyReportScreen(),
    ProfileScreen(),
  ];


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
          notchMargin: 8,
          child: Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceAround,
            children: [

              IconButton(
                icon: const Icon(Icons.home,size: 25,),
                onPressed: () {
                  setState(() {
                    currentIndex = 0;
                  });
                },
              ),

              IconButton(
                icon: const Icon(Icons.bar_chart,size: 25,),
                onPressed: () {
                  setState(() {
                    currentIndex = 1;
                  });
                },
              ),

              IconButton(
                icon: const Icon(Icons.wallet,size: 25,),
                onPressed: () {
                  setState(() {
                    currentIndex = 2;
                  });
                },
              ),

              IconButton(
                icon: const Icon(Icons.person,size: 25,),
                onPressed: () {
                  setState(() {
                    currentIndex = 3;
                  });
                },
              ),
            ],
          ),
        )
    );
  }
}
