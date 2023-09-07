import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:veechat/Screens/Homeview.dart';
import '../constants/Colors.dart';
// import 'package:google_sign_in/google_sign_in.dart';

class LoginProvider with ChangeNotifier {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

    bool _obsecure = true;
    get ()=> _obsecure ;
  final  auth  = FirebaseAuth.instance;
  // final GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);

  // Future<User?> signInWithGoogle(context) async {
  //   try {
  //     final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();

  //     if (googleSignInAccount != null) {
  //       final GoogleSignInAuthentication googleSignInAuthentication =
  //           await googleSignInAccount.authentication;

  //       final AuthCredential credential = GoogleAuthProvider.credential(
  //         accessToken: googleSignInAuthentication.accessToken,
  //         idToken: googleSignInAuthentication.idToken,
  //       );

  //       final UserCredential authResult = await auth.signInWithCredential(credential);
  //       final User? user = authResult.user;
  //        Navigator.of(context).pushReplacement(MaterialPageRoute(
  //       builder: (context) => const Homeview(),
  //     ));
  //       return user;
  //     }
  //   } catch (error) {
  //     print('Error signing in with Google: $error');
  //     return null;
  //   }
  // }

 
 forbool(){
  if(_obsecure == true){

_obsecure = false;
  }else{
    _obsecure =true;
  }
  notifyListeners();
 }


  login(context) async {
    try {
      UserCredential userCredential = 
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      email.clear();
      password.clear();
     
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const Homeview(),
      ));
    } on FirebaseAuthException catch (e) {
      email.clear();
      password.clear();
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: ColorConstants.white,
              title: Text(
                'ERROR !',
                style: GoogleFonts.rubik(color:ColorConstants.black,fontWeight: FontWeight.bold),
              ), 
              content: Text(
                e.message.toString(),
                style: GoogleFonts.rubik(color:ColorConstants.black),
              ),
            );
          });
    }

    notifyListeners();
  }

}
