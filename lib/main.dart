import 'package:flutter/material.dart';
import 'package:flutter_app_kuliner_sidoarjo/screen/homescreen.dart';
import 'package:flutter_app_kuliner_sidoarjo/widget/listNamakuliner.dart';
import 'package:flutter_app_kuliner_sidoarjo/screen/namatempatscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyBottomNavigationBar(),

    );
  }
}

class MyBottomNavigationBar extends StatefulWidget {
  @override
  _MyBottomNavigationBarState createState()=> _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomeScreen(),
    namatempatscreen()
  ];

  void onTappedBar(int index){
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(

        onTap: onTappedBar,
        currentIndex: _currentIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.greenAccent,

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.place),
            label: 'Tempat Kuliner',
            backgroundColor: Colors.greenAccent,

          ),
        ],
        //currentIndex: 0,
        backgroundColor: Colors.green,
        selectedItemColor: Colors.white,
        //onTap: _onItemTapped,
      ),
    );
  }


}

