import 'package:assign_mate/assignments/cubit/assignments_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../routes/route_generator.dart';
import '../bottomNavigation/navigation_bar_view.dart';
import 'package:intl/intl.dart';


class AssignmentsView extends StatelessWidget {

  final List<AssignmentTemp> assinList = [
    AssignmentTemp(DateTime(2023, 3, 29, 9, 30, 0), "cs2022"),
    AssignmentTemp(DateTime(2023, 4, 27, 9, 30, 0), "math101"),
    AssignmentTemp(DateTime(2023, 3, 26, 9, 30, 0), "stat101"),
    AssignmentTemp(DateTime(2022, 2, 13, 9, 30, 0), "physics101"),
    AssignmentTemp(DateTime(2022, 1, 13, 9, 30, 0), "chemistry101"),
    AssignmentTemp(DateTime(2022, 5, 13, 9, 30, 0), "cs101"),
  ];

  @override
  Widget build(BuildContext context) {

    assinList.sort((a,b)=> a.dueDate.compareTo(b.dueDate));

    return  Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Assignments"),
          automaticallyImplyLeading: false,
        ),
        body: BlocBuilder<AssignmentsCubit, AssignmentsState>(
            builder: (context, state) {
              print(assinList.length);
              return Column(
                children: [
                  (state is currentAssignments)? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const ElevatedButton(
                          onPressed: null,
                          child: Text('Current')
                      ),
                      const Padding(
                          padding: EdgeInsets.only(right: 150.0)
                      ),
                      ElevatedButton(
                          child: Text('Past'),
                          onPressed: () => BlocProvider.of<AssignmentsCubit>(context).change()
                      ),
                    ],
                  ): Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ElevatedButton(
                          child: const Text('Current'),
                          onPressed: () => BlocProvider.of<AssignmentsCubit>(context).change()
                      ),
                      const Padding(
                          padding: EdgeInsets.only(right: 150.0)
                      ),
                      const ElevatedButton(
                          onPressed: null,
                          child: Text('Past')
                      ),
                    ],
                  ),Expanded(
                      child: ListView.builder(
                        itemCount: assinList.length,
                        itemBuilder: (BuildContext context, int index) {
                          if (state is currentAssignments) {
                            if (assinList[index].dueDate.compareTo(DateTime.now()) < 0) {
                              return Container();
                            }
                            return ListTile(
                              title: Text(assinList[index].assignmentName),
                              subtitle: Text(DateFormat('MM/dd HH:mm').format(
                                  assinList[index].dueDate)),
                            );
                          }
                          else {
                            if (assinList[index].dueDate.compareTo(DateTime.now()) > 0) {
                              return Container();
                            }
                            return ListTile(
                              title: Text(assinList[index].assignmentName),
                              subtitle: Text(DateFormat('MM/dd HH:mm').format(
                                  assinList[index].dueDate)),
                            );
                          }
                        },
                      )
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0, bottom: 5),
                        child: FloatingActionButton(
                          onPressed: () {
                            // Add functionality here
                          },
                          child: const Icon(Icons.alarm),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 16.0, bottom: 5),
                        child: FloatingActionButton(
                          onPressed: () {
                            // Add functionality here
                          },
                          child: const Icon(Icons.add),
                        ),
                      ),
                    ],
                  )
                ],
              );
            }),
        bottomNavigationBar: NavigationBarView(NavigationBarView.assignmentsIndex)
    );
  }
}

class AssignmentTemp{
  String assignmentName;
  DateTime dueDate;
  AssignmentTemp(this.dueDate, this.assignmentName);
}