import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LiveMenu extends StatefulWidget {
  @override
  _LiveMenuState createState() => _LiveMenuState();
}

class _LiveMenuState extends State<LiveMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey,
        title: Text(
          'L I V E',
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
              LiveUpdatesMenuOptions(context, 'A R E A S', 'UpdatedArea'),
              SizedBox(
                height: 50,
              ),
              LiveUpdatesMenuOptions(context, 'F L O O R S', 'UpdatedFloor'),
              SizedBox(
                height: 50,
              ),
              LiveUpdatesMenuOptions(
                  context, 'D U S T B I N S', 'UpdatedDustbin'),
              SizedBox(
                height: 150,
              ),
              Container(
                height: 50,
                width: 150,
                child: FloatingActionButton.extended(
                  onPressed: () {
                    Navigator.pushNamed(context, '/MainMenu');
                  },
                  backgroundColor: Colors.grey[800],
                  icon: Icon(Icons.exit_to_app),
                  label: Text('GO BACK',
                      style: GoogleFonts.francoisOne(fontSize: 20,)),),
              )
            ],
          ),
        ],
      ),
    );
  }

  Container LiveUpdatesMenuOptions(
      BuildContext context, String Title, String GotoPath) {
    return Container(
      width: 250,

      decoration: BoxDecoration(
        border: Border.all(width: 5, color: Colors.black26),
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
          style: GoogleFonts.francoisOne(fontSize: 30, color: Colors.black54),
        ),
      ),
    );
  }
}
