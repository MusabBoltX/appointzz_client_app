import 'package:appointzz_1/Views/Home/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';



class SignUpButton extends StatefulWidget {
  const SignUpButton({Key key}) : super(key: key);

  @override
  _SignUpButtonState createState() => _SignUpButtonState();
}

class _SignUpButtonState extends State<SignUpButton> {
  @override
  Widget build(BuildContext context) {

    return Container(

      width: 190,
      height: 50,
      child: RaisedButton(
          color: Color.fromRGBO(7, 78, 99, 0.7),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),

        onPressed: (){
          Navigator.push(context,
            CupertinoPageRoute(builder: (context) => HomePage()));
        },

        child: Text('SIGN UP', style: TextStyle(color: Colors.white, letterSpacing: 1),),

      ),
    );
  }
}
