part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginingIn extends LoginState {}

class LogedIn extends LoginState {}
