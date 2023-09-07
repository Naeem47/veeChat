import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:veechat/Model/chatmodel.dart';

class ChatRoomProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _fstore = FirebaseFirestore.instance;

  Future<void> sendMessege(String receiverid, String message) async {
    final String senderid = _auth.currentUser!.uid;
    final Timestamp timestamp = Timestamp.now();

    Message newMessege = Message(
        sender: senderid,
        receiver: receiverid,
        messege: message,
        timeStamp: timestamp.toString());

    List<String> ids = [senderid, receiverid];
    ids.sort();
    String chatroomid = ids.join('_');
    await _fstore
        .collection("chatrooms")
        .doc(chatroomid)
        .collection("messeges")
        .add(newMessege.toMap());
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getMesseges(String userid,String otherid){
       List<String> ids = [userid, otherid];
       ids.sort();
       String chatRoomId = ids.join(('_'));
       return _fstore.collection("chatrooms").doc(chatRoomId). collection('messeges').orderBy('timestamp',descending: false).snapshots();
  }
}
