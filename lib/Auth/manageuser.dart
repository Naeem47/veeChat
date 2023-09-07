import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:veechat/Screens/Homeview.dart';
import 'package:veechat/Screens/LoginView.dart';


class Authpage extends StatelessWidget {
  const Authpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(stream:FirebaseAuth.instance.authStateChanges() ,builder:(context, snapshot) {
        if(snapshot.hasData){
          return const  Homeview();
        }else{
         return  const LoginView();
        }
      } , ),
    );
  }
}