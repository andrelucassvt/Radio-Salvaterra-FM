import 'package:flutter/material.dart';

class RadioInformation extends StatelessWidget {

  String text = ''' 
Rádio Comunitária Salvaterra FM.
Pertencente a Associação Cultural Nely  Andrade – ACNA, com sede no município de Salvaterra, tem a grata satisfação de informar que está no ar desde o dia 12 de agosto de 2010 sua emissora de radiodifusão ZYXZ 762  Salvaterra FM, operando na frequencia de 87,9 MHZ, fruto de um projeto que se iniciou em 2004 quando da sua fundação, e posteriormente na condução do processo 513.000213/2004 junto ao Ministério das Comunicações que autorizou seu funcionamento através da portaria nº 1.148 de 23 de dezembro de 2008 e do Decreto Legislativo nº 483 de 06 de julho de 2010. Nosso estúdio, está localizado na Rua Carlos Carneiro dos Santos - 4° Rua - Centro- Salvaterra - Ilha de Marajó- PÁ- Brasil.

Presidente: Alda Nelydia Andrade dos Santos Braga.
  
  ''';

  String imagem = 
  "Imagens/Salvaterra.png";

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Informações",style: TextStyle(color: Colors.red),),
        centerTitle: true,
        backgroundColor: Colors.yellow,
      ),
      body:
      SingleChildScrollView(
      child:Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[

        Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height*0.4,
          width: double.infinity,
          child: Image.asset(imagem,fit: BoxFit.fill,),
        ),

          Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height*0.6,
          width: double.infinity,
          child:Text(text)
          ),

        Text('Presidentes da Associação:',style: TextStyle(fontSize: 20),),

        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text('-Nely Andrade e Luis Braga-',style: TextStyle(fontSize: 15),),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 0, bottom: 20),
          child: Container(
            height: 200,
            width: 300,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/images/presidentes.jpeg'))
            ),
          ),
        ),

        Text('Diretor Geral:',style: TextStyle(fontSize: 20),),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text('-Rick Cabral-',style: TextStyle(fontSize: 15),),
        ),
        Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/images/rick.jpeg'))
          ),
        ),

        Text('Diretor de programação:',style: TextStyle(fontSize: 20),),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text('-Marcelo Nunes-',style: TextStyle(fontSize: 15),),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 0),
          child: Container(
            height: 200,
            width: 300,
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/images/galeraEight.jpg'))
            ),
          ),
        ),

        Text('Diretor de departamento:',style: TextStyle(fontSize: 20),),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text('-Jorge Alves-',style: TextStyle(fontSize: 15),),
        ),
        Container(
          height: 180,
          width: 300,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/images/galeraSeven.jpg'))
          ),
        ),
      ],)),

    );
  }
}