import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
class Database {
  final String? userid;
  Database({this.userid});

  final CollectionReference usersRef =
    FirebaseFirestore.instance.collection("users");

  final CollectionReference DMsRef =
  FirebaseFirestore.instance.collection("DirectMessages");

  final FirebaseStorage storage = FirebaseStorage.instance;
  final Reference storageRef = FirebaseStorage.instance.ref();

  Future<void> addUser(String username, String email) {
    return usersRef.doc(username).set({
      'userID': userid,
      'username': username,
      'email': email,
      'profilePicUrl': '',
      'bio': '',
      'assignments': [],
      'DM': [],
      'assignmentsGroups': [],
    });
  }

  Future<void> updateUserBio(String bio) async {
    String username = await getUsernameFromEmail(FirebaseAuth.instance.currentUser!.email!);
    return usersRef.doc(username).update({
      'bio': bio,
    });
  }

  Future<void> updateUserPic(File profilePic) async {
    String username = await getUsernameFromEmail(FirebaseAuth.instance.currentUser!.email!);
    Reference ref = FirebaseStorage.instance.ref().child('profilePic/$username/');
    UploadTask uploadTask = ref.putFile(profilePic);
    TaskSnapshot taskSnapshot = await uploadTask;
    String downloadUrl = await taskSnapshot.ref.getDownloadURL();

    return usersRef.doc(username).update({
      'profilePicUrl': downloadUrl,
    });
  }

  Future getUserData(String username) async {
    QuerySnapshot snapshot = await usersRef.where("username", isEqualTo: username).get();
    return snapshot;
  }

  getUserGroups(String email) async{
    final username = await getUsernameFromEmail(email);
    return usersRef.doc(username).snapshots();
  }

  Future<String> getUsernameFromEmail(String email) async {
    final snapshot = await usersRef.where('email', isEqualTo: email).get();
    if (snapshot.docs.isNotEmpty) {
      final username = snapshot.docs.first.get('username');
      return username as String;
    }
    return '';
  }

  Future createDM(String username) async{
    DocumentReference dm = await DMsRef.add({
      "DM_ID": "",
      "messageID": [],
      'members': [],
      'recentMessage': "",
      'recentMessageTime': "",
    });

    String currUsername = await getUsernameFromEmail(FirebaseAuth.instance.currentUser!.email!);

    await dm.update({
      "DM_ID": dm.id,
      'members': FieldValue.arrayUnion([currUsername, username])
    });

    await usersRef.doc(currUsername).update({
      "DM": FieldValue.arrayUnion([dm.id])
    });

    return await usersRef.doc(username).update({
      "DM": FieldValue.arrayUnion([dm.id])
    });
  }

  getDMchat(String id){
    return DMsRef.doc(id).snapshots();
  }

  sendMessage(String dmID, Map<String,dynamic> message){
    DMsRef.doc(dmID).collection("messages").add(message);
    DMsRef.doc(dmID).update({
      'recentMessage': message['message'],
      'recentMessageTime': message['time'].toString()
    });
  }

  getChats(String dmId) async {
    return DMsRef
        .doc(dmId)
        .collection("messages")
        .orderBy("time")
        .snapshots();
  }

  sendFile(File file, String name, String dmID, String sender) async {
    Reference ref = FirebaseStorage.instance.ref().child('dmFiles/$dmID/${file.path.split('/').last}');
    UploadTask uploadTask = ref.putFile(file);
    TaskSnapshot taskSnapshot = await uploadTask;
    String downloadUrl = await taskSnapshot.ref.getDownloadURL();

    Map<String, dynamic> messageMap = {
      'message': "",
      'file': downloadUrl,
      'sender': sender,
      'time': DateTime.now().millisecondsSinceEpoch
    };

    sendMessage(dmID,messageMap);
  }

  Future<Map<String, dynamic>> getUserprofile(String username) async {
    final snapshot = await usersRef.where('username', isEqualTo: username).get();
    if (snapshot.docs.isNotEmpty) {
      return {
        'username': username,
        'email': snapshot.docs.first.get('email'),
        'profilePicUrl': snapshot.docs.first.get('profilePicUrl'),
        'bio': snapshot.docs.first.get('bio'),
      };
    } else {
      return {"": ""};
    }
  }

  Future<String> getPicFromDMID(String dmID, String currUser) async {
    QuerySnapshot querySnapshot = await DMsRef.where("DM_ID", isEqualTo: dmID).get();
    if (querySnapshot.docs.isNotEmpty) {
      List<dynamic> members = querySnapshot.docs.first.get('members');
      final snapshot = await usersRef.where('username', isEqualTo: members[0] == currUser? members[1]: members[0]).get();
      return snapshot.docs.first.get('profilePicUrl');
    } else {
      return "";
    }
  }
}