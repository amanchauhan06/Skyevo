import 'package:flutter/material.dart';
import 'package:skyevo/Core/Services/auth.dart';
import 'package:skyevo/UI/Screens/LoginSignUpScreen/loginSignUpScreen.dart';
import 'package:skyevo/UI/Utils/Colors/colors.dart';
import 'package:skyevo/UI/Utils/Styles/textStyle.dart';
import 'package:skyevo/UI/Widgets/flatButton.dart';

class HomeScreen extends StatefulWidget {
final email;
HomeScreen({this.email});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.fromLTRB(40, 20, 40, 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Text('Hello Skyevo Team',style: h1BlackText,)),
           Text('I am glad doing this task',style: h2BlackLightText,),
           SizedBox(height: 20,),
            flatButton(context, 'Log Out', ()async{
              await Auth().signOut();
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginSignUpScreen()));
            }, blackText)
          ],
        ),
      ),
    );
  }
}
