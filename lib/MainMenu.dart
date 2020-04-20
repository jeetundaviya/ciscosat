import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MainMenu extends StatefulWidget {
  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
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
//              Container(
//                child: Image.asset('images/logo_with_name.png'),
//              ),
              SizedBox(
                height: 50,
              ),
//              FloatingActionButton.extended(
//                heroTag: 'h1',
//                backgroundColor: Colors.grey,
//                onPressed: () {
//                  Navigator.pushNamed(context, '/login');
//                },
//                icon: Icon(Icons.input),
//                label: Text(
//                  'L O G I N',
//                  style: GoogleFonts.francoisOne(fontSize: 30),
//                ),
//              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: 350,
                child: FloatingActionButton.extended(
                  heroTag: 'h2',
                  //backgroundColor: Colors.grey,
                  onPressed: () {
                    Navigator.pushNamed(context, '/reports');
                  },
                  backgroundColor: Colors.grey[800],
                  label: Text(
                    'REPORTS',
                    style: GoogleFonts.francoisOne(fontSize: 30),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: 350,
                child: FloatingActionButton.extended(
                  heroTag: 'h3',
                  // backgroundColor: Colors.grey,
                  onPressed: () {
                    Navigator.pushNamed(context, '/complains');
                  },
                  backgroundColor: Colors.grey[800],
                  label: Text(
                    'COMPLAINS',
                    style: GoogleFonts.francoisOne(fontSize: 30),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: 350,
                child: FloatingActionButton.extended(
                  heroTag: null,

                  onPressed: () {
                    Navigator.pushNamed(context, '/adddriver');
                  },
                  backgroundColor: Colors.grey[800],
                  label: Text(
                    'ADD DRIVER',
                    style: GoogleFonts.francoisOne(fontSize: 30),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: 350,
                child: FloatingActionButton.extended(
                  heroTag: null,
                  backgroundColor: Colors.grey[800],
                  onPressed: () {
                    Navigator.pushNamed(context, '/locateonmaps');
                  },

                  label: Text(
                    'ASSIGN DRIVER',
                    style: GoogleFonts.francoisOne(fontSize: 30),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: 350,
                child: FloatingActionButton.extended(
                  heroTag: null,
                  backgroundColor: Colors.grey[800],
                  onPressed: () {
                    Navigator.pushNamed(context, '/LiveLogin');
                  },

                  label: Text(
                    'LIVE UPDATES',
                    style: GoogleFonts.francoisOne(fontSize: 30),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: 350,
                child: FloatingActionButton.extended(
                  heroTag: null,
                  backgroundColor: Colors.grey[800],
                  onPressed: () {
                    Navigator.pushNamed(context, '/modifymenu');
                  },

                  label: Text(
                    'MODIFIY UPDATES',
                    style: GoogleFonts.francoisOne(fontSize: 30),
                  ),
                ),
              ),
              SizedBox(
                height: 150,
              ),
              FloatingActionButton.extended(
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                    Navigator.pop(context);
                  },
                  backgroundColor: Colors.grey[900],
                  icon: Icon(Icons.exit_to_app),
                  label: Text('L O G O U T'))
            ],
          ),
        ],
      ),
    );
  }
}
