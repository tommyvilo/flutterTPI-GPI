import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:async';
import 'package:cron/cron.dart';




class es2 extends StatefulWidget {
  bool dark;
  es2(bool dark){ //costruttore
    this.dark = dark;
  }
  @override
  _MyAppState createState() => _MyAppState(dark);
}

class _MyAppState extends State<es2> {
  bool dark;
  _MyAppState(bool dark){
    this.dark=dark;
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Cronometro",
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



  int secondi=0;
  int minuti=0;
  String zero="0";
  String zero1="0";
  String ISECONDI="0";
  String erTesto="";
  bool ck=false;
  Timer _timer;



  void start(){

    if(_timer==null){
      if(!ck){
        ck=!ck;
        const oneSec = const Duration(seconds:1);
        _timer = new Timer.periodic(oneSec, (Timer t) { secondi++; upgrade(secondi); } );}
    }
    else{
      ck=!ck;
      upgrade(secondi);
      _timer.cancel();
      _timer = null;
    }
  }

  void stop(){
    if(_timer!=null){
      _timer.cancel();
      _timer = null;
    }
    ck=false;
    zero="0";
    minuti=0;
    secondi=0;
    upgrade(0);
  }

  void upgrade(int secondi){
    if(secondi==10){
      zero="";
    }

    if(secondi==60){
      zero="0";
      secondi=0;
      minuti++;
    }

    if(minuti>=10){
      zero1 = "";
    }

    this.secondi = secondi;

    setState(() {}); //richiamandolo si aggiorna la UI
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: dark ? Colors.black: Colors.white, //è uno short if
      appBar: AppBar(
        centerTitle: true,
        title: Text ("Cronometro"),
        backgroundColor: Colors.blueGrey[900],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("CRONOMETRO",
              style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(zero1 + "$minuti"+":"+ zero +"$secondi", style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RaisedButton(
                  onPressed: start,
                  color: ck? Colors.red : Colors.green,
                  child: Text(ck? "STOP": "START",  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,),),
                  splashColor: dark ? Colors.black : Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: ck? Colors.red : Colors.green, )
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(""),
                ),
                RaisedButton(
                  onPressed: stop,
                  child: Text("RESET", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                  color: Colors.red,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.red)
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


