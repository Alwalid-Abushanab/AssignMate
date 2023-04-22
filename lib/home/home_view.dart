import 'package:flutter/material.dart';
import '../bottomNavigation/navigation_bar_view.dart';
import 'calendar_widget.dart';
import 'motivation_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("AssignMate"),
        automaticallyImplyLeading: false,
      ),
      bottomNavigationBar: NavigationBarView(NavigationBarView.homeIndex),
      body: Column(
        children: [
          Expanded(
            child: CalendarWidget(
              firstDay: DateTime.utc(2023, 1, 1),
              lastDay: DateTime.utc(2023, 12, 31),
              focusedDay: DateTime.now(),
            ),
          ),
          MotivationWidget(),
        ],
      ),
    );
  }
}
