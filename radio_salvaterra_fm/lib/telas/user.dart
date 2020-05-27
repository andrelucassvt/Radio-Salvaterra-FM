import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:radiosalvaterrafm/googleSign/sign.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';

class User extends StatefulWidget {
  User({Key key, this.title,this.data,this.mine}) : super(key: key);

  final String title;
  final Map<String, dynamic> data;
  final bool mine;

  @override
  _UserState createState() => _UserState();
}

class _UserState extends State<User> {
  final String url =
      'https://thumbs.dreamstime.com/b/user-icon-flat-member-service-46707697.jpg';
   File _image ;
   File _imageTemp;

   void pegarImagemGaleria() async{
     _imageTemp = await ImagePicker.pickImage(source: ImageSource.gallery);
     setState(() {
       _image = _imageTemp;
     });
   }

   //Firebase///
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
 
  //Firebase////////

  

  @override
  Widget build(BuildContext context) {
    if(_currentUser != null) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
        elevation: 1,
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(child:Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 12),
            width: double.infinity,
            height: MediaQuery.of(context).size.height*0.5,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFFF44336),
                  Color(0xFFFFC107),
                ],
              ),
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(32),
                  bottomLeft: Radius.circular(32)),
            ),
            child:SingleChildScrollView(child:Column(
              children: <Widget>[
               SingleChildScrollView(child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: SingleChildScrollView(child:Column(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.edit,),
                            onPressed: (){
                              pegarImagemGaleria();
                            },
                            color: Colors.yellow,
                          ),
                          Text(
                            'Editar',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'imagem',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      )),
                    ),
                    //Imagem, parte importante
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: this._image != null ?
                            FileImage(this._image):
                            NetworkImage(url)
                            
                            ),
                      ),
                    ),
                    ////////
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child:SingleChildScrollView(child: Column(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.edit,),
                            onPressed: () {},
                          ),
                          Text(
                            'Editar',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            'Nome',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      )),
                    )
                  ],
                )),
                Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 32),
                  child: Text(
                    _currentUser.displayName,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    _currentUser.email,
                    style: TextStyle(color: Colors.white70),
                  ),
                ),
              ],
            )),
          ),
          Container(
            height: 100,
            width: double.infinity,
            padding: EdgeInsets.all(10),
            child: SingleChildScrollView(child:Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SingleChildScrollView(child:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SingleChildScrollView(child:Padding(
                      padding: EdgeInsets.fromLTRB(10, 10, 30, 10),
                      child:Column(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.device_unknown,
                          ),
                          onPressed: () {},
                        ),
                        Text(
                          'Sobre o App',
                          style: TextStyle(
                              color: Colors.grey),
                        )
                      ],
                    ))),
                    SingleChildScrollView(child:Column(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.backspace,
                          ),
                          onPressed: () {
                            FirebaseAuth.instance.signOut();
                            GoogleSignIn().signOut();
                          },
                        ),
                        Text(
                          'Sair da conta',
                          style: TextStyle(
                              color: Colors.grey),
                        )
                      ],
                    )),
                  ],
                )),
              ],
            )),
          )
        ],
      )),
    );
    }else{
      return SignGoogle();
    }
  }
}

