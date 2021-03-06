import 'package:radiosalvaterrafm/animacao/bottom_navy_bar.dart';
import 'package:radiosalvaterrafm/Widgets/sign.dart';
import 'package:radiosalvaterrafm/telas/Principal.dart';
import 'package:radiosalvaterrafm/telas/chat.dart';
import 'package:radiosalvaterrafm/telas/user.dart';
import 'package:radiosalvaterrafm/Widgets/radioInformation.dart';
import 'package:flutter_radio/flutter_radio.dart';
import 'dart:async';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main()async {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
    theme: ThemeData(iconTheme: IconThemeData(color: Colors.red)),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isPlaying;
  int _currentIndex = 0;
  var _pages = [User(), Principal(), Chat()];

  void pageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  PageController pageController = PageController(
    initialPage: 1,
    keepPage: true,
  );

  void bottomTapped(int index) {
    setState(() {
      _currentIndex = index;
      pageController.animateToPage(index,
          duration: Duration(milliseconds: 500), curve: Curves.ease);
    });
  }
  MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    keywords: <String>['flutterio', 'beautiful apps'],
    contentUrl: 'https://flutter.io',
    childDirected: false,
    testDevices: <String>[],
);



  @override
  void initState() {
    super.initState();
    FirebaseAdMob.instance
    .initialize(appId: "ca-app-pub-3652623512305285~5040470589");
    _currentIndex = 1;
    audioStart();
    playingStatus();
  }

  Future playingStatus() async {
    bool isP = await FlutterRadio.isPlaying();
    setState(() {
      isPlaying = isP;
    });
  }

  Future<void> audioStop() async {
    await FlutterRadio.stop();
  }

  Future<void> audioStart() async {
    await FlutterRadio.audioStart();
    print('Audio Start OK');
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async=>false,
      child: Scaffold(
        body: PageView(
          controller: pageController,
          children: _pages,
          onPageChanged: (index) {
            pageChanged(index);
          },
        ),
        bottomNavigationBar: BottomNavyBar(
          selectedIndex: _currentIndex,
          showElevation: true,
          itemCornerRadius: 8,
          curve: Curves.easeInBack,
          onItemSelected: (index) => setState(() {
            bottomTapped(index);
          }),
          items: [
            BottomNavyBarItem(
              icon: Icon(Icons.person),
              title: Text('Usuario'),
              activeColor: Colors.amberAccent,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.radio),
              title: Text('Radio'),
              activeColor: Colors.amber[900],
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.message),
              title: Text('Chat'),
              activeColor: Colors.red,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
