import 'package:appointzz_1/Services/Internet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Views/LogReg/LogReg.dart';

void main() {
  runApp(MyAppointzz());
}

class MyAppointzz extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  InternetChecker _internetChecker = InternetChecker();
  @override
  void initState() {
    super.initState();
    _internetChecker.connectionStatus();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, CupertinoPageRoute(builder: (context) => LogReg()));
    });
  }


  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(7, 78, 99, 0.8),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it in the middle of the parent.

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: <Widget>[
            Container(
              child: Image.asset(
                'assests/logo.png',
                color: Color.fromRGBO(231, 232, 225, 1),
                // color: Colors.black,
                scale: 1.7,
              ),
            ),
            Text('A One Click Hospital',
                textScaleFactor: 1.0,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromRGBO(231, 232, 225, 1),
                    letterSpacing: 1.0,
                    fontSize: 16,
                    fontStyle: FontStyle.italic)),
          ],
        ),
      ),
    );
  }
}
