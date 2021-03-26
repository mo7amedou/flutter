

import 'dart:async';

import 'package:flutter/material.dart';

import 'pages/SecondScreen.dart';

import 'pages/todo.dart';


void main()=> runApp(MyApp());
class MyApp extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
home: SplashScreen(),
 routes: {
        'todo' : (context){
          return ToDo(); 
        }, 
        'back' : (context){
          return SecondScreen();
        },
        
    }
    );
  }
}
class SplashScreen extends StatefulWidget{

  @override
  _SplashScreenState createState()=>_SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen>{
   @override
  void initState() { 
    super.initState();
    Timer(
      Duration(milliseconds:5000),()
       =>Navigator.push(context, MaterialPageRoute(builder:(context)=>SecondScreen()),),);
  }
  @override
  
  Widget build(BuildContext context) {
    return MaterialApp(
    home:Scaffold (
      body : Container(
        width: double.infinity,
        height:  double.infinity,
        decoration: BoxDecoration(
          color: Colors.red,
          image: DecorationImage(image: AssetImage('img/images.jpg'),
          fit: BoxFit.cover
        ),
        ),
    ),
    ),
   
    );
  }
}