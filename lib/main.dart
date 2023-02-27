import 'package:flutter/material.dart';
import 'package:flutter_exam/homePage.dart';
void main()
{
 runApp(
   MaterialApp(
     debugShowCheckedModeBanner: false,
     routes: {
       '/' : (context) => Home(),
     },
   ),
 );
}