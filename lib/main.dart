import 'package:chatapp/screens/auth_screen.dart';

import './screens/chat_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(  
        primarySwatch: Colors.green,
        backgroundColor: Colors.black,
        accentColor: Colors.orange,
        accentColorBrightness: Brightness.dark,
        buttonTheme: ButtonTheme.of(context).copyWith(
          buttonColor: Colors.orange,
          textTheme:ButtonTextTheme.primary,
          shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(20),)
        ) 
      ),
      home: StreamBuilder(
        stream:FirebaseAuth.instance.onAuthStateChanged ,
        builder: (ctx,userSnapshot) {
          if(userSnapshot.hasData){
            return ChatScreen();
          }
          return AuthScreen();
          
        }
      ),
    );
  }
}
