import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class floors extends StatefulWidget {
  @override
  _floorsState createState() => _floorsState();
}

class _floorsState extends State<floors> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            StreamBuilder<QuerySnapshot>(
                stream:
                Firestore.instance.collection('FLOORS').snapshots(),
                builder: (context, floor) {
                  return StreamBuilder<QuerySnapshot>(
                      stream: Firestore.instance
                          .collection('DUSTBINS')
                          .snapshots(),
                      builder: (context, dustbin) {
                        if (!floor.hasData) {
                          return Center(
                              child: CircularProgressIndicator());
                        }

                        if (!dustbin.hasData) {
                          return Center(
                              child: CircularProgressIndicator());
                        }
                        List<Container> FloorList = [];

                        String TempDustbinData, TempDustbinID;

                        for (var dustbin in dustbin.data.documents) {
                          TempDustbinID = dustbin.data['DNO'];
                          TempDustbinData = dustbin.data['DVALUE'];
                          print("$TempDustbinID :: $TempDustbinData");
                        }

//                      int floorsum=0,flooravg=0,i=0,area1avg=0;
////                      String TempFloorNo;
                        for (var user in floor.data.documents) {
                          String TempFloorNo = user.data['FNO'];
                          String TempFloorData =
                          user.data['FVALUE'].toString();

                          Container floorbutton = Container(
                            width: 100.0,
                            height: 150.0,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  135, 30, 135, 0),
                              child: RawMaterialButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(20))),
                                fillColor:
                                getcolor(int.parse(TempFloorData)),
                                child: Text(
                                  'F $TempFloorNo',
                                  style: GoogleFonts.francoisOne(
                                      fontSize: 30, color: Colors.white),
                                ),
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, '/dustbin');
                                },
                              ),
                            ),
                          );
                          FloorList.add(floorbutton);
                        }
                        return Screen(FloorList, 'F L O O R S');
                      });
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

  Expanded Screen(List<Container> area, String Title) {
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
