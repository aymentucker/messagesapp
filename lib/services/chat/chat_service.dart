import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:messagesapp/models/message.dart';

class ChatService extends ChangeNotifier {
// get instance of auth and firestore
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //send message

  Future<void> sendMessage(String receiverId, String message) async {
    // get current user info
    final String currentUserId = _firebaseAuth.currentUser!.uid;
    final String currentUserEmail = _firebaseAuth.currentUser!.email.toString();
    final Timestamp timestamp = Timestamp.now();

    //create a new message
    Message newMessage = Message(
      senderId: currentUserId,
      senderEmail: currentUserEmail,
      receiverId: receiverId,
      message: message,
      timestamp: timestamp,
    );
    //construct chat room id from current user id and reciver id (stored to ensure uniqueness)

    List<String> ids = [currentUserId, receiverId];
    ids.sort(); // sort the ids (this ensures the chat romm id is always the same for any pair of users)
    String chatRoomId = ids.join("_");

    /// combine the ids into a single string to use as a chat room id
    // add new message to database

    await _firestore
        .collection('chat_rooms')
        .doc(chatRoomId)
        .collection('messages')
        .add(newMessage.toMap());
  }

  // get message

  Stream<QuerySnapshot> getMessages(String userId, String otherUserId) {
    // construct chat room id from user ids ( sorted to ensure the chat room id is always the same for any pair of users)
    List<String> ids = [userId, otherUserId];
    ids.sort(); // sort the ids (this ensures the chat romm id is always the same for any pair of users)
    String chatRoomId = ids.join("_");
    return _firestore
        .collection('chat_rooms')
        .doc(chatRoomId)
        .collection('messages')
        .orderBy('timestamp', descending: false)
        .snapshots();
  }
}
