import 'package:assign_mate/dm/mate_profile/cubit/mate_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../info.dart';

class MateProfileView extends StatelessWidget {
  final String username;
  const MateProfileView({super.key, required this.username});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Mate's Profile"),
        automaticallyImplyLeading: true,
      ),
      body: BlocBuilder<MateProfileCubit, MateProfileState>(
        builder: (context, state) {
          if(state is MateProfileInitial){
            context.read<MateProfileCubit>().getUserData(username);
            return const CircularProgressIndicator();
          }
          else if(state is MateProfileLoading){
            return const CircularProgressIndicator();
          }
          else if (state is MateProfileLoaded){
            final data = state.data;

            return Center(
              child: ListView(
                children: [
                  SizedBox(height: 15,),
                  CircleAvatar(
                      radius: 100,
                      child: data['profilePicUrl'] == "" ?
                      Container(
                        width: 200,
                        height: 200,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blueGrey,
                        ),
                        child: const Icon(Icons.account_circle_rounded, size: 150),
                      ): ClipOval(
                        child: Image.network(
                          data['profilePicUrl'],
                          fit: BoxFit.cover,
                          width: 200,
                          height: 200,
                        ),
                      ),
                  ),
                  const SizedBox(height: 30,),
                  Text(username, textScaleFactor: 3,textAlign: TextAlign.center,),
                  const SizedBox(height: 15,),
                  Text(data['email'], textScaleFactor: 3,textAlign: TextAlign.center,),
                  const SizedBox(height: 15,),
                  Text(data['bio'], textScaleFactor: 1,textAlign: TextAlign.center,),
                ],
              ),
            );
          }
          else {
            return Text("Something went Wrong");
          }
        }),
    );
  }
}
