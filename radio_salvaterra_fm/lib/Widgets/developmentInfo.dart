import 'package:flutter/material.dart';


class DevelopmentInfo extends StatelessWidget {
  final String url =
      'https://thumbs.dreamstime.com/b/user-icon-flat-member-service-46707697.jpg';
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Programadores"),
        backgroundColor: Colors.red,
      ),

      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[

            //André Lucas
            Card(
              elevation:5,
              child: Container(
                width: double.infinity,
                height: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage('Imagens/Eu.jpg') 
                            )
                      ),
                    ),

                    Text("-André Lucas Salvador-",style: TextStyle(fontSize: 20.0),
                        textAlign: TextAlign.center,
                        ),
                    Text("Acadêmico de ciência da computação.",
                        textAlign: TextAlign.center,
                        ),
                    Text("Desenvolvedor Java.",
                        textAlign: TextAlign.center,
                        ),
                    Text("Desenvolvedor Web e Mobile com flutter.",
                        textAlign: TextAlign.center,
                        ),
                    Text("Analista de dados utilizando a linguagem Python",
                        textAlign: TextAlign.center,
                        ),
                        Padding(padding: EdgeInsets.all(10)),
                    Text("CONTATO:",style: TextStyle(fontSize: 20.0),
                        textAlign: TextAlign.center,
                        ),
                    Text("andrelucassvt999@gmail.com",
                        textAlign: TextAlign.center,
                        ),
                    Text("(91) 99817-1965",
                        textAlign: TextAlign.center,
                        ),
                    
                ],),
                ),
              ),

            //Raimumdo
            Card(
              elevation:5,
              child: Container(
                width: double.infinity,
                height: 280,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage('Imagens/raimundo.jpeg') 
                            )
                      ),
                    ),

                     Text("-Raimundo Neto-",style: TextStyle(fontSize: 20.0),
                        textAlign: TextAlign.center,
                        ),
                    Text("Acadêmico de Análise e desenvolvimento de sistemas",
                        textAlign: TextAlign.center,
                        ),
                    Text("Desenvolvedor Front-end flutter mobile e web",
                        textAlign: TextAlign.center,
                        ),
                        Padding(padding: EdgeInsets.all(10)),
                    Text("CONTATO:",style: TextStyle(fontSize: 20.0),
                        textAlign: TextAlign.center,
                        ),
                    Text("raimundo.n.neto@hotmail.com",
                        textAlign: TextAlign.center,
                        ),
                    Text("(91) 9809-9102",
                        textAlign: TextAlign.center,
                        ),
                    
                ],),
                ),
              ),


          ],),),
    );
  }
}

