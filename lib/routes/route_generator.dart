import 'package:assign_mate/routes/unknown_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../home/home_page.dart';

class RouteGenerator {

  static const String homePage = '/';
  static const String assignmentPage = '/assignmentPage';
  static const String DMPage = '/DMPage';
  static const String groupsPage = '/groupsPage';
  static const String profilePage = '/profilePage';

  //private constructor
  RouteGenerator._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homePage:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );

    }
    if(kDebugMode) {
      return MaterialPageRoute(builder: (context) =>  UnknownScreen());
    }
    else {
      return MaterialPageRoute(builder: (context) => const HomePage());
    }
  }

}