import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UsersMapRoute extends StatefulWidget {
  @override
  _UsersMapRouteState createState() => _UsersMapRouteState();
}

class _UsersMapRouteState extends State<UsersMapRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.grey,
          title: Text('LOCATE ROUTES',
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
                  var user = await FirebaseAuth.instance.currentUser();
                  String useremail = user.email;
                  Firestore.instance
                      .collection('ONGOINGWORK')
                      .document('$useremail')
                      .delete()
                      .catchError((e) {
                    print(e);
                  });

                  // Navigator.pushNamed(context, '/assigndriver');
                },
                icon: Icon(Icons.input),
                label: Text(
                  'START NAVIGATION',
                  style: GoogleFonts.francoisOne(fontSize: 30),
                ),
              ),
            ),
          ],
        ));
  }
}
