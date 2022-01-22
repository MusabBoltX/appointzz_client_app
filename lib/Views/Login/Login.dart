import 'package:flutter/cupertino.dart';
import 'dart:ui';
import 'package:appointzz_1/Views/SignUp/SignUp.dart';
import 'package:flutter/material.dart';

import 'Login_Button.dart';

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController passController;
  TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.navigate_before_rounded,
              size: 35,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            }),
        title: Image.asset(
          'assests/logo.png',
          color: Color.fromRGBO(231, 232, 225, 1),
          scale: 4.3,
        ),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(7, 78, 99, 0.8),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
          child: Column(
            children: <Widget>[
              Align(
                child: Container(
                    child: Text("Log In",
                        textScaleFactor: 1.0,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(7, 78, 99, 0.8),
                          letterSpacing: 0.7,
                        ))),
              ),

              SizedBox(
                height: 40.00,
              ),

              // --- Text Field( Email ) --- //
              Theme(
                data: ThemeData(primaryColor: Colors.transparent),
                child: Container(
                  height: 55,
                  child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      elevation: 2,
                      margin: EdgeInsets.only(right: 10, left: 10),
                      color: Colors.white,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.mail,
                              color: Color.fromRGBO(7, 78, 99, 0.7),
                            ),
                          ),
                          Container(
                            // color: Colors.blue,
                            width: MediaQuery.of(context).size.width * 0.65,
                            child: TextField(
                              maxLines: 1,
                              selectionWidthStyle: BoxWidthStyle.tight,
                              controller: emailController,
                              cursorColor: Color.fromRGBO(7, 78, 99, 0.7),
                              decoration: InputDecoration(
                                hintText: 'Email',
                                  enabledBorder: InputBorder.none,
                                  contentPadding: EdgeInsets.only(left: 7)),
                            ),
                          ),
                        ],
                      )),
                ),
              ),

              Container(height: 25),

              // --- Text Field( Password ) --- //
              Theme(
                data: ThemeData(primaryColor: Colors.transparent),
                child: Container(
                  height: 55,
                  child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      elevation: 2,
                      margin: EdgeInsets.only(right: 10, left: 10),
                      color: Colors.white,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.lock,
                              color: Color.fromRGBO(7, 78, 99, 0.7),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.6,
                            child: TextField(
                              maxLines: 1,
                              selectionWidthStyle: BoxWidthStyle.tight,
                              controller: passController,
                              cursorColor: Color.fromRGBO(7, 78, 99, 0.7),
                              decoration: InputDecoration(
                                  hintText: 'Password',
                                  enabledBorder: InputBorder.none,
                                  contentPadding: EdgeInsets.only(left: 7)),
                            ),
                          ),
                        ],
                      )),
                ),
              ),

              Container(height: 25),

              LoginButton(),

              Container(height: 20),

              Container(
                child: Column(
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(
                        fontSize: 15
                        // color: Color.fromRGBO(7, 78, 99, 0.8),
                      ),
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              CupertinoPageRoute(builder: (context) => SignUp()));
                        },
                        child: Text("\nSign up",
                          style: TextStyle(
                            fontSize: 15,
                            color: Color.fromRGBO(7, 78, 99, 0.8),
                          ),
                        )),
                  ],
                ),
              ),

              Container(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
