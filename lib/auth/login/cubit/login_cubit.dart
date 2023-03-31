import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());


  void tryLoginingIn(){
    emit(LoginingIn());
  }

  void successful(bool secc){
    if (secc){
      emit(LogedIn());
    }
    else {
      emit(LoginInitial());
    }
  }
}
