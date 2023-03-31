import 'package:assign_mate/auth/sign_up/signup_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/signup_cubit.dart';


/// Stateless widget responsible for providing StreakCubit to StreakView
class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
        providers: [
          BlocProvider<SignupCubit>(
            create: (context) => SignupCubit(),
          ),
        ],
        child: SignUpView()
    );
  }
}