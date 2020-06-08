import 'package:flutter/material.dart';
import 'package:flutter_radio/flutter_radio.dart';
import 'package:radiosalvaterrafm/Widgets/horarios.dart';
import 'package:radiosalvaterrafm/Widgets/models/transacao.dart';
import 'package:url_audio_stream/url_audio_stream.dart';
////////////////HOMEPAGE////////////////////////////
class Principal extends StatefulWidget {
  @override
  _PrincipalState createState() => _PrincipalState();
}
String estado = "Reproduzir";
int clicks = 0;
bool playing = true;
class _PrincipalState extends State<Principal> {
  static const streamUrl =
      "https://d6ojw9st89o3o.cloudfront.net/BRGallery/index.php/player/view/flat;65;31;ZDM2bnIwdTN4bWM0bW0uY2xvdWRmcm9udC5uZXQvaW5kZXgucGhwL2FwaS9zdHJlYW1pbmcvc3RhdHVzLzc4NjgvZDUzYTg5MjM0ZDFmNGJmMWVmMzQ0ZmY3NWU3MjVkZWMvc2Vydmlkb3IyMi5icmxvZ2ljLmNvbQ==;true";
  AudioStream stream = new AudioStream(streamUrl);
 
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
        Padding(padding: EdgeInsets.all(60),
            child:Container(
                height: 50,
                width: 200,
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
                        if(clicks == 0){
                          stream.start();
                          estado = "Parar";
                          clicks++;
                          playing = false;
                          Scaffold.of(context).showSnackBar(
                            SnackBar(
                              duration: Duration(seconds: 3),
                              backgroundColor: Colors.amber,
                              content: Text("Conectando ao servidor",style: TextStyle(color: Colors.white),
                          )));
                        }else if(clicks == 1){
                          stream.stop();
                          estado = "Reproduzir";
                          clicks = 0;
                          playing = true;
                        }
                      });
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)
                    ),
                    textColor: Colors.white,
                    child: Row(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[
                      Text("$estado"),
                      playing ? Icon(Icons.play_circle_filled): Icon(Icons.pause_circle_filled)

                    ],)

                )
            )
        ),
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

 