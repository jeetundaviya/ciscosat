import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserDuties extends StatefulWidget {
  @override
  _UserDutiesState createState() => _UserDutiesState();
}

class _UserDutiesState extends State<UserDuties> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey,
        title: Text(
          'M Y  D U T Y',
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
              mydutiesoptions(context, 'ASSIGNED WORK', 'userassignedWork'),
              SizedBox(
                height: 50,
              ),
              mydutiesoptions(context, 'UPDATE WORK', 'userupdateWork'),
              SizedBox(
                height: 50,
              ),
              mydutiesoptions(context, 'CHECK LIVE UPDATES', 'userlivemenu'),
              SizedBox(
                height: 150,
              ),
              Container(
                height: 50,
                width: 150,
                child: FloatingActionButton.extended(
                  onPressed: () {
                    Navigator.pushNamed(context, '/userMenu');
                  },
                  backgroundColor: Colors.grey[800],
                  icon: Icon(Icons.exit_to_app),
                  label: Text('GO BACK',
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

  Container mydutiesoptions(
      BuildContext context, String Title, String GotoPath) {
    return Container(
      width: 300,
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
