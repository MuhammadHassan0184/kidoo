import 'package:kidoo/screens/auth/login_screen.dart';
import 'package:kidoo/services/user_controller.dart';
import 'package:kidoo/Config/utils/app_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kidoo/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({super.key});

  final userController = Get.find<UserController>(); // USER ROLE

Future<void> _logout(BuildContext context) async {
  final shouldLogout = await showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Logout', style: TextStyle(fontWeight: FontWeight.bold)),
      content: const Text('Are you sure you want to logout?'),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.zink
          ),
          onPressed: () => Navigator.of(context).pop(true),
          child: const Text('Logout', style: TextStyle(color: Colors.white),),
        ),
      ],
    ),
  );

  if (shouldLogout == true) {
    //  LOGOUT FROM FIREBASE
    await AuthService().logout();

    // Redirect — but GetX will handle automatically if using AuthGate
    if (context.mounted) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => LoginScreen()),
        (route) => false,
      );
    }
  }
}

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: AppColors.frozi),
            child:  Text(FirebaseAuth.instance.currentUser!.email??"No",
                style: TextStyle(color: Colors.white, fontSize: 26)),
          ),

          // ============================
          //  SHOW ONLY WHEN ADMIN
          // ============================

          if (userController.role.value == "admin") ...[

            InkWell(
              onTap: () => Get.toNamed("/AddCourses"),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: ListTile(
                  title: Text("Add Course",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                ),
              ),
            ),

            InkWell(
              onTap: () => Get.toNamed("/AddLesson"),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: ListTile(
                  title: Text("Add Lesson",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                ),
              ),
            ),
          ],
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Divider(),
          ),
          // ============================
          // LOGOUT — SHOW FOR ALL USERS
          // ============================
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ListTile(
              title: Text(
                "Log Out",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                    fontSize: 18),
              ),
              trailing: IconButton(
                icon: const Icon(Icons.logout),
                onPressed: () => _logout(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}