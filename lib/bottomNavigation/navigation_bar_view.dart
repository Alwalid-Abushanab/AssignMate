import 'package:flutter/material.dart';
import '../routes/route_generator.dart';

/// Show the high score
class NavigationBarView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int indexSelected = 0;

    void onTap(int index){
      if (index == 0){
        Navigator.pushNamed(context,RouteGenerator.assignmentPage);
      }
      else if (index == 1){
        Navigator.pushNamed(context,RouteGenerator.groupsPage);
      }
      else if (index == 2){
        Navigator.pushNamed(context,RouteGenerator.homePage);
      }
      else if (index == 3){
        Navigator.pushNamed(context,RouteGenerator.DMPage);
      }
      else if (index == 4){
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