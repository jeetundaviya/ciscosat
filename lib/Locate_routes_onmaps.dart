import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';

class LocateOnMaps extends StatefulWidget {
  @override
  _LocateOnMapsState createState() => _LocateOnMapsState();
}

class _LocateOnMapsState extends State<LocateOnMaps> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.grey,
          title: Text('L O C A T E ',
              style: GoogleFonts.francoisOne(
                fontSize: 40,
              )),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 600,
            ),
            Center(
              child: FloatingActionButton.extended(
                // heroTag: null,
                backgroundColor: Colors.grey[800],
                onPressed: () async {
                  // print('$_areano::$_areavalue');
//                await Firestore.instance
//                    .collection('AREAS')
//                    .document('$_areano')
//                    .delete().catchError((e) {
//                  print(e);
//                });
                  Navigator.pushNamed(context, '/assigndriver');
                },
                icon: Icon(Icons.input),
                label: Text(
                  ' A S S I G N  D R I V E R ',
                  style: GoogleFonts.francoisOne(fontSize: 30),
                ),
              ),
            ),
          ],
        ));
  }
}
