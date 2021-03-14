import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:skyevo/Core/Services/auth.dart';
import 'package:skyevo/UI/Screens/HomeScreen/homeScreen.dart';
import 'package:skyevo/UI/Utils/Colors/colors.dart';
import 'package:skyevo/UI/Utils/Styles/boxDecoration.dart';
import 'package:skyevo/UI/Utils/Styles/textStyle.dart';
import 'package:skyevo/UI/Widgets/flatButton.dart';
import 'package:skyevo/UI/Widgets/progressIndicator.dart';
import 'package:skyevo/UI/Widgets/scaffold.dart';


class LoginSignUpScreen extends StatefulWidget {
  @override
  _LoginSignUpScreenState createState() => _LoginSignUpScreenState();
}

class _LoginSignUpScreenState extends State<LoginSignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  var authHandler = new Auth();
  bool valid = false;
  String screen = 'login';
  bool agreed = false;
  bool loggingIn = false;
  bool registering = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(25, 80, 25, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome to',
                  style: h1BlackText,
                ),
                Text(
                  'Skyevo',
                  style: h1BlackText,
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          screen = 'login';
                        });
                      },
                      child: Text('Login',
                          style: screen == 'login' ? h5BlackText : h5GreyText),
                    ),
                    SizedBox(width: 30),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          screen = 'register';
                        });
                      },
                      child: Text('Register',
                          style:
                          screen == 'register' ? h5BlackText : h5GreyText),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Form(
                  key: _formKey,
                  child: ListView(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      TextFormField(
                        obscureText: false,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value.trim().isEmpty) {
                            return 'Email is empty';
                          } else if (!value.contains('@')) {
                            return 'Enter Correct Email ';
                          } else {
                            _notValid();
                            return null;
                          }
                        },
                        controller: email,
                        decoration: buildInputDecoration('Email'),
                      ),
                      screen == 'register'
                          ? SizedBox(
                        height: 0,
                      )
                          : SizedBox(),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        obscureText: true,
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.visiblePassword,
                        validator: (value) {
                          if (value.trim().isEmpty) {
                            return 'Password is empty';
                          } else if (value.length <= 8) {
                            return 'Password should be more than 8 characters ';
                          } else {
                            _notValid();
                            return null;
                          }
                        },
                        controller: password,
                        decoration: buildInputDecoration('Password'),
                      )
                      ,
                      SizedBox(
                        height: 10,
                      ),
                      screen == 'register'?TextFormField(
                        obscureText: true,
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.visiblePassword,
                        validator: (value) {
                          if (value.trim().isEmpty) {
                            return 'Confirm Password is empty';
                          } else if (value.length <= 8) {
                            return 'Password should be more than 8 characters ';
                          }else if (password.text!=confirmPassword.text) {
                            return 'Passwords should be same';
                          }
                          else {
                            _notValid();
                            return null;
                          }
                        },
                        controller: confirmPassword,
                        decoration: buildInputDecoration('Confirm Password'),
                      ):SizedBox()
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 20,
                ),
                screen == 'register'
                    ? registering == true
                    ? progressIndicator()
                    : flatButton(context, 'Register', () {
                  _isValid() == true
                      ? _registerSubmit(
                      email.text, password.text)
                      : print('hello');
                }, blackText)
                    : loggingIn == true
                    ? progressIndicator()
                    : flatButton(context, 'Login', () {
                  _isValid() == true
                      ? _loginSubmit(email.text, password.text)
                      : print('hello');
                }, blackText),
                SizedBox(
                  height: 20,
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }

  void _notValid() {
    setState(() {
      valid = false;
    });
  }

  bool _isValid() {
    return _formKey.currentState.validate();
  }

  void _registerSubmit(email, password) async {
    setState(() {
      registering = true;
    });
    var user = await authHandler.handleSignUp("$email", "$password");
    setState(() {
      registering = false;
    });
    if(user==true){
      Navigator.pushReplacement(context,  MaterialPageRoute(builder: (context) => HomeScreen(email: email,)));
    }
    else{
      showInSnackBar(context, '$user');
    }
  }

  void _loginSubmit(email, password) async {
    setState(() {
      loggingIn = true;
    });
  var user = await authHandler.handleSignInEmail("$email", "$password");
    setState(() {
      loggingIn = false;
    });
  if(user==true){
    Navigator.pushReplacement(context,  MaterialPageRoute(builder: (context) => HomeScreen(email: email)));
  }
  else{
    showInSnackBar(context, '$user');
  }

  }

}
