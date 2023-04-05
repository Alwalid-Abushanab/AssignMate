import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../routes/route_generator.dart';

/// Show the high score
class NavigationBarView extends StatelessWidget {
  static const int assignmentsIndex = 0;
  static const int groupsIndex = 1;
  static const int homeIndex = 2;
  static const int DMIndex = 3;
  static const int profileIndex = 4;

  int indexSelected = 2;

  NavigationBarView(int index, {super.key}) {
    indexSelected = index;
  }

  @override
  Widget build(BuildContext context) {
    void onTap(int index) {
      if (index == assignmentsIndex) {
        Navigator.pushNamed(context, RouteGenerator.assignmentPage);
      } else if (index == groupsIndex) {
        Navigator.pushNamed(context, RouteGenerator.groupsPage);
      } else if (index == homeIndex) {
        Navigator.pushNamed(context, RouteGenerator.homePage);
      } else if (index == DMIndex) {
        Navigator.pushNamed(context, RouteGenerator.dmPage);
      } else if (index == profileIndex) {
        Navigator.pushNamed(context, RouteGenerator.profilePage);
      } else {
        Navigator.pushNamed(context, RouteGenerator.homePage);
      }
    }

    return Container(
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
      ]),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
          child: GNav(
            gap: 4,
            activeColor: Colors.white,
            iconSize: 24,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            duration: const Duration(milliseconds: 800),
            tabBackgroundColor: Colors.red,
            tabs: const [
              GButton(
                icon: Icons.assignment,
                text: 'Assignments',
              ),
              GButton(
                icon: Icons.group,
                text: 'Groups',
              ),
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.message,
                text: 'Messages',
              ),
              GButton(
                icon: Icons.account_circle,
                text: 'Profile',
              ),
            ],
            selectedIndex: indexSelected,
            onTabChange: onTap,
          ),
        ),
      ),
    );
  }
}
