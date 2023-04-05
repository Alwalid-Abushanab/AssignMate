import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

import '../../../database/database.dart';

part 'mate_profile_state.dart';

class MateProfileCubit extends Cubit<MateProfileState> {
  MateProfileCubit() : super(MateProfileInitial());

  Future<void> getUserData(String user) async{
    emit(MateProfileLoading());
    final data = await Database().getUserprofile(user);
    emit(MateProfileLoaded(data: data));
  }
}
