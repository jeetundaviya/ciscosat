import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class dustbins extends StatefulWidget {
  @override
  _dustbinsState createState() => _dustbinsState();
}

class _dustbinsState extends State<dustbins> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[

            StreamBuilder<QuerySnapshot>(
                stream: Firestore.instance
                    .collection('DUSTBINS')
                    .snapshots(),
                builder: (context, dustbin) {
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
                                  padding: const EdgeInsets
                                      .fromLTRB(
                                      0, 80, 0, 0),
                                  child: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        'D $TempDustbinID',
                                        style: GoogleFonts
                                            .francoisOne(
                                            fontSize: 50,
                                            color: Colors.white),
                                      ),
                                      Text(
                                        '$TempDustbinData %',
                                        style: GoogleFonts
                                            .francoisOne(
                                            fontSize: 30,
                                            color: getcolor(
                                                int.parse(
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
                  return Screen(DustbinList, 'D U S T B I N S');
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