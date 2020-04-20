import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AfterMenu extends StatefulWidget {
  @override
  _AfterMenuState createState() => _AfterMenuState();
}

class _AfterMenuState extends State<AfterMenu> {
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
              AfterMenuOptions(context, 'A R E A S', 'UpdatedArea'),
              SizedBox(
                height: 50,
              ),
              AfterMenuOptions(context, 'F L O O R S', 'UpdatedFloor'),
              SizedBox(
                height: 50,
              ),
              AfterMenuOptions(context, 'D U S T B I N S', 'UpdatedDustbin'),
              SizedBox(
                height: 50,
              ),
              FloatingActionButton.extended(
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                    Navigator.pop(context);
                  },
                  backgroundColor: Colors.black26,
                  icon: Icon(Icons.exit_to_app),
                  label: Text('L O G O U T'))
            ],
          ),
        ],
      ),
    );
  }

  Container AfterMenuOptions(
      BuildContext context, String Title, String GotoPath) {
    return Container(
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
