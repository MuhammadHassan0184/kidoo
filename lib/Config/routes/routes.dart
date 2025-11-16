import 'package:get/get_navigation/get_navigation.dart';
import 'package:kidoo/Config/routes/routes_name.dart';
import 'package:kidoo/view/add_cor.dart';
import 'package:kidoo/view/screens/login_screen.dart';
import 'package:kidoo/view/all_categories.dart';
import 'package:kidoo/view/alphabets.dart';
import 'package:kidoo/view/colortask.dart';
import 'package:kidoo/view/fruits.dart';
import 'package:kidoo/view/home.dart';
import 'package:kidoo/view/main_manue.dart';
import 'package:kidoo/view/screens/signup_screen.dart';
import 'package:kidoo/view/stories.dart';
import 'package:kidoo/view/vegitable.dart';

class AppRoutes {
  static routes() => [
    GetPage(name: AppRoutesName.loginScreen, page: () =>  LoginScreen()),
    GetPage(name: AppRoutesName.signupScreen, page: () =>  SignupScreen()),
    GetPage(name: AppRoutesName.mainManue, page: () => const MainManue()),
    GetPage(name: AppRoutesName.stories, page: () => const Stories()),
    GetPage(name: AppRoutesName.addCor, page: () => const AddCor()),
    GetPage(name: AppRoutesName.allCategories, page: () => const AllCategories()),
    GetPage(name: AppRoutesName.home, page: () => const Home()),
    GetPage(name: AppRoutesName.colortask, page: () => const Colortask()),
    GetPage(name: AppRoutesName.alphabets, page: () => const Alphabets()),
    GetPage(name: AppRoutesName.fruits, page: () => const Fruits()),
    GetPage(name: AppRoutesName.vegitable, page: () => const Vegitable()),
  ];
}