import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';

class modifyFloor extends StatefulWidget {
  @override
  _modifyFloorState createState() => _modifyFloorState();
}

String _areano, _areavalue;

class _modifyFloorState extends State<modifyFloor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey,
        title: Text(
          'M . F L O O R',
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
                  hintText: 'Floor no.',
                  // helperText: 'Keep it short, this is just a demo.',
                  labelText: 'Floor no.',

                  prefixIcon: Icon(
                    Icons.radio_button_checked,
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
                  hintText: 'Floor percentage',
                  // helperText: 'Keep it short, this is just a demo.',
                  labelText: 'Floor percentage',

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
                // heroTag: null,
                backgroundColor: Colors.grey[800],
                onPressed: () async {
                  print('$_areano::$_areavalue');
                  await Firestore.instance
                      .collection('FLOORS')
                      .document('$_areano')
                      .setData({
                    'FNO': '$_areano',
                    'FVALUE': '$_areavalue'
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
//                await Firestore.instance.collection('FLOORS').document('$_areano').updateData({
//                  'FNO':'$_areano',
//                  'FVALUE':'$_areavalue'
//                }).catchError((e){print(e);});
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
