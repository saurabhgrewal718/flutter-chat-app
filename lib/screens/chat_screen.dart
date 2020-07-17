import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (ctx,index) => Container(
          padding:EdgeInsets.all(8),
          child:Text("Chat Screen"),
        )
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          Firestore.instance.collection('chats/sQA2UNbEJqVFkhvu4KQc/messages/')
          .snapshots().listen((data) { 
            data.documents.forEach((document) {
              print(document['text']);
             });
          });
        },
      ),
    );
  }
}