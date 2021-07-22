import 'package:cheap_food/Pages/homePage.dart';
import 'package:cheap_food/const.dart';
import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cheap Food',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: HomePage(),
        ),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: colorAccentuado,
          onPressed: () => {
          }, 
          label: Icon(Icons.qr_code)
        ),
      ),
    );
  }
}