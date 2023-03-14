import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart'; // Import the table_calendar package

import '../routes/route_generator.dart';
import '../bottomNavigation/navigation_bar_view.dart';

/// Show the high score
class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  CalendarFormat _calendarFormat = CalendarFormat.month;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("AssignMate"),
        automaticallyImplyLeading: false,
      ),
      bottomNavigationBar: NavigationBarView(NavigationBarView.homeIndex),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: TableCalendar(
          // Customize the calendar here
          firstDay: DateTime.utc(2023, 1, 1),
          lastDay: DateTime.utc(2023, 12, 31),
          focusedDay: DateTime.now(),
          calendarFormat: _calendarFormat,
          onDaySelected: (selectedDay, focusedDay) {
            // Do something when a day is selected
          },
          calendarBuilders: const CalendarBuilders(
            // Customize the calendar builders here
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _calendarFormat = _calendarFormat == CalendarFormat.month
                ? CalendarFormat.week
                : CalendarFormat.month;
          });
        },
        child: Icon(
          _calendarFormat == CalendarFormat.month
              ? Icons.view_week
              : Icons.view_module,
        ),
      ),
    );
  }
}
