import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

import '../../../database/database.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());

  Future<void> getMessages(String dmId) async{
    emit(ChatLoading());
    final uid = FirebaseAuth.instance.currentUser?.uid;
    final snapshot = await Database(userid: uid).getChats(dmId);
    emit(ChatLoaded(snapshot: snapshot));
  }
}
