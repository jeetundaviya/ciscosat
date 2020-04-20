import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'UpdatedDustbin.dart';

class dustbins extends StatefulWidget {
  @override
  _dustbinsState createState() => _dustbinsState();
}

class _dustbinsState extends State<dustbins> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          children: <Widget>[
            StreamBuilder<QuerySnapshot>(
                stream: Firestore.instance.collection('AREAS').snapshots(),
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
                              if (!dustbin.hasData) {
                                return Center(
                                    child: CircularProgressIndicator());
                              }
                              List<Column> DustbinList = [];

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
                                if (Firestore.instance.collection('DUSTBINS') ==
                                    1) {
                                  // int uv=int.parse(TempDustbinData);
//                                  Firestore.instance.collection('FLOORS').document('1').updateData({
//                                    'FVALUE':'$uv',
//                                  }).catchError((e){print(e);});
                                  print('111111111');
                                }
                                if (int.parse(TempDustbinID) % 2 == 0) {
                                  TempDustbinColor = 'green';
                                }
                                Column dustbinbutton = Column(
                                  children: <Widget>[
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Container(
                                      width: 250.0,
                                      height: 250.0,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                        image: AssetImage('images/' +
                                            '$TempDustbinColor' +
                                            '_dustbin.png'),
                                      )),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Center(
                                            child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 80, 0, 0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Text(
                                                'D $TempDustbinID',
                                                style: GoogleFonts.francoisOne(
                                                    fontSize: 50,
                                                    color: Colors.white),
                                              ),
                                              Text(
                                                '$TempDustbinData %',
                                                style: GoogleFonts.francoisOne(
                                                    fontSize: 30,
                                                    color: getcolor(int.parse(
                                                        TempDustbinData))),
                                              ),
                                            ],
                                          ),
                                        )),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                  ],
                                );

                                DustbinList.add(dustbinbutton);
                                TempDustbinColor = "blue";
                              }

                              if (int.parse(TempDustbinData) <= 90) {
                                String TempDustbinColor = "blue";
                                if (int.parse(TempDustbinID) % 2 == 0) {
                                  TempDustbinColor = 'green';
                                }
                                Navigator.pop(context);
                                return updateddustbin();
                                // return AlertScreen(TempDustbinArea, context, TempDustbinfloor, TempDustbinColor, TempDustbinData);
                              } else {
                                return Screen(DustbinList, 'D U S T B I N S');
                              }
                              //  return Screen(DustbinList,'D U S T B I N S');
                            });
                      });
                })
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

  Expanded AlertScreen(
      String TempDustbinArea,
      BuildContext context,
      String TempDustbinfloor,
      String TempDustbinColor,
      String TempDustbinData,
      List DustbinList) {
    return Expanded(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.grey,
          title: Text('A L E R T !',
              style: GoogleFonts.francoisOne(
                fontSize: 40,
              )),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Container(
                    width: 160.0,
                    height: 160.0,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: RawMaterialButton(
                        shape: CircleBorder(),
                        fillColor: Colors.black54,
                        child: Text(
                          'A $TempDustbinArea',
                          style: GoogleFonts.francoisOne(
                              fontSize: 30, color: Colors.white),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/area');
                        },
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: 100.0,
                    height: 150.0,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(27, 7, 27, 7),
                      child: RawMaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0))),
                        fillColor: Colors.black54,
                        child: Text(
                          'F $TempDustbinfloor',
                          style: GoogleFonts.francoisOne(
                              fontSize: 30, color: Colors.white),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/floor');
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              width: 250.0,
              height: 250.0,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage(
                    'images/' + '$TempDustbinColor' + '_dustbin.png'),
              )),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 80, 0, 0),
                  child: Text(
                    '$TempDustbinData %',
                    style: GoogleFonts.francoisOne(
                        fontSize: 50, color: Colors.redAccent),
                  ),
                )),
              ),
            ),
            SizedBox(
              height: 70,
            ),
            Container(
              width: 100.0,
              height: 100.0,
              child: RawMaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(40.0))),
                fillColor: Colors.black54,
                child: Text(
                  'O K',
                  style: GoogleFonts.francoisOne(
                      fontSize: 30, color: Colors.white),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/area');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
