import 'package:get/get_navigation/get_navigation.dart';
import 'package:kidoo/Config/routes/routes_name.dart';
import 'package:kidoo/screens/auth/login_screen.dart';
import 'package:kidoo/screens/kidoo/all_categories.dart';
import 'package:kidoo/screens/courses/alphabets.dart';
import 'package:kidoo/screens/courses/colortask.dart';
import 'package:kidoo/screens/courses/fruits.dart';
import 'package:kidoo/screens/kidoo/main_manue.dart';
import 'package:kidoo/screens/auth/signup_screen.dart';
import 'package:kidoo/screens/kidoo/stories.dart';
import 'package:kidoo/screens/courses/vegitable.dart';
import 'package:kidoo/screens/menu/add_course_letter.dart';
import 'package:kidoo/screens/menu/add_courses.dart';

class AppRoutes {
  static routes() => [
    GetPage(name: AppRoutesName.loginScreen, page: () =>  LoginScreen()),
    GetPage(name: AppRoutesName.signupScreen, page: () =>  SignupScreen()),
    GetPage(name: AppRoutesName.mainManue, page: () => const MainManue()),
    GetPage(name: AppRoutesName.addCourses, page: () => const AddCourses()),
    GetPage(name: AppRoutesName.addCourseLetter, page: () => const AddCourseLetter()),
    GetPage(name: AppRoutesName.stories, page: () => const Stories()),
    GetPage(name: AppRoutesName.allCategories, page: () => const AllCategories()),
    GetPage(name: AppRoutesName.colortask, page: () => const Colortask()),
    GetPage(name: AppRoutesName.alphabets, page: () => const Alphabets()),
    GetPage(name: AppRoutesName.fruits, page: () => const Fruits()),
    GetPage(name: AppRoutesName.vegitable, page: () => const Vegitable()),
  ];
}