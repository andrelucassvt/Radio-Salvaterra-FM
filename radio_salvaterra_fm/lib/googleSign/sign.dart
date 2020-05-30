import 'package:flutter/material.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';


class SignGoogle extends StatefulWidget {
  @override
  _SignGoogleState createState() => _SignGoogleState();
}

class _SignGoogleState extends State<SignGoogle> {

 final GoogleSignIn googleSignIn = GoogleSignIn();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  FirebaseUser _currentUser;
  bool _isloading = false;

  @override
  void initState(){
    super.initState();

    FirebaseAuth.instance.onAuthStateChanged.listen((user) { 
      setState(() {
         _currentUser = user;
      });
    });
  }
  
  Future<FirebaseUser> _getUser() async{

    if(_currentUser != null)return _currentUser;
    

    try{
      final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken,
        );

      final AuthResult authResult = await FirebaseAuth.instance.signInWithCredential(credential);

      final FirebaseUser user = authResult.user;

      return user;

    }catch(error){
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),


      body: Column(mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[

        Center(
          child:GoogleSignInButton(
            onPressed: () {
              _getUser();
            },
            text: "Entre com o Google", 
            darkMode: true,
            splashColor: Colors.white, 
          )),

        ],),
    );
  }
}