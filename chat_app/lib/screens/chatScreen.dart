import 'package:chat_app/chatting/chat/message.dart';
import 'package:chat_app/chatting/chat/new_message.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _authentication = FirebaseAuth.instance;
  User? loggedUser;

  void getCurrentUser() {
    final user = _authentication.currentUser;
    if (user != null) {
      try {
        loggedUser = user;
        debugPrint(loggedUser!.email);
      } catch (e) {
        debugPrint(e.toString());
      }
    }
  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('chat Screen'),
        actions: [
          IconButton(
              onPressed: () {
                _authentication.signOut();
              },
              icon: const Icon(
                Icons.exit_to_app_sharp,
                color: Colors.white,
              ))
        ],
      ),
      body: Container(
        child: Column(
          children: const [
            Expanded(child: Messages()),
            NewMessage()

          ],
        ),
      )
    );
  }
}
