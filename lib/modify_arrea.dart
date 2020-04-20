import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';

class modifyArea extends StatefulWidget {
  @override
  _modifyAreaState createState() => _modifyAreaState();
}

String _areano, _areavalue;

class _modifyAreaState extends State<modifyArea> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey,
        title: Text(
          'M . A R E A',
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
                height: 150,
              ),

              TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[600], width: 6),
                  ),
                  hintText: 'Area no.',
                  // helperText: 'Keep it short, this is just a demo.',
                  labelText: 'Area no.',

                  prefixIcon: Icon(
                    Icons.radio_button_unchecked,
                    color: Colors.grey[800],
                    size: 120,
                  ),
                  //prefixText: ' ',
                  //suffixText: 'USD',
                  //suffixStyle: const TextStyle(color: Colors.green)
                ),
                onChanged: (value) {
                  _areano = value;
                  print(_areano);
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
                  hintText: 'Area percentage',
                  // helperText: 'Keep it short, this is just a demo.',
                  labelText: 'Area percentage',

                  prefixIcon: Icon(
                    Icons.mode_edit,
                    color: Colors.grey[800],
                    size: 120,
                  ),
                  //prefixText: ' ',
                  //suffixText: 'USD',
                  //suffixStyle: const TextStyle(color: Colors.green)
                ),
                onChanged: (value) {
                  _areavalue = value;
                  print(_areavalue);
                },
                //autovalidate: true,
              ),

              SizedBox(
                height: 100,
              ),
              FloatingActionButton.extended(
                heroTag: null,
                backgroundColor: Colors.grey[800],
                onPressed: () async {
                  print('$_areano::$_areavalue');
                  await Firestore.instance
                      .collection('AREAS')
                      .document('$_areano')
                      .setData({
                    'ANO': '$_areano',
                    'AVALUE': '$_areavalue'
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
              FloatingActionButton.extended(
                heroTag: null,
                backgroundColor: Colors.grey[800],
                onPressed: () async {
                  // print('$_areano::$_areavalue');
                  await Firestore.instance
                      .collection('AREAS')
                      .document('$_areano')
                      .delete().catchError((e) {
                    print(e);
                  });
                },
                icon: Icon(Icons.indeterminate_check_box),
                label: Text(
                  ' D E L E T E ',
                  style: GoogleFonts.francoisOne(fontSize: 30),
                ),
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
