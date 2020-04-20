import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class remarks extends StatefulWidget {
  @override
  _remarksState createState() => _remarksState();
}

class _remarksState extends State<remarks> {
  String areaLocation,
      areaRemark,
      floorLocation,
      floorRemark,
      dustbinLocation,
      dustbinRemark,
      user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey,
        title: Text('R E M A R K S',
            style: GoogleFonts.francoisOne(
              fontSize: 40,
            )),
      ),
      body: ListView(
        children: [
          Column(
            children: <Widget>[
              SizedBox(height: 50),
              Card(
                child: TextField(
                  decoration: new InputDecoration(
                    enabledBorder: new OutlineInputBorder(
                      borderSide:
                          new BorderSide(color: Colors.grey[600], width: 6),
                    ),
                    hintText: 'your ID (mandatory)',
                    // helperText: 'Keep it short, this is just a demo.',
                    labelText: 'ID',
                    prefixIcon: Icon(
                      Icons.account_circle,
                      color: Colors.grey[800],
                      size: 120,
                    ),
                    prefixText: ' ',
                    //suffixText: 'USD',
                    //suffixStyle: const TextStyle(color: Colors.green)
                  ),
                  onChanged: (value) {
                    // areaLocation = 'area'
                    user = value;
                  },
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Card(
                child: TextField(
                  decoration: new InputDecoration(
                    enabledBorder: new OutlineInputBorder(
                      borderSide:
                          new BorderSide(color: Colors.grey[600], width: 6),
                    ),
                    hintText: 'Area no.',
                    // helperText: 'Keep it short, this is just a demo.',
                    labelText: 'Area',
                    prefixIcon: Icon(
                      Icons.radio_button_unchecked,
                      color: Colors.grey[800],
                      size: 120,
                    ),
                    prefixText: ' ',
                    //suffixText: 'USD',
                    //suffixStyle: const TextStyle(color: Colors.green)
                  ),
                  onChanged: (value) {
                    areaLocation = 'area';
                    areaRemark = value;
                  },
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Card(
                child: TextField(
                  decoration: new InputDecoration(
                      enabledBorder: new OutlineInputBorder(
                        borderSide:
                            new BorderSide(color: Colors.grey[600], width: 6),
                      ),
                      hintText: 'Floor no.',
                      // helperText: 'Keep it short, this is just a demo.',
                      labelText: 'Floor',
                      prefixIcon: Icon(
                        Icons.radio_button_checked,
                        color: Colors.grey[800],
                        size: 120,
                      )

                      //suffixText: 'USD',
                      //suffixStyle: const TextStyle(color: Colors.green)
                      ),
                  onChanged: (value) {
                    floorLocation = 'floor';
                    floorRemark = value;
                  },
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Card(
                child: TextField(
                  decoration: new InputDecoration(
                      enabledBorder: new OutlineInputBorder(
                        borderSide:
                            new BorderSide(color: Colors.grey[600], width: 6),
                      ),
                      hintText: 'Dustbin no.',
                      // helperText: 'Keep it short, this is just a demo.',
                      labelText: 'Dustbin',
                      prefixIcon: Icon(
                        Icons.delete,
                        color: Colors.grey[800],
                        size: 120,
                      )
                      //prefixText: ' ',
                      //suffixText: 'USD',
                      //suffixStyle: const TextStyle(color: Colors.green)
                      ),
                  onChanged: (value) {
                    dustbinLocation = 'dustbin';
                    dustbinRemark = value;
                  },
                ),
              ),
              SizedBox(
                height: 30,
              ),
              FloatingActionButton.extended(
                backgroundColor: Colors.grey[800],
                onPressed: () {
                  Firestore.instance
                      .collection('REMARKS')
                      .document('$user')
                      .setData({
                    if (areaLocation != null && areaLocation != null)
                      'Field1': areaLocation,
                    'Remark1': areaRemark,
                    if (floorLocation != null && floorLocation != null)
                      'Field2': floorLocation,
                    'Remark2': floorRemark,
                    if (dustbinLocation != null && dustbinLocation != null)
                      'Field3': dustbinLocation,
                    'Remark3': dustbinRemark
                  });
                },
                icon: Icon(Icons.check_circle),
                label: Text(
                  'S U B M I T',
                  style: GoogleFonts.francoisOne(fontSize: 30),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
