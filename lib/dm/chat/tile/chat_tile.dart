import 'package:assign_mate/database/database.dart';
import 'package:assign_mate/dm/chat/cubit/chat_cubit.dart';
import 'package:assign_mate/dm/chat/tile/cubit/tile_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatTile extends StatelessWidget {
  final String message;
  final String sender;
  final String url;

  const ChatTile({Key? key, required this.message, required this.sender, required this.url})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TileCubit, TileState>(
      builder: (context, state) {
        if(state is TileInitial){
          context.read<TileCubit>().getuser();
          return const CircularProgressIndicator();
        }
        else if (state is UserLoading){
          return const CircularProgressIndicator();
        }
        else if (state is UserLoaded){
          final username = state.user;

          return Container(
            alignment: username == sender ? Alignment.centerRight: Alignment.centerLeft,
            padding: EdgeInsets.only(
                top: 4,
                bottom: 4,
                left: username == sender ? 0:20,
                right: username == sender ? 20:0
            ),
            child: Container(
              margin: username == sender ? const EdgeInsets.only(left: 30): const EdgeInsets.only(right: 30),
              padding: const EdgeInsets.only(top:15, bottom: 15,left: 20,right: 20),
              decoration: BoxDecoration(
                  borderRadius: username == sender ? const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ): const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                color: username == sender ? Colors.blue : Colors.grey[400],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(message, textAlign: TextAlign.center,),
                  url == ''? SizedBox(): Image.network(url),
                ],
              ),
            ),
          );
        }
        else {
          return Text("Something went wrong $state");
        }
      },
    );
  }
}