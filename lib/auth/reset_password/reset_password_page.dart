import 'package:assign_mate/auth/reset_password/reset_password_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


/// Stateless widget responsible for providing StreakCubit to StreakView
class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return ResetPasswordView();
  }
}