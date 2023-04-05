import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../info.dart';
import 'cubit/mate_profile_cubit.dart';
import 'mate_profile_view.dart';

class MateProfilePage extends StatelessWidget {
  final String username;
  const MateProfilePage({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MateProfileCubit>(
          create: (context) => MateProfileCubit(),
        ),
      ],
      child: MateProfileView(username: username,),
    );
  }
}