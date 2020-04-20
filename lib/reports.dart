import 'package:ciscosat/remarks.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';

class Reports extends StatefulWidget {
  @override
  _ReportsState createState() => _ReportsState();
}

class _ReportsState extends State<Reports> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          children: <Widget>[
            StreamBuilder<QuerySnapshot>(
                stream: Firestore.instance.collection('REMARKS').snapshots(),
                builder: (context, area) {
                  return StreamBuilder<QuerySnapshot>(
                      stream:
                          Firestore.instance.collection('FLOORS').snapshots(),
                      builder: (context, floor) {
                        return StreamBuilder<QuerySnapshot>(
                            stream: Firestore.instance
                                .collection('DUSTBINS')
                                .snapshots(),
                            builder: (context, dustbin) {
                              if (!area.hasData) {
                                return Center(
                                    child: CircularProgressIndicator());
                              }

                              List<Text> AreaList = [];

                              String TempDustbinData,
                                  TempDustbinID,
                                  TempDustbinArea,
                                  TempDustbinfloor,
                                  TempDustbinColor = "blue";

                              for (var dustbin in dustbin.data.documents) {
                                TempDustbinArea = dustbin.data['area'];
                                TempDustbinfloor = dustbin.data['floor'];
                                TempDustbinID = dustbin.data['DNO'];
                                TempDustbinData = dustbin.data['DVALUE'];
                                print("$TempDustbinID :: $TempDustbinData");
                              }

                              for (var user in area.data.documents) {
                                String AreaTempValue =
                                    user.data['Remark'].toString();
                                // String AreaTempNo = user.data['ANO'].toString();
                                // int check_color=int.parse(floordata);

                                Text areabutton = Text(AreaTempValue);

                                AreaList.add(areabutton);
                              }

                              return Screen(AreaList, 'R E P O R T S');

                              // return Screen(AreaList,'A R E A S');
                            });
                      });
                })
          ],
        ),
      ),
    );
  }

  Expanded Screen(List<Text> area, String Title) {
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
        body: Column(
          children: area,
        ),
      ),
    );
  }
}
