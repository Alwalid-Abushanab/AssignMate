import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import '../../bottomNavigation/navigation_bar_view.dart';
import '../../routes/route_generator.dart';
import 'package:file_picker/file_picker.dart';
import 'add_group_member.dart';

//currently hardcoded with assignment info - FIX

class EntryView extends StatelessWidget {
  Future<List<File>?> getFiles() async{
    FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: true);
    if(result != null) {
      return result.paths.map((path)=> File(path??"")).toList();
    }
    else{ return null;}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("AssignMate"),
          automaticallyImplyLeading: false,
        ),
        body: ListView(
          children: [
            const Text(            //Course code and assignment title
              "CS2910 - Assn 1",
              textAlign: TextAlign.left,
            ),
            const Text(            //Group Name
              "Group : A-Team",
              textAlign: TextAlign.left,
            ),
            AddGroupMember(), //Button that lets user add group member for assignment
            const Text(            //Due date - will be a DateTime object
              "Due: April 9, 2023 23:55",
              textAlign: TextAlign.center,
            ),
            const Text(            //Progress as int, will change to a progress bar
              "Progress : Stage 1/4"
            ),
            const Text(            // Will display link to assignment outline, able to be viewed with flutter_pdfview
              "Assignment Outline Placeholder",
              textAlign: TextAlign.left,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context,RouteGenerator.pdfViewer);},
              child: const Text('View Assignent Outline'),
            ),
            const Text(            // Will change to a more suitable widget, will display links to all assignment files
              "Files Placeholder",
              textAlign: TextAlign.left,
            ),
            ElevatedButton(
              onPressed: (){
              var files = getFiles();
              //Now gotta add updating the database functionality

              },
              child: const Text('Upload Files'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context,RouteGenerator.assignmentPage);},
              child: const Text('Return to Assignments'),
            ),

          ],
        ),
        bottomNavigationBar: NavigationBarView(NavigationBarView.assignmentsIndex)
    );
  }
}
