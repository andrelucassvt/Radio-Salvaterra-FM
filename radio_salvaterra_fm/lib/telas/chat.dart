import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';

FirebaseUser _currentUser;
class Chat extends StatefulWidget {


  @override
  _ChatState createState() => _ChatState();
}
class _ChatState extends State<Chat> {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
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



  Future<Null> _sendMessage({String text, File image}) async{
    final FirebaseUser user = await _getUser();
    if(user == null){
      _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text("Não foi possivel fazer o login. Tente novamente"),
          backgroundColor: Colors.red,
          )
      );
    }

    String img;
    DocumentSnapshot documentSnapshot =
     await Firestore.instance.collection('Perfil').document(_currentUser.uid).get();
    try{
      img = documentSnapshot.data['FotoPerfil'];
    }catch(e){
      img = 'https://thumbs.dreamstime.com/b/user-icon-flat-member-service-46707697.jpg';
    }
    Map<String, dynamic> data = {
      "uid" : user.uid,
      "sendName": user.displayName,
      "sendPhotourl": img,
      "Time": DateTime.now().millisecondsSinceEpoch 
    };

    if(image != null){
      StorageUploadTask task = FirebaseStorage.instance.ref().child('uid').child(
       DateTime.now().millisecondsSinceEpoch.toString()
      ).putFile(image);

      setState(() {
        _isloading = true;
      });

      StorageTaskSnapshot tasksnapshot = await task.onComplete;
      String url = await tasksnapshot.ref.getDownloadURL();
      data['imageURL'] = url;

      setState(() {
        _isloading = false;
      });

    }

    if(text != null) data['Texto'] = text;
    Firestore.instance.collection("Mensagens").add(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("CHAT SALVATERRA FM",style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),

      body: Column(children: <Widget>[
        Expanded(
          child:StreamBuilder<QuerySnapshot>(
            stream: Firestore.instance.collection("Mensagens").orderBy("Time").snapshots(),
            builder: (context, snapshots){
              switch(snapshots.connectionState){
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                default:
                  List<DocumentSnapshot> documentos = snapshots.data.documents.reversed.toList();

                  return ListView.builder(
                    itemCount: documentos.length,
                    reverse: true,
                    itemBuilder: (context, index){
                      return ChatMessage(documentos[index].data,
                      documentos[index].data['uid'] == _currentUser?.uid
                      );
                    },
                  );
              }
            },
            ),),
       
        _isloading ? LinearProgressIndicator(backgroundColor: Colors.red) : Container(),
        TextComponete(_sendMessage),

      ],)

    );
  }
}

//Chat de mensagem
class ChatMessage extends StatelessWidget  {

  ChatMessage(this.data, this.mine);

  final Map<String, dynamic> data;
  final bool mine;
  
  @override
  Widget build(BuildContext context){
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(children: <Widget>[
        !mine ?
        Padding(
          padding: const EdgeInsets.only(right: 16),
            child:  CircleAvatar(
                backgroundImage: NetworkImage(data["sendPhotourl"]),
                  ),)
        : 
        Container(),
       
        Expanded(
          child: Column(
            crossAxisAlignment: mine ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: <Widget>[
            //Nome de quem enviou
            Text(data["sendName"],
            style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500),
            ),
            data["imageURL"] != null ?
              Image.network(data["imageURL"],width: 250,)
            :
            Text(data["Texto"],
            textAlign: mine ? TextAlign.end : TextAlign.start,
            style: TextStyle(fontSize: 15),
            ),

          ],)
          ),
          mine ?
         Padding(
          padding: const EdgeInsets.only(left: 16),
            child:  CircleAvatar(
                backgroundImage: NetworkImage(data["sendPhotourl"]),
                  ),)
          :
          Container(),
      ],),
    );
  }
}




//////////////////////////////////////////////////////////////////////////////////////////////////
//Criando campo de digitação
class TextComponete extends StatefulWidget {
  TextComponete(this.sendMessage);
  Function({String text, File image}) sendMessage;
  @override
  _TextComponeteState createState() => _TextComponeteState();
}

class _TextComponeteState extends State<TextComponete> {
   bool _isCompose = false;
    var _imageTemp2;
   final TextEditingController _controller = TextEditingController();

   void reset(){
     _controller.clear();
        setState(() {
          _isCompose = false;
        });
   }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      height: 51,
      child:Row(children: <Widget>[
        //Botão da camera
        IconButton(
          icon: Icon(Icons.camera),
          onPressed: ()async{
            final File pegarImagem  =  await showDialog<File>(
                  context: context,
                  builder: (context) => SimpleDialog(
                    children: <Widget>[
                      ListTile(
                        leading: Icon(Icons.camera_alt),
                        title: Text("Câmera"),
                        onTap:()async{
                           _imageTemp2 = await ImagePicker.pickImage(source: ImageSource.camera,
                            imageQuality: 35,
                            maxHeight: 640,
                            maxWidth: 480
                           );
                           Navigator.pop(context, _imageTemp2);
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.image),
                        title: Text("Galeria"),
                        onTap:()async{
                           _imageTemp2 = await ImagePicker.pickImage(source: ImageSource.gallery,
                            imageQuality: 35,
                            maxHeight: 640,
                            maxWidth: 480
                           );
                            Navigator.pop(context, _imageTemp2);
                        },
                      )
                    ],
                  ),
                );
            if(_imageTemp2 == null)return;
            widget.sendMessage(image: _imageTemp2);

          }
          ),
        //TextFild
        Expanded(
          child: TextField(
            keyboardType: TextInputType.multiline,
            maxLines: null,
            maxLength: 200,
            controller: _controller,
            decoration: InputDecoration.collapsed(
              hintText: "Enviar uma mensagem"),
              onChanged: (text){
                setState(() {
                  _isCompose = text.isNotEmpty;
                });
              },
              onSubmitted: (text){
                widget.sendMessage(text: text);
                reset();
              },
          )),
        //Botao enviar
        IconButton(
          icon: Icon(Icons.send),
          onPressed: _isCompose ?(){
            widget.sendMessage(text: _controller.text);
            reset();
          }: null,
          )
      ],),
    );
  }
}