import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double, DateTime) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

//componentes da tela
class _TransactionFormState extends State<TransactionForm> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25.0),
                      topRight: Radius.circular(25.0),
                    ),
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFFFFC107),
                        Color(0xFFF44336),
                      ],
                    ),
                  ),
                  height: 65,
                  child: Center(
                    child: Text(
                      'Programação Radio-Salvaterra!',
                      style: TextStyle(
                        fontSize: 19,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Column(
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height*12.5,
                      child: Column(
                        children: <Widget>[
                          Text(''),
                          Text(
                            'De Segunda a Sexta',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          Text(''),
                          Image(
                            image: AssetImage('assets/images/galeraDeis.jpg'),
                            width: MediaQuery.of(context).size.width,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(50.0),
                              ),
                              gradient: LinearGradient(
                                colors: [
                                  Color(0xFFFFC107),
                                  Color(0xFFF44336),
                                ],
                              ),
                            ),
                            child: Text(
                              'De - 06:00 às 08:00 hs – Bom Dia Salvaterra (Com Fernando Silva)',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Column(
                            children: <Widget>[
                              Container(
                                child: Text(''),
                              ),
                              Image(
                                image:
                                    AssetImage('assets/images/galeraEight.jpg'),
                                width: MediaQuery.of(context).size.width,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(50.0),
                                  ),
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xFFFFC107),
                                      Color(0xFFF44336),
                                    ],
                                  ),
                                ),
                                child: Text(
                                  'De - 08:00 às 11:00 hs – Alô Salvaterra (Com Marcelo Nunes)',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(''),
                              ),
                              Image(
                                image:
                                AssetImage('assets/images/galeraSix.jpg'),
                                width: MediaQuery.of(context).size.width,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(50.0),
                                  ),
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xFFFFC107),
                                      Color(0xFFF44336),
                                    ],
                                  ),
                                ),
                                child: Text(
                                  'De - 11:00 às 13:00 hs – Salvaterra News (Com Etiene Angelim e Jorge Alves)',
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                ),
                              ),
                              Container(
                                child: Text(''),
                              ),
                              Image(
                                image:
                                AssetImage('assets/images/jimi.jpeg'),
                                width: MediaQuery.of(context).size.width,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(50.0),
                                  ),
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xFFFFC107),
                                      Color(0xFFF44336),
                                    ],
                                  ),
                                ),
                                child: Text(
                                  'De - 13:00 às 15:00 hs – Frequência Jovem (Jimmy Rafael)',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(''),
                              ),
                              Image(
                                image:
                                AssetImage('assets/images/galeraProf.jpg'),
                                width: MediaQuery.of(context).size.width,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(50.0),
                                  ),
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xFFFFC107),
                                      Color(0xFFF44336),
                                    ],
                                  ),
                                ),
                                child: Text(
                                  'De – 15:00 às 17:00 hs – Super Tarde Salvaterra (Com Efrain do Marajó)',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(''),
                              ),
                              Image(
                                image:
                                AssetImage('assets/images/joaoPena.jpg'),
                                width: MediaQuery.of(context).size.width,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(50.0),
                                  ),
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xFFFFC107),
                                      Color(0xFFF44336),
                                    ],
                                  ),
                                ),
                                child: Text(
                                  'De – 17:00 às 18:00 hs – Igreja em Saída (Com João Pena)',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(''),
                              ),
                              Image(
                                image:
                                AssetImage('assets/images/galeraOne.jpg'),
                                width: MediaQuery.of(context).size.width,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(50.0),
                                  ),
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xFFFFC107),
                                      Color(0xFFF44336),
                                    ],
                                  ),
                                ),
                                child: Text(
                                  'De – 18:00 às 20:00 hs – No Ritmo das Aparelhagens (Com Thiago Nunes e Dj Pedrinho'
                                  ' Pressão)',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(''),
                              ),
                              Image(
                                image:
                                AssetImage('assets/images/galeraNine.jpg'),
                                width: MediaQuery.of(context).size.width,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(50.0),
                                  ),
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xFFFFC107),
                                      Color(0xFFF44336),
                                    ],
                                  ),
                                ),
                                child: Text(
                                  'De - 20:00 às 22:00 hs – Expresso da Saudade (Com Toninho Carrasco)',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(''),
                              ),
                              Image(
                                image:
                                AssetImage('assets/images/pastorSilvio.jpg'),
                                width: MediaQuery.of(context).size.width,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(50.0),
                                  ),
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xFFFFC107),
                                      Color(0xFFF44336),
                                    ],
                                  ),
                                ),
                                child: Text(
                                  'De – 22:00 às 23:00 hs – Caminhando com Jesus (Com PR. Silvio Moura)',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(''),
                              ),
                              Container(
                                child: Text('Sabado',
                                style: TextStyle(
                                  fontSize: 25,
                                ),
                                ),
                              ),
                              Container(
                                child: Text(''),
                              ),
                              Image(
                                image:
                                AssetImage('assets/images/galeraSeven.jpg'),
                                width: MediaQuery.of(context).size.width,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(50.0),
                                  ),
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xFFFFC107),
                                      Color(0xFFF44336),
                                    ],
                                  ),
                                ),
                                child: Text(
                                  'De - 06:00 às 09:00 hs – Salvaterra Rural ( Com Jorge Alves)',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(''),
                              ),
                              Image(
                                image:
                                AssetImage('assets/images/galeraEight.jpg'),
                                width: MediaQuery.of(context).size.width,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(50.0),
                                  ),
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xFFFFC107),
                                      Color(0xFFF44336),
                                    ],
                                  ),
                                ),
                                child: Text(
                                  'De – 09:00 às 11:00 hs – Sábado, Swing e Alegria (Com Marcelo Nunes)',
                                  style: TextStyle(
                                    fontSize: 19,
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(''),
                              ),
                              Row(
                                children: <Widget>[
                                  Image(
                                    image:
                                    AssetImage('assets/images/mathias.jpg'),
                                    width: MediaQuery.of(context).size.width * 0.40,
                                  ),
                                  Image(
                                    image:
                                    AssetImage('assets/images/galeraTwo.jpg'),
                                    width: MediaQuery.of(context).size.width * 0.49,
                                  ),
                                ],
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(50.0),
                                  ),
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xFFFFC107),
                                      Color(0xFFF44336),
                                    ],
                                  ),
                                ),
                                child: Text(
                                  'De – 11:00 às 14:00 hs – Trio das Marcantes (Com Mathyas e Dj Bruno Silva)',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(''),
                              ),
                              Row(
                                children: <Widget>[
                                  Image(
                                    image:
                                    AssetImage('assets/images/galeraTwo.jpg'),
                                    width: MediaQuery.of(context).size.width * 0.4,
                                  ),
                                  Image(
                                    image:
                                    AssetImage('assets/images/galeraOnze.jpg'),
                                    width: MediaQuery.of(context).size.width * 0.5,
                                  ),
                                ],
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(50.0),
                                  ),
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xFFFFC107),
                                      Color(0xFFF44336),
                                    ],
                                  ),
                                ),
                                child: Text(
                                  'De – 14:00 às 16:00 hs – Sabadão Show ( Com Dj Bruno Silva e Dj Rubens Júnior)',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(''),
                              ),
                              Image(
                                image:
                                AssetImage('assets/images/galeraThree.jpg'),
                                width: MediaQuery.of(context).size.width,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(50.0),
                                  ),
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xFFFFC107),
                                      Color(0xFFF44336),
                                    ],
                                  ),
                                ),
                                child: Text(
                                  'De – 16:00 às 18:00 – Batidão 87 (Com Davi Nascimento)',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(''),
                              ),
                              Image(
                                image:
                                AssetImage('assets/images/galeraOne.jpg'),
                                width: MediaQuery.of(context).size.width,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(50.0),
                                  ),
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xFFFFC107),
                                      Color(0xFFF44336),
                                    ],
                                  ),
                                ),
                                child: Text(
                                  'De – 18:00 às 20:00 hs – No Ritmo das Aparelhagens (Com Thiago Nunes e Dj Pedrinho'
                                  ' Pressão)',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(''),
                              ),
                              Image(
                                image:
                                AssetImage('assets/images/galeraNine.jpg'),
                                width: MediaQuery.of(context).size.width,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(50.0),
                                  ),
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xFFFFC107),
                                      Color(0xFFF44336),
                                    ],
                                  ),
                                ),
                                child: Text(
                                  'De – 20:00 às 22:00 hs – Expresso da Saudade (Com Toninho Carrasco)',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(''),
                              ),
                              Container(
                                child: Text('Domingo',
                                style: TextStyle(
                                  fontSize: 23,
                                ),
                                ),
                              ),
                              Container(
                                child: Text(''),
                              ),
                              Image(
                                image:
                                AssetImage('assets/images/coroa.jpg'),
                                width: MediaQuery.of(context).size.width,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(50.0),
                                  ),
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xFFFFC107),
                                      Color(0xFFF44336),
                                    ],
                                  ),
                                ),
                                child: Text(
                                  'De – 07:00 às 08:00 hs – Clube do Rei (Musical)',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(''),
                              ),
                              Image(
                                image:
                                AssetImage('assets/images/joaoPena.jpg'),
                                width: MediaQuery.of(context).size.width,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(50.0),
                                  ),
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xFFFFC107),
                                      Color(0xFFF44336),
                                    ],
                                  ),
                                ),
                                child: Text(
                                  'De – 08:00 às 10:00 – A Voz da Imaculada (Com João Pena)',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(''),
                              ),
                              Image(
                                image:
                                AssetImage('assets/images/fogos.jpg'),
                                width: MediaQuery.of(context).size.width,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(50.0),
                                  ),
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xFFFFC107),
                                      Color(0xFFF44336),
                                    ],
                                  ),
                                ),
                                child: Text(
                                  'De – 10:00 às 13:00 hs – Domingo Show (Com Efrain do Marajó)',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(''),
                              ),
                              Image(
                                image:
                                AssetImage('assets/images/musical.jpg'),
                                width: MediaQuery.of(context).size.width,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(50.0),
                                  ),
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xFFFFC107),
                                      Color(0xFFF44336),
                                    ],
                                  ),
                                ),
                                child: Text(
                                  'De – 13:00 às 18:00 hs – Musical 87 (Musical)',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}