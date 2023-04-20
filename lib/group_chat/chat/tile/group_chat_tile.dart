import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GroupChatTile extends StatelessWidget {
  final String message;
  final String sender;
  final String url;
  final String user;

  const GroupChatTile({Key? key, required this.message, required this.sender, required this.url, required this.user})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: user == sender ? Alignment.centerRight: Alignment.centerLeft,
      padding: EdgeInsets.only(
          top: 4,
          bottom: 4,
          left: user == sender ? 0:20,
          right: user == sender ? 20:0
      ),
      child: Container(
        margin: user == sender ? const EdgeInsets.only(left: 30): const EdgeInsets.only(right: 30),
        padding: const EdgeInsets.only(top:15, bottom: 15,left: 20,right: 20),
        decoration: BoxDecoration(
          borderRadius: user == sender ? const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ): const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          color: user == sender ? Colors.blue : Colors.grey[400],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            user == sender ?
            const SizedBox.shrink() :
            Text(sender, textAlign: TextAlign.left, style: const TextStyle(color: Colors.deepPurpleAccent),),
            Text(message, textAlign: TextAlign.center,),
            url == ''? const SizedBox.shrink(): Image.network(url),
          ],
        ),
      ),
    );
  }
}