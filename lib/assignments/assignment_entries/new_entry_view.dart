import 'package:flutter/material.dart';
import '../../bottomNavigation/navigation_bar_view.dart';

class NewEntryView extends StatelessWidget {
  const NewEntryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: const Text("AssignMate"),
            automaticallyImplyLeading: false,
        ),
        body: Column(
            children: <Widget>[
              const EntryForm(),
              ElevatedButton(
                  onPressed: () {Navigator.of(context).pop();},
                  child: Text("Return to Assignments"))
        ],),
        bottomNavigationBar: NavigationBarView(NavigationBarView.assignmentsIndex)
    );
  }
}

class EntryForm extends StatefulWidget {
  const EntryForm({super.key});

  @override
  State<EntryForm> createState() => _EntryFormState();
}

class _EntryFormState extends State<EntryForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController dateInput = TextEditingController();
  @override
  void initState(){
    super.initState();
    dateInput.text = ""; //set initial value of text field
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Enter course code here',
            ),
            validator: (String? value){
              if (value == null || value.isEmpty){
                return 'Please enter the course code Ex. CS1001';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Enter assignment name here',
            ),
            validator: (String? value){
              if (value == null || value.isEmpty){
                return 'Please enter the assignment title Ex. Assn 2';
              }
              return null;
            },
          ),
          TextFormField(
            /*
            Helped by this article: https://www.fluttercampus.com/guide/39/how-to-show-date-picker-on-textfield-tap-and-get-formatted-date/
             */
            controller: dateInput, //editing controller of this textfield
            decoration: const InputDecoration(
              hintText: 'Enter due date here',
            ),
            readOnly: true, //User should only edit through datePicker
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1970),
                lastDate: DateTime(2100)
              );
              TimeOfDay? pickedTime = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );
              //Gotta validate and combine the date and time
              int year = pickedDate?.year ?? DateTime.now().year;
              int month = pickedDate?.month ?? DateTime.now().month;
              int day = pickedDate?.day ?? DateTime.now().day;
              int hour = pickedTime?.hour ?? DateTime.now().hour;
              int minute = pickedTime?.minute ?? DateTime.now().minute;
              DateTime dueDate = DateTime(year,month,day,hour,minute);

              setState(() {
                dateInput.text = dueDate.toString();
              });
            },
            validator: (String? value){
              if (value == null || value.isEmpty){
                return 'Please enter the due date';
              }
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Enter group name here',
            ),
            validator: (String? value){
              if (value == null || value.isEmpty){
                return 'Please enter your group name';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical:16.0),
            child: ElevatedButton(
              onPressed: () {
                //Validate form
                if(_formKey.currentState!.validate()) {
                  //Process data TO DO !!!!
                }
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}
