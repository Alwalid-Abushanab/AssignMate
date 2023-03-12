import 'package:assign_mate/routes/route_generator.dart';
import 'package:flutter/material.dart';

/// A MaterialApp which sets the `home` to StreakPage.
class AssignMateApp extends MaterialApp {
  AssignMateApp({Key? key}) : super(key: key,
      initialRoute:  RouteGenerator.homePage,
      onGenerateRoute: RouteGenerator.generateRoute,
      theme: ThemeData(
          primarySwatch: Colors.red,
          ),
  );
}