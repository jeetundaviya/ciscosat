import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class support extends StatefulWidget {
  @override
  _supportState createState() => _supportState();
}

class _supportState extends State<support> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey,
        title: Text('S U P P O R T',
            style: GoogleFonts.francoisOne(
              fontSize: 40,
            )),
      ),
      body: ListView(
        children: [
          Column(
            children: <Widget>[
              SizedBox(
                height: 170,
              ),
              remark(
                  Icon(
                    Icons.mail,
                    color: Colors.grey[800],
                  ),
                  'Mail us ',
                  'Mail us at',
                  ' help@ciscosat.com                    (we will get back to you within 48 hours) '),
              remark(
                  Icon(
                    Icons.call,
                    color: Colors.grey[800],
                  ),
                  'Call us ',
                  'Call us on',
                  'Tollfree no. 8888xxxxxx                                          (27X7)'),
              remark(
                  Icon(
                    Icons.chat,
                    color: Colors.grey[800],
                  ),
                  'Chat with bot',
                  'Chat with bot',
                  'Sorry bot is underconstruction Still you can                                       Mail us or Call us '),
              remark(
                  Icon(
                    Icons.account_circle,
                    color: Colors.grey[800],
                  ),
                  'Credits',
                  'Credits',
                  '*Dhruvkumar Dholakiya           *Tanmay Kshirsagar                 *Jeet Undaviya                                 *Kevin Khunt                            *Jaykumar Kadiwala            *Vandita Chapadia'),
              remark(
                  Icon(
                    Icons.timelapse,
                    color: Colors.grey[800],
                  ),
                  'F A Q s',
                  'F  A  Q s',
                  '1. Not able to log in ?                                A. * Check your net connection                                *Close and reopen app                           *Reinstall or update app version                   *For more info Mail us or Call us'),
            ],
          ),
        ],
      ),
    );
  }

  Column remark(Icon icon, String location, String Title, String Desc) {
    return Column(
      children: <Widget>[
        FloatingActionButton.extended(
          heroTag: null,
          icon: icon,
          onPressed: () {
            Alert(
              context: context,
              title: Title,
              desc: Desc,
              buttons: [
                DialogButton(
                    child: Text(
                      'O K',
                      style: GoogleFonts.francoisOne(
                          fontSize: 30, color: Colors.white),
                    ),
                    color: Colors.grey,
                    onPressed: () {
                      Navigator.pop(context);
                    })
              ],
            ).show();
          },
          backgroundColor: Colors.grey,
          label: Text(
            location,
            style: GoogleFonts.francoisOne(fontSize: 30),
          ),
        ),
//        Card(
//          child: TextField(
//            decoration: new InputDecoration(
//              enabledBorder: new OutlineInputBorder(
//                borderSide: new BorderSide(
//                    color: Colors.grey[600], width: 6),),
//              hintText: '$location no.',
//              // helperText: 'Keep it short, this is just a demo.',
//              labelText: '$location',
//              prefixIcon: icon,
//              prefixText: ' ',
//              //suffixText: 'USD',
//              //suffixStyle: const TextStyle(color: Colors.green)
//            ),
//            onChanged: (value) {
//
//            },
//          ),
//        ),
        SizedBox(
          height: 40,
        ),
      ],
    );
  }
}
