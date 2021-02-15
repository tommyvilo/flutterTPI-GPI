import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:es2/es1.dart';
import 'package:es2/es2.dart';
import 'package:es2/esBase.dart';



var dark=false;

void main() {

  runApp(MyApp());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.white,));

}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Hello Flutter",
      debugShowCheckedModeBanner: false,
      home: myNavbar(),
    );
  }
}



class myNavbar extends StatefulWidget {
  @override
  _myNavbarState createState() => _myNavbarState();
}

class _myNavbarState extends State<myNavbar> {
  int _currentIndex = 0;
  final List<Widget> children = [
    esBase(true),
    es1(dark),
    es2(dark),
  ];

  void onTappedBar(int index){
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: dark ? Colors.black54 : Colors.white,
        onTap: onTappedBar,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.drag_handle),
            label: 'es Base',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wb_sunny),
            label: 'es 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timer),
            label: 'es 2',
          ),
        ],
      ),
    );
  }
}
