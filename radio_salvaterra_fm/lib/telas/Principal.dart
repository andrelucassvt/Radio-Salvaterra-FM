import 'package:flutter/material.dart';
import 'package:flutter_radio/flutter_radio.dart';
import 'package:radiosalvaterrafm/Widgets/horarios.dart';
import 'package:radiosalvaterrafm/Widgets/models/transacao.dart';
////////////////HOMEPAGE////////////////////////////
class Principal extends StatefulWidget {
  @override
  _PrincipalState createState() => _PrincipalState();
}
String estado = "Reproduzir";
int clicks = 0;
bool isPlaying;
class _PrincipalState extends State<Principal> {
  String streamUrl =
      "https://s09.maxcast.com.br:8214/live";
  ///////ABRIR TELA DE HORARIOS////
  final List<Transection> _transections = [];
  _addTransection(String title, double value, DateTime date) {
    final newTransection = Transection(
      imagem: title,
    );
    setState(() {
      _transections.add(newTransection);
    });
    Navigator.of(context).pop();
  }

  _openTransectionFormModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return TransactionForm(_addTransection);
      },
    );
  }
    Future playingStatus() async {
    bool isP = await FlutterRadio.isPlaying();
    setState(() {
      isPlaying = isP;
    });
  }
  ///////ABRIR TELA DE HORARIOS////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    /////////////Parte de cima aonde vai ficar a nome/logo////////////
    body: SingleChildScrollView( 
    child:Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      ClipPath(
          clipper: MyClipper(),
          child:Container(
            height: MediaQuery.of(context).size.height*0.57,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Color(0xFFFFC107),
                    Color(0xFFF44336),
                  ]
              ),
            ),

            child: Stack(alignment: Alignment.center,children: <Widget>[
                Container(
                  child: Image.asset('Imagens/Salvaterra.png',
                            fit: BoxFit.cover,
                            height: 200,
                          )
                  ),
            ],),
          )
      ),
      ////////////FIM PARTE DE CIMA//////////////////////////
      
      ////////////////////BOTAO////////////////////
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
        Padding(padding: EdgeInsets.only(left: 8.0,top: 60),
          child:Container(
              height: 50,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                gradient: LinearGradient(
                    colors: [
                      Color(0xFFFFC107),
                      Color(0xFFF44336),
                    ]
                ),
              ),
              child:FlatButton(
                  onPressed: (){
                    setState(() {
                        FlutterRadio.pause(url: streamUrl);
                        FlutterRadio.play(url: streamUrl);
                        playingStatus();
                        Scaffold.of(context).showSnackBar(
                          SnackBar(
                            duration: Duration(seconds: 5),
                            backgroundColor: Colors.blue,
                            content: Text("Conectando ao servidor",style: TextStyle(color: Colors.white),
                        )));
                    });
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)
                  ),
                  textColor: Colors.white,
                  child: Row(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[
                    Text("Reproduzir"),
                    Icon(Icons.play_circle_filled)
                  ],)

              )
          )
      ),
       Padding(padding: EdgeInsets.only(left: 20,top: 60),
          child:Container(
              height: 50,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                gradient: LinearGradient(
                    colors: [
                      Color(0xFFFFC107),
                      Color(0xFFF44336),
                    ]
                ),
              ),
              child:FlatButton(
                  onPressed: (){
                    setState(() {
                        FlutterRadio.pause(url: streamUrl);
                        playingStatus();
                        Scaffold.of(context).showSnackBar(
                          SnackBar(
                            duration: Duration(seconds: 3),
                            backgroundColor: Colors.red,
                            content: Text("Transmissão encerrada",style: TextStyle(color: Colors.white),
                        )));
                    });
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)
                  ),
                  textColor: Colors.white,
                  child: Row(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[
                    Text("Parar"),
                    Icon(Icons.pause_circle_filled)
                  ],)

              )
          )
      ),
      ],)
      
    ],),
    ),

    floatingActionButton: FloatingActionButton(
      child: Icon(Icons.info_outline),
      backgroundColor: Colors.red,
      onPressed: () => _openTransectionFormModal(context),
    ),

    );
  }
}


class MyClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(size.width/2, size.height, size.width, size.height -80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

 