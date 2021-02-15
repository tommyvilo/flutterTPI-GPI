import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';





class es1 extends StatefulWidget {
  bool dark;
  es1(bool dark){ //costruttore
    this.dark = dark;
  }
  @override
  _MyAppState createState() => _MyAppState(dark);
}

class _MyAppState extends State<es1> {
  bool dark;
  _MyAppState(bool dark){
    this.dark=dark;
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Dark",
      debugShowCheckedModeBanner: false,
      home: homepage(dark),
    );
  }
}

class homepage extends StatefulWidget {
  bool dark;
  homepage(bool dark){
    this.dark = dark;
  }
  @override
  _homepageState createState() => _homepageState(dark);
}


class _homepageState extends State<homepage> {


  var dark;
  _homepageState(bool dark){
    this.dark=dark;
  }
  var text="";
  void getText(){
    text="ORA SEI IN ";
    if(dark){
      text+="DARK MODE";
    }
    else{
      text+="LIGHT MODE";
    }
    
  }

  void changeMode(){
    getText();
    dark=!dark;
    setState(() {
    });
  }


  @override
  Widget build(BuildContext context) {

    getText();
    return Scaffold(
      backgroundColor: dark ? Colors.black: Colors.white, //è uno short if
      appBar: AppBar(
        centerTitle: true,
        title: Text ("Dark"),
        backgroundColor: Colors.blueGrey[900],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget> [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text("$text" ,
                style: TextStyle(
                  color: dark ? Colors.white : Colors.black,
                  fontWeight: dark ? FontWeight.bold : FontWeight.bold,
                  fontSize: 20,
                ),

              ),
            ),
            RaisedButton(
              onPressed: changeMode,
              splashColor: dark ? Colors.black : Colors.white,
              shape: CircleBorder(),
              color: dark ? Colors.white : Colors.black, //è uno short if
              child: !dark ? Padding(
                padding: const EdgeInsets.all(20.0),
                child: Icon(FontAwesomeIcons.solidSun,color: Colors.white,),
              ) : Padding(
                padding: const EdgeInsets.all(20.0),
                child: Icon(FontAwesomeIcons.solidMoon),
              ) , //è uno short if
            ),
          ],
        ),
      ),
    );
  }
}


