import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:skyevo/Core/Services/auth.dart';
import 'package:skyevo/UI/Screens/HomeScreen/homeScreen.dart';
import 'package:skyevo/UI/Screens/LoginSignUpScreen/loginSignUpScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    handleAuth();
  }

  handleAuth() async{
    var user = FirebaseAuth.instance.currentUser;
    Timer(Duration(seconds: 2), () {
          user == null?
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (BuildContext context) => LoginSignUpScreen()))
           :Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (BuildContext context) => HomeScreen()));
        });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
