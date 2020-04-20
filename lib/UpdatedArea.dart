import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class updatedarea extends StatefulWidget {
  @override
  _updatedareaState createState() => _updatedareaState();
}

class _updatedareaState extends State<updatedarea> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            StreamBuilder<QuerySnapshot>(
                stream: Firestore.instance.collection('AREAS').snapshots(),
                builder: (context, area) {

                        return StreamBuilder<QuerySnapshot>(
                            stream: Firestore.instance
                                .collection('DUSTBINS')
                                .snapshots(),
                            builder: (context, dustbin) {

                              if (!area.hasData) {
                                return Center(
                                    child: CircularProgressIndicator());
                              }
                              if (!dustbin.hasData) {
                                return Center(
                                    child: CircularProgressIndicator());
                              }

                              List<Column> AreaList = [];
                              String TempDustbinData, TempDustbinID;


                              for (var dustbin in dustbin.data.documents) {

                                TempDustbinID = dustbin.data['DNO'];
                                TempDustbinData = dustbin.data['DVALUE'];
                                print("$TempDustbinID :: $TempDustbinData");


                              }



                              Color colour = Colors.redAccent;
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
                                              context, '/marea');
                                        },
                                      ),
                                    ),
                                  ),
                                  //Column(children: Alert),
                                ],);

                                AreaList.add(areabutton);
                              }

                              return Screen(AreaList, 'A R E A S');
                            });
                }),
            StreamBuilder<QuerySnapshot>(
                stream: Firestore.instance.collection('DUSTBINS').snapshots(),
                builder: (context, dustbinlive) {
                  List <Column>alert = [];
                  for (var temp in dustbinlive.data.documents) {
                    String TempDustbinValue = temp.data['DVALUE'];
                    String TempDustbinID = temp.data['DNO'];
                    if (int.parse(TempDustbinValue) >= 90) {
                      alert.add(Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[

                          Container(
                            child: Center(child: Padding(
                              padding: const EdgeInsets.fromLTRB(87, 0, 0, 0),
                              child: Text(
                                'D$TempDustbinID :: $TempDustbinValue', style:
                              GoogleFonts.titilliumWeb(
                                  fontSize: 20, color: Colors.redAccent),),
                            )),
                            decoration: BoxDecoration(
                              borderRadius: new BorderRadius.only(
                                  bottomLeft: const Radius.circular(20.0),
                                  bottomRight: const Radius.circular(20.0)),
                            ),),

                        ],
                      ));
                    }
                  }
                  return Container(child: Column(
                    children: <Widget>[
                      Container(width: 500,
                        child: Center(
                          child: Text('ALERT !',
                            style: GoogleFonts.titilliumWeb(
                                fontSize: 20, color: Colors.white),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.blueGrey[700],
                          borderRadius: new BorderRadius.only(
                              topLeft: const Radius.circular(20.0),
                              topRight: const Radius.circular(20.0)),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(width: 20,),
                          FloatingActionButton(
                            heroTag: null,
                            child: Icon(Icons.delete),
                            backgroundColor: Colors.greenAccent[700],
                            onPressed: () {
                              //Navigator.pop(context);
                              Navigator.pushNamed(context, '/mdustbin');
                            },
                          ),
                          Column(children: alert),
                          SizedBox(width: 90,),
                          FloatingActionButton(
                            heroTag: null,
                            child: Icon(Icons.close),
                            backgroundColor: Colors.yellowAccent[700],
                            onPressed: () {
                              // Navigator.pop(context);
                              Navigator.pushNamed(context, '/area');
                            },
                          ),
                        ],
                      ),
                    ],
                  ));
                }
            )
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