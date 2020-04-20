// ignore: avoid_web_libraries_in_flutter
//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Starter extends StatefulWidget {
  @override
  _StarterState createState() => _StarterState();
}

class _StarterState extends State<Starter> {
  @override
  Widget build(BuildContext context) {
    String color = 'red';
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Container(
                child: Image.asset("images/logo_with_name.png"),
              ),
            ),
            SizedBox(
              height: 150,
            ),
            FloatingActionButton.extended(
              backgroundColor: Colors.grey,
              onPressed: () {
                Navigator.pushNamed(context, '/menu');
              },
              icon: Icon(Icons.menu),
              label: Text(
                'GO TO MENU',
                style: GoogleFonts.francoisOne(fontSize: 30),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
