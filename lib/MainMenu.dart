import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class menu extends StatefulWidget {
  @override
  _menuState createState() => _menuState();
}

class _menuState extends State<menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey,
        title: Text('M E N U',
            style: GoogleFonts.francoisOne(
              fontSize: 40,
            )),
      ),
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                child: Image.asset('images/logo_with_name.png'),
              ),
              SizedBox(
                height: 50,
              ),
              FloatingActionButton.extended(
                heroTag: 'h1',
                backgroundColor: Colors.grey,
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                icon: Icon(Icons.input),
                label: Text(
                  'L O G I N',
                  style: GoogleFonts.francoisOne(fontSize: 30),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              FloatingActionButton.extended(
                heroTag: 'h2',
                backgroundColor: Colors.grey,
                onPressed: () {
                  Navigator.pushNamed(context, '/remarks');
                },
                icon: Icon(Icons.edit),
                label: Text(
                  'R E M A R K S',
                  style: GoogleFonts.francoisOne(fontSize: 30),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              FloatingActionButton.extended(
                heroTag: 'h3',
                backgroundColor: Colors.grey,
                onPressed: () {
                  Navigator.pushNamed(context, '/support');
                },
                icon: Icon(Icons.child_care),
                label: Text(
                  'S U P P O R T',
                  style: GoogleFonts.francoisOne(fontSize: 30),
                ),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
