import 'package:flutter/material.dart';

class AddGroupMember extends StatelessWidget {
  AddGroupMember({Key? key}) : super(key: key);
  final _textFieldController = TextEditingController();
  _displayDialog(BuildContext context) async {

    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Add User to Assignment Group'),
            content: TextField(
              controller: _textFieldController,
              decoration: const InputDecoration(hintText: "Enter a username"),
            ),
            actions: [
              ElevatedButton(
                child: const Text('SUBMIT'),
                onPressed: () {Navigator.of(context).pop();},
                // TO DO : CONNECT TO DATABASE
              ),
              ElevatedButton(
                  child: const Text('CANCEL'),
                  onPressed: () {Navigator.of(context).pop();}
              ),
            ],
          );
        }
    );
  }
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text('Add Member to Group'),
      onPressed: () => _displayDialog(context),
    );
  }
}