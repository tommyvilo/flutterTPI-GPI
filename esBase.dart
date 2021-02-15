import 'package:flutter/material.dart';





class esBase extends StatefulWidget {
  bool dark;
  esBase(bool dark){ //costruttore
    this.dark = dark;
  }
  @override
  _MyAppState createState() => _MyAppState(dark);
}

class _MyAppState extends State<esBase> {
  bool dark;
  _MyAppState(bool dark){
    this.dark=dark;
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Hello Flutter",
      debugShowCheckedModeBanner: false,
      home: homepage(true),
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



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: dark ? Colors.black: Colors.white, //è uno short if
      appBar: AppBar(
        centerTitle: true,
        title: Text ("Hello Flutter"),
        backgroundColor: Colors.blueGrey[900],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget> [
            Text("HELLO FLUTTER",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("made with ",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(
                    Icons.favorite,
                    color: Colors.white,
                    size: 24.0,
                  ),
                  Text(" by",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Text("Vilotto Tommaso & Zerman Nicolò",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}






















