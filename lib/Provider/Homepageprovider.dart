import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:veechat/Constants/style.dart';
import 'package:veechat/Screens/LoginView.dart';

import '../Constants/colors.dart';

class Homeprovider extends ChangeNotifier {
  final auth = FirebaseAuth.instance;

  void showwarning(context) {
    showDialog(
      barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(

            backgroundColor: ColorConstants.white,
            content: Text(
              "Are you Sure You Want to LogOut?",
              style: stysaans.copyWith(
                  color: ColorConstants.black, fontWeight: FontWeight.bold),
            ),
            actions: [
              MaterialButton(
                onPressed: () {
                  logOut(context);
                },
                child: Text(
                  "Logout",
                  style: stysaans.copyWith(color: Colors.red),
                ),
              ),
              MaterialButton(
                onPressed: () {
                 Navigator.pop(context);
                },
                child: Text(
                  "Cancel",
                  style: stysaans.copyWith(color: ColorConstants.black),
                ),
              )
            ],
          );
        });
  }

  void logOut(context) async {
    await auth.signOut();
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginView(),
        ));
    notifyListeners();
  }
  void setstatus (String status)async{
    await FirebaseFirestore.instance.collection('Users').doc(auth.currentUser!.uid).update({
      'status' : status
    });


  }
}
