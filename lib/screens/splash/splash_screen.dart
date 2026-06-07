import 'dart:async';
import 'package:expense_tracker_app/screens/login/login_screen.dart';
import 'package:expense_tracker_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {

  late AnimationController animationController;

  late Animation<double> scaleAnimation;

  @override
  void initState() {

    super.initState();

    animationController = AnimationController(

      vsync: this,

      duration: const Duration(milliseconds: 1200),

    );

    scaleAnimation = Tween<double>(

      begin: 0.5,

      end: 1,

    ).animate(

      CurvedAnimation(

        parent: animationController,

        curve: Curves.easeOutBack,

      ),

    );

    animationController.forward();

    Timer(

      const Duration(seconds: 3),

          () {

        Get.off(

              () => LoginScreen(),

        );

      },

    );
  }

  @override
  void dispose() {

    animationController.dispose();

    super.dispose();

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Container(

        decoration: const BoxDecoration(

          gradient: AppColors.gradient,

        ),

        child: Center(

          child: ScaleTransition(

            scale: scaleAnimation,

            child: Column(

              mainAxisAlignment: MainAxisAlignment.center,

              children: [

                Container(

                  height: 120,

                  width: 120,

                  decoration: BoxDecoration(

                    color: Colors.white,

                    borderRadius: BorderRadius.circular(35),

                  ),

                  child: const Icon(

                    Icons.account_balance_wallet,

                    size: 65,

                    color: Color(0xff5B8CFF),

                  ),

                ),

                const SizedBox(height: 30),

                const Text(

                  "Expense Tracker",

                  style: TextStyle(

                    fontSize: 34,

                    color: Colors.white,

                    fontWeight: FontWeight.bold,

                  ),

                ),

                const SizedBox(height: 10),

                const Text(

                  "Manage Your Money Easily",

                  style: TextStyle(

                    fontSize: 18,

                    color: Colors.white70,

                  ),

                ),

                const SizedBox(height: 60),

                const CircularProgressIndicator(

                  color: Colors.white,

                ),

              ],

            ),

          ),

        ),

      ),

    );

  }

}