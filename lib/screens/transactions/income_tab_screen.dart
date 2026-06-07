import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:expense_tracker_app/controller/expense_controller.dart';

class IncomeScreen extends StatelessWidget {
  IncomeScreen({super.key});

  final ExpenseController controller = Get.find();

  @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: Padding(
  //       padding: const EdgeInsets.all(20),
  //       child: Column(
  //         children: [
  //           Obx(
  //                 () => Container(
  //               padding: const EdgeInsets.all(15),
  //               decoration: BoxDecoration(
  //                 color: Colors.white24,
  //                 borderRadius: BorderRadius.circular(18),
  //               ),
  //               child: Column(
  //                 children: [
  //
  //                   const Icon(
  //                     Icons.account_balance,
  //                     color: Colors.black,
  //                   ),
  //
  //                   const SizedBox(height: 8),
  //
  //                   Text(
  //                     "₹ ${controller.totalIncome.value.toStringAsFixed(0)}",
  //                     style: const TextStyle(
  //                       color: Colors.black,
  //                       fontSize: 20,
  //                       fontWeight: FontWeight.bold,
  //                     ),
  //                   ),
  //
  //                   const Text(
  //                     "Income",
  //                     style: TextStyle(
  //                       color: Colors.white70,
  //                     ),
  //                   ),
  //
  //                 ],
  //               ),
  //             ),
  //           ),
  //
  //           TextField(
  //             controller: controller.incomeController,
  //             keyboardType: TextInputType.number,
  //             decoration: const InputDecoration(
  //               hintText: "Enter Income",
  //             ),
  //           ),
  //
  //           const SizedBox(height: 20),
  //
  //           SizedBox(
  //             width: double.infinity,
  //             child: ElevatedButton(
  //               onPressed: () {
  //                 controller.addIncome();
  //               },
  //               child: const Text("SAVE"),
  //             ),
  //           ),
  //           ElevatedButton.icon(
  //             onPressed: () {
  //               Get.to(() => IncomeScreen());
  //             },
  //             icon: const Icon(Icons.add),
  //             label: const Text("Add Income"),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F7FB),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            /// Income Card
            Obx(
                  () => Container(
                width: double.infinity,
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xff49C6FF),
                      Color(0xff8A5CFF),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.purple.withOpacity(.2),
                      blurRadius: 15,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(.2),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.account_balance_wallet,
                        color: Colors.white,
                        size: 35,
                      ),
                    ),

                    const SizedBox(height: 15),

                    const Text(
                      "Total Income",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Text(
                      "₹ ${controller.totalIncome.value.toStringAsFixed(0)}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

            /// Add Income Card
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.05),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const Text(
                    "Add New Income",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 20),

                  TextField(
                    controller: controller.incomeController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "Enter Income Amount",
                      prefixIcon: const Icon(Icons.currency_rupee),
                      filled: true,
                      fillColor: const Color(0xffF6F7FB),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),

                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff8A5CFF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      onPressed: () {
                        controller.addIncome();
                      },
                      child: const Text(
                        "SAVE INCOME",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// Quick Stats
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [

                  Column(
                    children: [
                      Icon(
                        Icons.trending_up,
                        color: Colors.green.shade600,
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "Income",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        "₹ ${controller.totalIncome.value.toStringAsFixed(0)}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  Container(
                    width: 1,
                    height: 50,
                    color: Colors.grey.shade300,
                  ),

                  Column(
                    children: const [
                      Icon(
                        Icons.savings,
                        color: Colors.orange,
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Savings",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        "Track Daily",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}