import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:veechat/Screens/LoginView.dart';
import 'package:veechat/Constants/colors.dart';

class SignupProvider with ChangeNotifier {
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController cpassword = TextEditingController();
  final GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
  var auth = FirebaseAuth.instance;

 
  // Future<User?> signInWithGoogle(context) async {
  //   try {
  //     final GoogleSignInAccount? googleSignInAccount =
  //         await googleSignIn.signIn();

  //     if (googleSignInAccount != null) {
  //       final GoogleSignInAuthentication googleSignInAuthentication =
  //           await googleSignInAccount.authentication;

  //       final AuthCredential credential = GoogleAuthProvider.credential(
  //         accessToken: googleSignInAuthentication.accessToken,
  //         idToken: googleSignInAuthentication.idToken,
  //       );

  //       final UserCredential authResult =
  //           await auth.signInWithCredential(credential);

  //       final User? user = authResult.user;
  //       Navigator.of(context).pushReplacement(MaterialPageRoute(
  //         builder: (context) => const Homeview(),
  //       ));
  //       return user;
  //     }
  //   } catch (error) {
  //     print('Error signing in with Google: $error');
  //     return null;
  //   }
  // }
  bool obsecure = true;
  bool obsecure2 = true;

  get()=> obsecure;
  get2()=> obsecure2;
 forbool(){
  if(obsecure == true){

obsecure = false;
  }else{
    obsecure =true;
  }
  notifyListeners();
 }
 forbool2(){
  if(obsecure2 == true){

obsecure2 = false;
  }else{
    obsecure2 =true;
  }
  notifyListeners();
 }

  createUser(context) async {
    try {
      // ontap = true;
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(userCredential.user!.uid)
          .set({
        'email': FirebaseAuth.instance.currentUser!.email,
        'User name ': username.text,
        'bio': 'Hey there ! I am using Feedbook',
        'uid': userCredential.user!.uid,
        'status' : 'Unavalaible',
        'profile' : "https://eitrawmaterials.eu/wp-content/uploads/2016/09/person-icon.png",
      });
       email.clear();
      password.clear();
      cpassword.clear();
      username.clear();

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const  LoginView()),
      );
    } on FirebaseAuthException catch (e) {
         email.clear();
      password.clear();
      cpassword.clear();
      username.clear();

      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: ColorConstants.grey,
              content: Text(
                e.message.toString(),
                style: GoogleFonts.rubik(color: ColorConstants.black),
              ),
            );
          });
    }
    notifyListeners();
  }
  
}
