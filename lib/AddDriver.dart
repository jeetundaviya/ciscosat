import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';

class addDriver extends StatefulWidget {
  @override
  _addDriverState createState() => _addDriverState();
}

String _driverNo, _driverName;

class _addDriverState extends State<addDriver> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey,
        title: Text(
          'A D D D R I V E R',
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
                height: 50,
              ),
              Icon(
                Icons.airport_shuttle,
                color: Colors.grey[800],
                size: 150,
              ),
              SizedBox(
                height: 50,
              ),

              TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[600], width: 6),
                  ),
                  hintText: 'ID no.',
                  // helperText: 'Keep it short, this is just a demo.',
                  labelText: 'ID no.',

                  prefixIcon: Icon(
                    Icons.account_circle,
                    color: Colors.grey[800],
                    size: 120,
                  ),
                  //prefixText: ' ',
                  //suffixText: 'USD',
                  //suffixStyle: const TextStyle(color: Colors.green)
                ),
                onChanged: (value) {
                  _driverNo = value;
                  print(_driverNo);
                },
                //autovalidate: true,
              ),

              SizedBox(
                height: 50,
              ),

              TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[600], width: 6),
                  ),
                  hintText: 'Driver Details',
                  // helperText: 'Keep it short, this is just a demo.',
                  labelText: 'Driver Details',

                  prefixIcon: Icon(
                    Icons.assignment,
                    color: Colors.grey[800],
                    size: 120,
                  ),
                  //prefixText: ' ',
                  //suffixText: 'USD',
                  //suffixStyle: const TextStyle(color: Colors.green)
                ),
                onChanged: (value) {
                  _driverName = value;
                  print(_driverName);
                },
                //autovalidate: true,
              ),

              SizedBox(
                height: 100,
              ),
              FloatingActionButton.extended(
                // heroTag: null,
                backgroundColor: Colors.grey[800],
                onPressed: () async {
                  print('$_driverNo::$_driverName');
                  await Firestore.instance
                      .collection('DRIVERS')
                      .document('$_driverNo')
                      .setData({
                    'IDNO': '$_driverNo',
                    'DDETAILS': '$_driverName'
                  }).catchError((e) {
                    print(e);
                  });
                },
                icon: Icon(Icons.add_circle),
                label: Text(
                  ' A D D ',
                  style: GoogleFonts.francoisOne(fontSize: 30),
                ),
              ),
              SizedBox(
                height: 50,
              ),

//              FloatingActionButton.extended(
//                heroTag: null,
//                backgroundColor: Colors.grey[800],
//                onPressed: ()async{print('$_areano::$_areavalue');
//      await Firestore.instance.collection('AREAS').document('$_areano').updateData({
//        'ANO':'$_areano',
//        'AVALUE':'$_areavalue'
//      }).catchError((e){print(e);});
//                },
//                icon: Icon(Icons.autorenew),
//                label: Text(
//                  ' U P D A T E ',
//                  style: GoogleFonts.francoisOne(fontSize: 30),
//                ),
//              ),
            ],
          ),
        ],
      ),
    );
  }
}
