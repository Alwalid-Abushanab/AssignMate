//A class that hold the information for a dart entry, and methods for creating them
import 'dart:io';

class Entry{
  final String course; //Course code String
  final String title;  //Assignment title String
  DateTime dueDate;  //Due date as DateTime object
  String outline;  //Path to outline as String
  String group;    //Group name string
  List<File>? files;    //List of assignment files

  Entry(this.course, this.title, this.dueDate, this.outline, this.group, this.files);

}