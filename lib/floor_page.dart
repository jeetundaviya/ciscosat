import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'UpdatedFloor.dart';

class floors extends StatefulWidget {
  @override
  _floorsState createState() => _floorsState();
}

class _floorsState extends State<floors> {
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
                              if (!floor.hasData) {
                                return Center(
                                    child: CircularProgressIndicator());
                              }
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
                                if (int.parse(TempDustbinID) == 1) {
                                  Firestore.instance
                                      .collection('FLOORS')
                                      .document('1')
                                      .updateData({
                                    'FVALUE': '$TempDustbinData',
                                  }).catchError((e) {
                                    print(e);
                                  });
                                  print('111111111');
                                }
                              }

                              List<Container> FloorList = [];
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
                                            context, '/UpdatedDustbin');
                                      },
                                    ),
                                  ),
                                );
                                FloorList.add(floorbutton);
//                        if(int.parse(TempFloorNo)<=3){
//                          ++i;
//                        print("Floor $TempFloorNo :: $fdata");
//                        floorsum = int.parse(fdata)+floorsum;
//                        flooravg=(floorsum/i).toInt();
//                        print(flooravg);
//                       // getarea('1', flooravg.toString());
//                        }else if(int.parse(TempFloorNo)==4){
//                          i=0;
//                          floorsum=0;
//                          flooravg=0;
//                        }
//
//                        if(int.parse(TempFloorNo)>3&&int.parse(TempFloorNo)<=6){
//                        ++i;
//                        print("Floor $TempFloorNo :: $fdata");
//                        floorsum = int.parse(fdata)+floorsum;
//                        flooravg=(floorsum/i).toInt();
//                        print(flooravg);
//                      }
                              }

                              if (int.parse(TempDustbinData) <= 90) {
                                String TempDustbinColor = "blue";
                                if (int.parse(TempDustbinID) % 2 == 0) {
                                  TempDustbinColor = 'green';
                                }
                                Navigator.pop(context);
                                return updatedfloor();
                                // return AlertScreen(TempDustbinArea, context, TempDustbinfloor, TempDustbinColor, TempDustbinData);
                              } else {
                                return Screen(FloorList, 'F L O O R S');
                              }

                              // return Screen(FloorList,'F L O O R S');
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

  Expanded AlertScreen(
      String TempDustbinArea,
      BuildContext context,
      String TempDustbinfloor,
      String TempDustbinColor,
      String TempDustbinData) {
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
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
