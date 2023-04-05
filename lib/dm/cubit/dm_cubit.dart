import 'package:assign_mate/database/database.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'dm_state.dart';

class DmCubit extends Cubit<DmState> {
  DmCubit() : super(DmInitial());

  Future<void> getMessengers() async{
    emit(DmLoading());
    final uid = FirebaseAuth.instance.currentUser?.uid;
    final email = FirebaseAuth.instance.currentUser?.email;
    final snapshot = await Database(userid: uid).getUserGroups(email!);
    emit(DmLoaded(snapshot: snapshot));
  }
}
