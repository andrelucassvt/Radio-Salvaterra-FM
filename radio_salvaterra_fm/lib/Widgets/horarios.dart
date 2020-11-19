import 'package:flutter/material.dart';

class Horarios extends StatefulWidget {
  @override
  _HorariosState createState() => _HorariosState();
}

class _HorariosState extends State<Horarios> {


  Widget lista(String dia, String texto){
    return Column(
      children: <Widget>[

      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Horários'),
        centerTitle: true,
        backgroundColor: Colors.red,
        leading: IconButton(
          iconSize: 32,
          icon: Icon(Icons.keyboard_arrow_down),
          onPressed: ()=>Navigator.of(context).pop()),
      ),

      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(child: Text('Segunda a Sexta',style: TextStyle(fontSize: 20),)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('06:00 às 08:00 - Bom dia Salvaterra(Fernando Silva)'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('08:00 às 11:00 - Alô Salvaterra(Marcelo Nunes)'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('11:00 às 13:00 - Salvaterra News(Jorge Alves e Etiene Angelim)'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('13:00 às 15:00 - Frequência Jovem(Jimmy Rafael)'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('15:00 às 17:00 - Super Tarde Salvaterra(Efrain do Marajó)'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('17:00 às 18:00 - Igreja em saída(João Pena)'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('18:00 às 20:00 - Ritmo das aparelhagens(Thiago Nunes e Dj Pedrinho Pressão)'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('20:00 às 22:00 - Expresso da saudade(Toninho Carrasco)'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('22:00 às 23:00 - Caminhando com Jesus(Silvio Moura)'),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(child: Text('Sábado',style: TextStyle(fontSize: 20),)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('06:00 às 07:00 - Clube do Rei(Musical)'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('07:00 às 09:00 - Salvaterra rural(Jorge Alves)'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('09:00 às 12:00 - Trio das marcantes(Mathyas e Dj Bruno Silva)'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('12:00 às 14:00 - Programa do Feroz clássico Tonnysom(Dj Claudinho)'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('14:00 às 16:00 - Sabadão show(Dj Bruno Silva e Dj júnior)'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('16:00 às 18:00 - Batidão 87(Davi nascimento e Dj Marcielzinho)'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('18:00 às 20:00 - No ritmo das aparelhagens(Thiago Nunes e Dj Pedrinho Pressão)'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('20:00 às 22:00 - Expresso da saudade(Toninho Carrasco)'),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(child: Text('Domingo',style: TextStyle(fontSize: 20),)),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('06:00 às 07:00 - Programação musical'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('07:00 às 08:00 - Clube do rei'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('08:00 às 10:00 - A voz da imaculada(João Pena)'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('10:00 às 14:00 - Domingo show(Efrain Marajó)'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('14:00 às 18:00 - Musical 87'),
          ),
        ],
      ),
    );
  }
}