import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

import '../../../database/database.dart';

part 'tiles_state.dart';

class TilesCubit extends Cubit<TilesState> {
  TilesCubit() : super(TilesInitial());

  Future<void> getInfo(String id) async{
    emit(TileLoading());
    final uid = FirebaseAuth.instance.currentUser?.uid;
    final snapshot = await Database(userid: uid).getDMchat(id);
    final username = await Database(userid: uid).getUsernameFromEmail(FirebaseAuth.instance.currentUser!.email!);
    final picUrl = await Database().getPicFromDMID(id,username);
    emit(TileLoaded(snapshot: snapshot, currUsername: username, picUrl: picUrl));
  }
}
