import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat App'),
        actions: <Widget>[
          DropdownButton(icon: Icon(Icons.more_vert,color: Colors.white,),
            items: [
              DropdownMenuItem(child: Container(child:Row(
                children: <Widget>[
                  Icon(Icons.exit_to_app),
                  SizedBox(width: 8,),
                  Text('Logout'),
                ],
               ),
              ),
              value: 'Logout',
             ),
            ],
            onChanged: (itemIdentifier){
              if(itemIdentifier == 'Logout'){
                FirebaseAuth.instance.signOut();
              }
            },
          )
        ],
      ),
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
        //  Firestore.instance
        //   .collection('chats/sQA2UNbEJqVFkhvu4KQc/messages/')
        //   .add({'text':'this was added by clicking the button'});
        print("yes");
        Firestore.instance.collection('chats/sQA2UNbEJqVFkhvu4KQc/messages')
        .add({'text':"yoman its mee"});
        },
      ),
    );
  }
}