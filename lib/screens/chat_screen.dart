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
      body: StreamBuilder(
        stream: Firestore.instance
          .collection('chats/sQA2UNbEJqVFkhvu4KQc/messages/')
          .snapshots(),
        builder:(ctx,streamSnapshot){
          if(streamSnapshot.connectionState == ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final documents = streamSnapshot.data.documents;
          return ListView.builder(
            itemCount: documents.length,
            itemBuilder: (ctx,index) => Container(
              padding:EdgeInsets.all(8),
              child:Text(documents[index]['text']),
          )
         );
        } ,
        ) ,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
         
        },
      ),
    );
  }
}