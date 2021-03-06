import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class modify extends StatefulWidget {
  @override
  _modifyState createState() => _modifyState();
}

class _modifyState extends State<modify> {
  String Location, Remark;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey,
        title: Text(
          'M O D I F Y',
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
              modifyOptions(context, 'A R E A S', 'marea'),
              SizedBox(
                height: 50,
              ),
              modifyOptions(context, 'F L O O R S', 'mfloor'),
              SizedBox(
                height: 50,
              ),
              modifyOptions(context, 'D U S T B I N S', 'mdustbin'),
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

  Container modifyOptions(BuildContext context, String Title, String GotoPath) {
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
