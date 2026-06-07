import 'package:expense_tracker_app/controller/theme_controller.dart';
import 'package:expense_tracker_app/screens/monthly_report/monthly_report_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {

  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ThemeController themeController =
  Get.find();
  void _logout() {
    Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: const Text("Logout"),
        content: const Text("Do you want to logout?"),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              Get.offAllNamed("/login");
            },
            child: const Text("Logout"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F7FB),

      body: Column(
        children: [
          SizedBox(height: 20),
          Obx(
                () => SwitchListTile(

              value: themeController.isDark.value,

              title: const Text(
                "Dark Mode",
              ),

              secondary: const Icon(
                Icons.dark_mode,
              ),

              onChanged: (value) {

                themeController.changeTheme(value);

              },

            ),
          ),
          /// 🔥 TOP PROFILE HEADER
          Container(
            height: 260,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xff5B8CFF), Color(0xff8C5BFF)],
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                CircleAvatar(
                  radius: 45,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 40, color: Colors.blue),
                ),

                SizedBox(height: 10),

                Text(
                  "Karthika",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Text(
                  "Flutter Developer",
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          /// SETTINGS
          _tile(Icons.settings, "Settings"),
          _tile(Icons.lock, "Privacy"),

          _tile(
            Icons.calendar_month,
            "Monthly Report",
            onTap: () {
              Get.to(() => MonthlyReportScreen());
            },
          ),

          _tile(Icons.help, "Help & Support"),
          _tile(Icons.info, "About App"),
          const Spacer(),

          /// 🔥 LOGOUT
          Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: _logout,
                child: const Text("LOGOUT"),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _tile(
      IconData icon,
      String title, {
        VoidCallback? onTap,
      }) {

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child:ListTile(
        leading: Icon(icon, color: Colors.blue),
        title: Text(title),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 16,
        ),
        onTap: onTap,
      ),
    );
  }
}