import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class areas extends StatefulWidget {
  @override
  _areasState createState() => _areasState();
}

class _areasState extends State<areas> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            StreamBuilder<QuerySnapshot>(
                stream: Firestore.instance.collection('AREAS').snapshots(),
                builder: (context, area) {

                              if (!area.hasData) {
                                return Center(
                                    child: CircularProgressIndicator());
                              }


                              List<Column> AreaList = [];


                              for (var user in area.data.documents) {
                                String AreaTempValue =
                                user.data['AVALUE'].toString();
                                String AreaTempNo = user.data['ANO'].toString();
                                // int check_color=int.parse(floordata);

                                Column areabutton = Column(children: <Widget>[
                                  Container(
                                    width: 200.0,
                                    height: 200.0,
                                    child: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: RawMaterialButton(
                                        shape: CircleBorder(),
                                        fillColor:
                                        getcolor(int.parse(AreaTempValue)),
                                        child: Text(
                                          'A $AreaTempNo',
                                          style: GoogleFonts.francoisOne(
                                              fontSize: 30,
                                              color: Colors.white),
                                        ),
                                        onPressed: () {
                                          Navigator.pushNamed(
                                              context, '/floor');
                                        },
                                      ),
                                    ),
                                  ),
                                  //Column(children: Alert),
                                ],);

                                AreaList.add(areabutton);
                              }
                              return Screen(AreaList, 'A R E A S');
                }),

          ],
        ),
      ),
    );
  }

  Color getcolor(int percent) {
    Color colour;
    if (percent >= 70) {
      colour = Colors.redAccent;
    } else if (percent >= 30) {
      colour = Colors.yellow;
    } else {
      colour = Colors.greenAccent;
    }
    return colour;
  }

  Expanded Screen(List<Column> area, String Title) {
    return Expanded(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.grey,
          title: Text('$Title',
              style: GoogleFonts.francoisOne(
                fontSize: 40,
              )),
        ),
        body: ListView(
          children: area,
        ),
      ),
    );
  }

}