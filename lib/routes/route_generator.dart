import 'package:assign_mate/assignments/assignments_page.dart';
import 'package:assign_mate/routes/unknown_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../auth/authentication_page.dart';
import '../auth/login/login_page.dart';
import '../auth/reset_password/reset_password_page.dart';
import '../auth/sign_up/signup_page.dart';
import '../home/home_page.dart';

class RouteGenerator {
  static const String homePage = '/';
  static const String assignmentPage = '/assignmentPage';
  static const String DMPage = '/DMPage';
  static const String groupsPage = '/groupsPage';
  static const String profilePage = '/profilePage';
  static const String loginPage = '/loginPage';
  static const String authPage = '/AuthenticationPage';
  static const String signUpPage = '/signUpPage';
  static const String passwordPage = '/resetPasswordPage';

  //private constructor
  RouteGenerator._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homePage:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );
      case assignmentPage:
        return MaterialPageRoute(
          builder: (_) => const AssignmentsPage(),
        );
      case loginPage:
        return MaterialPageRoute(
          builder: (_) => const LoginPage(),
        );
      case authPage:
        return MaterialPageRoute(
          builder: (_) => AuthenticationPage(),
        );
      case signUpPage:
        return MaterialPageRoute(
          builder: (_) => const SignUpPage(),
        );
      case passwordPage:
        return MaterialPageRoute(
          builder: (_) => const ResetPasswordPage(),
        );
    }
    if (kDebugMode) {
      return MaterialPageRoute(builder: (context) => UnknownScreen());
    } else {
      return MaterialPageRoute(builder: (context) => const HomePage());
    }
  }
}
