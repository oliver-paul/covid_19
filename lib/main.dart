import 'package:covid_19/colorsource.dart';
import 'package:covid_19/homepage.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(

        primaryColor: primaryBlack
    ),
    home: HomePage(),
  ));
}
