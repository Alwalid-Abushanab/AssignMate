import 'package:flutter/material.dart';
import '../routes/route_generator.dart';
import '../bottomNavigation/navigation_bar_view.dart';

/// Show the high score
class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("AssignMate"),
      ),
      bottomNavigationBar: NavigationBarView()
    );
  }
}