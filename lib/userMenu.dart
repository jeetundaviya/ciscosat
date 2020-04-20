import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class userMenu extends StatefulWidget {
  @override
  _userMenuState createState() => _userMenuState();
}

class _userMenuState extends State<userMenu> {
  String Location, Remark;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey,
        title: Text(
          'M E N U',
          style: GoogleFonts.francoisOne(
            fontSize: 40,
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              SizedBox(
                height: 200,
              ),
              userOption(context, 'M Y  D U T Y', 'userduties'),
              SizedBox(
                height: 50,
              ),
              userOption(context, 'R E M A R K S', 'remarks'),
              SizedBox(
                height: 50,
              ),
              userOption(context, 'S U P P O R T', 'support'),
              SizedBox(
                height: 150,
              ),
              Container(
                height: 50,
                width: 150,
                child: FloatingActionButton.extended(
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut();
                    Navigator.pushNamed(context, '/');
                  },
                  backgroundColor: Colors.grey[800],
                  icon: Icon(Icons.exit_to_app),
                  label: Text('L O G O U T',
                      style: GoogleFonts.francoisOne(
                        fontSize: 20,
                      )),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Container userOption(BuildContext context, String Title, String GotoPath) {
    return Container(
      width: 250,
      decoration: BoxDecoration(
        border: Border.all(width: 5, color: Colors.grey[400]),
        borderRadius: BorderRadius.all(
            Radius.circular(25.0) //         <--- border radius here
            ),
      ),
      child: RawMaterialButton(
        onPressed: () {
          Navigator.pushNamed(context, '/$GotoPath');
        },
        child: Text(
          ' $Title ',
          style: GoogleFonts.francoisOne(fontSize: 30, color: Colors.grey[600]),
        ),
      ),
    );
  }
}
