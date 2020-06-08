import 'package:flutter/material.dart';
import 'package:flutter_radio/flutter_radio.dart';
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
      "https://andresalvaterrafm.radio12345.com/";
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
                        FlutterRadio.playOrPause(url: streamUrl);
                        if(clicks == 0){
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
        //////////////FIM BOTAO//////////////
        Container(
          padding: EdgeInsets.only(bottom: 3),
          alignment: Alignment.bottomRight,
          child:IconButton(icon: Icon(Icons.info_outline),
          onPressed: (){
            showDialog<String>(context: context,
            builder: (BuildContext context) => AlertDialog(
              insetPadding: EdgeInsets.fromLTRB(50, 200, 50, 200),
              title: Text("Funcionamento:"),
              content: Column(children: <Widget>[
                Text("Das 06:00h às 23:00h",style: TextStyle(color: Colors.red),),
                Text("*Todos os dias*")
              ],),
              actions: <Widget>[
                FlatButton(
                  child: Text("OK"),
                  onPressed: ()=> Navigator.pop(context,"OK"),
                )
              ],
            ),
            );
          }),
        )
        
      ],),
    )
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

 