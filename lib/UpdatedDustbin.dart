import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class updateddustbin extends StatefulWidget {
  @override
  _updateddustbinState createState() => _updateddustbinState();
}

class _updateddustbinState extends State<updateddustbin> {
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
                              if (!area.hasData) {
                                return Center(
                                    child: CircularProgressIndicator());
                              }
                              if (!dustbin.hasData) {
                                return Center(
                                    child: CircularProgressIndicator());
                              }
                              List<Column> DustbinList = [];
                              List<Container> FloorList = [];
                              List<Container> AreaList = [];
                              String TempDustbinData,
                                  TempDustbinID,
                                  TempDustbinArea,
                                  TempDustbinfloor,
                                  TempDustbinColor = "blue";
                              int favg = 0;
                              for (var dustbin in dustbin.data.documents) {
                                TempDustbinArea = dustbin.data['AREA'];
                                TempDustbinfloor = dustbin.data['FLOOR'];
                                TempDustbinID = dustbin.data['DNO'];
                                TempDustbinData = dustbin.data['DVALUE'];
                                print("$TempDustbinID :: $TempDustbinData");

//                                if(int.parse(TempDustbinID) <= 2){
//                                  Firestore.instance.collection('DUSTBINS').document('1').updateData({
//                                    'FLOOR':'1',
//                                    'AREA':'1',
//                                  }).catchError((e){print(e);});
//                                }
//
//                                if(int.parse(TempDustbinID) <= 4 && int.parse(TempDustbinID) >= 3){
//                                  Firestore.instance.collection('DUSTBINS').document('1').updateData({
//                                    'FLOOR':'2',
//                                    'AREA':'1',
//                                  }).catchError((e){print(e);});
//                                }
//
//                                if(int.parse(TempDustbinID) <= 6 && int.parse(TempDustbinID) >= 5){
//                                  Firestore.instance.collection('DUSTBINS').document('1').updateData({
//                                    'FLOOR':'3',
//                                    'AREA':'1',
//                                  }).catchError((e){print(e);});
//                                }

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

//                      int floorsum=0,flooravg=0,i=0,area1avg=0;
////                      String TempFloorNo;
                              for (var user in floor.data.documents) {
                                String TempFloorNo = user.data['FNO'];
                                String TempFloorData =
                                    user.data['FVALUE'].toString();

                                Container floorbutton = Container(
                                  width: 200.0,
                                  height: 200.0,
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: RawMaterialButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20))),
                                      fillColor:
                                          getcolor(int.parse(TempDustbinData)),
                                      child: Text(
                                        'F $TempFloorNo',
                                        style: GoogleFonts.francoisOne(
                                            fontSize: 30, color: Colors.white),
                                      ),
                                      onPressed: () {
                                        Navigator.pushNamed(context, '/floor');
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

                              Color colour = Colors.redAccent;
                              for (var user in area.data.documents) {
                                String AreaTempValue =
                                    user.data['AVALUE'].toString();
                                String AreaTempNo = user.data['ANO'].toString();
                                // int check_color=int.parse(floordata);

                                Container areabutton = Container(
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
                                            fontSize: 30, color: Colors.white),
                                      ),
                                      onPressed: () {
                                        Navigator.pushNamed(context, '/floor');
                                      },
                                    ),
                                  ),
                                );

                                AreaList.add(areabutton);
                              }
                              if (int.parse(TempDustbinData) >= 90) {
                                String TempDustbinColor = "blue";
                                if (int.parse(TempDustbinID) % 2 == 0) {
                                  TempDustbinColor = 'green';
                                }
                                return AlertScreen(
                                    TempDustbinArea,
                                    context,
                                    TempDustbinfloor,
                                    TempDustbinColor,
                                    TempDustbinData,
                                    DustbinList);
                              } else {
                                return Screen(DustbinList, 'D U S T B I N S');
                              }
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
                  Navigator.pushNamed(context, '/dustbin');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
