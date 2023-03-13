import 'package:flutter/material.dart';
import '../routes/route_generator.dart';

/// Show the high score
class NavigationBarView extends StatelessWidget {
  static const int assignmentsIndex = 0;
  static const int groupsIndex = 1;
  static const int homeIndex = 2;
  static const int DMIndex = 3;
  static const int profileIndex = 4;

  int indexSelected = 2;

  NavigationBarView(int index){
    indexSelected = index;
  }

  @override
  Widget build(BuildContext context) {

    void onTap(int index){
      if (index == assignmentsIndex){
        Navigator.pushNamed(context,RouteGenerator.assignmentPage);
      }
      else if (index == groupsIndex){
        Navigator.pushNamed(context,RouteGenerator.groupsPage);
      }
      else if (index == homeIndex){
        Navigator.pushNamed(context,RouteGenerator.homePage);
      }
      else if (index == DMIndex){
        Navigator.pushNamed(context,RouteGenerator.DMPage);
      }
      else if (index == profileIndex){
        Navigator.pushNamed(context,RouteGenerator.profilePage);
      }
      else {
        Navigator.pushNamed(context,RouteGenerator.homePage);
      }
    }

    return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.assignment),
              label: "Assign",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.group),
              label: "Groups",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.message),
              label: "DM",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: "profile",
            ),
          ],
      currentIndex: indexSelected,
      onTap: onTap,
    );
  }
}