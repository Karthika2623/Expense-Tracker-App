import 'package:expense_tracker_app/controller/expense_controller.dart';
import 'package:expense_tracker_app/screens/transactions/income_tab_screen.dart';
import 'package:expense_tracker_app/screens/transactions/transaction_list_tab.dart';
import 'package:expense_tracker_app/utils/app_colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class TransactionsScreen extends StatelessWidget {
  TransactionsScreen({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Transactions"),
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            TabBar(
              tabs: const [
                Tab(text: "Transactions"),
                Tab(text: "Income"),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  TransactionsListTab(),
                  IncomeScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
    );



  }
}
