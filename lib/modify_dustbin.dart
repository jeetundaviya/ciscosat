import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';

class modifyDustbin extends StatefulWidget {
  @override
  _modifyDustbinState createState() => _modifyDustbinState();
}

String _dustbinno, _dustbinvalue;

class _modifyDustbinState extends State<modifyDustbin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey,
        title: Text(
          'M . D U S T B I N',
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
                  hintText: 'Dustbin no.',
                  // helperText: 'Keep it short, this is just a demo.',
                  labelText: 'Dustbin no.',

                  prefixIcon: Icon(
                    Icons.delete,
                    color: Colors.grey[800],
                    size: 120,
                  ),
                  //prefixText: ' ',
                  //suffixText: 'USD',
                  //suffixStyle: const TextStyle(color: Colors.green)
                ),
                onChanged: (value) {
                  _dustbinno = value;
                  print(_dustbinno);
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
                  hintText: 'Dustbin percentage',
                  // helperText: 'Keep it short, this is just a demo.',
                  labelText: 'Dustbin percentage',

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
                  _dustbinvalue = value;
                  print(_dustbinvalue);
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
                  print('$_dustbinno::$_dustbinvalue');
                  String TempDustbinID = _dustbinno;
                  await Firestore.instance
                      .collection('DUSTBINS')
                      .document('$_dustbinno')
                      .setData({
                    'DNO': '$_dustbinno',
                    'DVALUE': '$_dustbinvalue'
                  }).catchError((e) {
                    print(e);
                  });

                  if (int.parse(_dustbinno) % 2 == 0) {
                    var document1 = await Firestore.instance
                        .collection('DUSTBINS')
                        .document('${int.parse(_dustbinno) - 1}')
                        .get();
                    var document2 = await Firestore.instance
                        .collection('DUSTBINS')
                        .document('$_dustbinno')
                        .get();

                    print('trying to store in floor value');
                    print(document1.data['DVALUE']);
                    print(document2.data['DVALUE']);
                    int floorvalue = int.parse(document1.data['DVALUE']) +
                        int.parse(document2.data['DVALUE']);

                    await Firestore.instance
                        .collection('FLOORS')
                        .document('${(int.parse(_dustbinno) / 2).toInt()}')
                        .setData({
                      'FNO': '${(int.parse(_dustbinno) / 2).toInt()}',
                      'FVALUE': '${(floorvalue / 2).toInt()}',
                    }).catchError((e) {
                      print(e);
                    });
                    if (int.parse(_dustbinno) <= 6) {
                      int areano = 1;
                      var document1 = await Firestore.instance
                          .collection('DUSTBINS')
                          .document('1')
                          .get();
                      var document2 = await Firestore.instance
                          .collection('DUSTBINS')
                          .document('2')
                          .get();
                      var document3 = await Firestore.instance
                          .collection('DUSTBINS')
                          .document('3')
                          .get();
                      var document4 = await Firestore.instance
                          .collection('DUSTBINS')
                          .document('4')
                          .get();
                      var document5 = await Firestore.instance
                          .collection('DUSTBINS')
                          .document('5')
                          .get();
                      var document6 = await Firestore.instance
                          .collection('DUSTBINS')
                          .document('6')
                          .get();

                      int areavalue = int.parse(document1.data['DVALUE']) +
                          int.parse(document2.data['DVALUE']) +
                          int.parse(document3.data['DVALUE']) +
                          int.parse(document4.data['DVALUE']) +
                          int.parse(document5.data['DVALUE']) +
                          int.parse(document6.data['DVALUE']);

                      await Firestore.instance
                          .collection('AREAS')
                          .document('$areano')
                          .setData({
                        'ANO': '$areano',
                        'AVALUE': '${(areavalue / 6).toInt()}',
                      }).catchError((e) {
                        print(e);
                      });
                    }

                    if (int.parse(_dustbinno) <= 12 &&
                        int.parse(_dustbinno) > 6) {
                      int areano = 2;
                      var document1 = await Firestore.instance
                          .collection('DUSTBINS')
                          .document('7')
                          .get();
                      var document2 = await Firestore.instance
                          .collection('DUSTBINS')
                          .document('8')
                          .get();
                      var document3 = await Firestore.instance
                          .collection('DUSTBINS')
                          .document('9')
                          .get();
                      var document4 = await Firestore.instance
                          .collection('DUSTBINS')
                          .document('10')
                          .get();
                      var document5 = await Firestore.instance
                          .collection('DUSTBINS')
                          .document('11')
                          .get();
                      var document6 = await Firestore.instance
                          .collection('DUSTBINS')
                          .document('12')
                          .get();

                      int areavalue = int.parse(document1.data['DVALUE']) +
                          int.parse(document2.data['DVALUE']) +
                          int.parse(document3.data['DVALUE']) +
                          int.parse(document4.data['DVALUE']) +
                          int.parse(document5.data['DVALUE']) +
                          int.parse(document6.data['DVALUE']);

                      await Firestore.instance
                          .collection('AREAS')
                          .document('$areano')
                          .setData({
                        'ANO': '$areano',
                        'AVALUE': '${(areavalue / 6).toInt()}',
                      }).catchError((e) {
                        print(e);
                      });
                    }

                    if (int.parse(_dustbinno) <= 18 &&
                        int.parse(_dustbinno) > 12) {
                      int areano = 3;
                      var document1 = await Firestore.instance
                          .collection('DUSTBINS')
                          .document('13')
                          .get();
                      var document2 = await Firestore.instance
                          .collection('DUSTBINS')
                          .document('14')
                          .get();
                      var document3 = await Firestore.instance
                          .collection('DUSTBINS')
                          .document('15')
                          .get();
                      var document4 = await Firestore.instance
                          .collection('DUSTBINS')
                          .document('16')
                          .get();
                      var document5 = await Firestore.instance
                          .collection('DUSTBINS')
                          .document('17')
                          .get();
                      var document6 = await Firestore.instance
                          .collection('DUSTBINS')
                          .document('18')
                          .get();

                      int areavalue = int.parse(document1.data['DVALUE']) +
                          int.parse(document2.data['DVALUE']) +
                          int.parse(document3.data['DVALUE']) +
                          int.parse(document4.data['DVALUE']) +
                          int.parse(document5.data['DVALUE']) +
                          int.parse(document6.data['DVALUE']);

                      await Firestore.instance
                          .collection('AREAS')
                          .document('$areano')
                          .setData({
                        'ANO': '$areano',
                        'AVALUE': '${(areavalue / 6).toInt()}',
                      }).catchError((e) {
                        print(e);
                      });
                    }

                    if (int.parse(_dustbinno) <= 24 &&
                        int.parse(_dustbinno) > 18) {
                      int areano = 4;
                      var document1 = await Firestore.instance
                          .collection('DUSTBINS')
                          .document('19')
                          .get();
                      var document2 = await Firestore.instance
                          .collection('DUSTBINS')
                          .document('20')
                          .get();
                      var document3 = await Firestore.instance
                          .collection('DUSTBINS')
                          .document('21')
                          .get();
                      var document4 = await Firestore.instance
                          .collection('DUSTBINS')
                          .document('22')
                          .get();
                      var document5 = await Firestore.instance
                          .collection('DUSTBINS')
                          .document('23')
                          .get();
                      var document6 = await Firestore.instance
                          .collection('DUSTBINS')
                          .document('24')
                          .get();

                      int areavalue = int.parse(document1.data['DVALUE']) +
                          int.parse(document2.data['DVALUE']) +
                          int.parse(document3.data['DVALUE']) +
                          int.parse(document4.data['DVALUE']) +
                          int.parse(document5.data['DVALUE']) +
                          int.parse(document6.data['DVALUE']);

                      await Firestore.instance
                          .collection('AREAS')
                          .document('$areano')
                          .setData({
                        'ANO': '$areano',
                        'AVALUE': '${(areavalue / 6).toInt()}',
                      }).catchError((e) {
                        print(e);
                      });
                    }

                    if (int.parse(_dustbinno) <= 30 &&
                        int.parse(_dustbinno) > 24) {
                      int areano = 5;
                      var document1 = await Firestore.instance
                          .collection('DUSTBINS')
                          .document('25')
                          .get();
                      var document2 = await Firestore.instance
                          .collection('DUSTBINS')
                          .document('26')
                          .get();
                      var document3 = await Firestore.instance
                          .collection('DUSTBINS')
                          .document('27')
                          .get();
                      var document4 = await Firestore.instance
                          .collection('DUSTBINS')
                          .document('28')
                          .get();
                      var document5 = await Firestore.instance
                          .collection('DUSTBINS')
                          .document('29')
                          .get();
                      var document6 = await Firestore.instance
                          .collection('DUSTBINS')
                          .document('30')
                          .get();

                      int areavalue = int.parse(document1.data['DVALUE']) +
                          int.parse(document2.data['DVALUE']) +
                          int.parse(document3.data['DVALUE']) +
                          int.parse(document4.data['DVALUE']) +
                          int.parse(document5.data['DVALUE']) +
                          int.parse(document6.data['DVALUE']);

                      await Firestore.instance
                          .collection('AREAS')
                          .document('$areano')
                          .setData({
                        'ANO': '$areano',
                        'AVALUE': '${(areavalue / 6).toInt()}',
                      }).catchError((e) {
                        print(e);
                      });
                    }

                    await Firestore.instance
                        .collection('DUSTBINS')
                        .document('$TempDustbinID')
                        .setData({
                      'DNO': '$_dustbinno',
                      'DVALUE': '$_dustbinvalue',
                      'FLOOR': '${int.parse(_dustbinno) / 2}',
                      if (int.parse(_dustbinno) <= 6) 'AREA': '1',
                      if (int.parse(_dustbinno) <= 12 &&
                          int.parse(_dustbinno) > 6)
                        'AREA': '2',
                      if (int.parse(_dustbinno) <= 18 &&
                          int.parse(_dustbinno) > 12)
                        'AREA': '3',
                      if (int.parse(_dustbinno) <= 24 &&
                          int.parse(_dustbinno) > 18)
                        'AREA': '4',
                      if (int.parse(_dustbinno) <= 30 &&
                          int.parse(_dustbinno) > 24)
                        'AREA': '5',
                    }).catchError((e) {
                      print(e);
                    });
                  } else {
                    var document1 = await Firestore.instance
                        .collection('DUSTBINS')
                        .document('${int.parse(_dustbinno) + 1}')
                        .get();
                    var document2 = await Firestore.instance
                        .collection('DUSTBINS')
                        .document('$_dustbinno')
                        .get();
                    print('trying to store in floor value');
                    print(document1.data['DVALUE']);
                    print(document2.data['DVALUE']);
                    int floorvalue = int.parse(document1.data['DVALUE']) +
                        int.parse(document2.data['DVALUE']);
                    await Firestore.instance
                        .collection('FLOORS')
                        .document(
                            '${((int.parse(_dustbinno) + 1) / 2).toInt()}')
                        .setData({
                      'FNO': '${((int.parse(_dustbinno) + 1) / 2).toInt()}',
                      'FVALUE': '${(floorvalue / 2).toInt()}',
                    }).catchError((e) {
                      print(e);
                    });

                    if (int.parse(_dustbinno) <= 6) {
                      int areano = 1;
                      var document1 = await Firestore.instance
                          .collection('DUSTBINS')
                          .document('1')
                          .get();
                      var document2 = await Firestore.instance
                          .collection('DUSTBINS')
                          .document('2')
                          .get();
                      var document3 = await Firestore.instance
                          .collection('DUSTBINS')
                          .document('3')
                          .get();
                      var document4 = await Firestore.instance
                          .collection('DUSTBINS')
                          .document('4')
                          .get();
                      var document5 = await Firestore.instance
                          .collection('DUSTBINS')
                          .document('5')
                          .get();
                      var document6 = await Firestore.instance
                          .collection('DUSTBINS')
                          .document('6')
                          .get();

                      int areavalue = int.parse(document1.data['DVALUE']) +
                          int.parse(document2.data['DVALUE']) +
                          int.parse(document3.data['DVALUE']) +
                          int.parse(document4.data['DVALUE']) +
                          int.parse(document5.data['DVALUE']) +
                          int.parse(document6.data['DVALUE']);

                      await Firestore.instance
                          .collection('AREAS')
                          .document('$areano')
                          .setData({
                        'ANO': '$areano',
                        'AVALUE': '${(areavalue / 6).toInt()}',
                      }).catchError((e) {
                        print(e);
                      });
                    }

                    if (int.parse(_dustbinno) <= 12 &&
                        int.parse(_dustbinno) > 6) {
                      int areano = 2;
                      var document1 = await Firestore.instance
                          .collection('DUSTBINS')
                          .document('7')
                          .get();
                      var document2 = await Firestore.instance
                          .collection('DUSTBINS')
                          .document('8')
                          .get();
                      var document3 = await Firestore.instance
                          .collection('DUSTBINS')
                          .document('9')
                          .get();
                      var document4 = await Firestore.instance
                          .collection('DUSTBINS')
                          .document('10')
                          .get();
                      var document5 = await Firestore.instance
                          .collection('DUSTBINS')
                          .document('11')
                          .get();
                      var document6 = await Firestore.instance
                          .collection('DUSTBINS')
                          .document('12')
                          .get();

                      int areavalue = int.parse(document1.data['DVALUE']) +
                          int.parse(document2.data['DVALUE']) +
                          int.parse(document3.data['DVALUE']) +
                          int.parse(document4.data['DVALUE']) +
                          int.parse(document5.data['DVALUE']) +
                          int.parse(document6.data['DVALUE']);

                      await Firestore.instance
                          .collection('AREAS')
                          .document('$areano')
                          .setData({
                        'ANO': '$areano',
                        'AVALUE': '${(areavalue / 6).toInt()}',
                      }).catchError((e) {
                        print(e);
                      });
                    }

                    if (int.parse(_dustbinno) <= 18 &&
                        int.parse(_dustbinno) > 12) {
                      int areano = 3;
                      var document1 = await Firestore.instance
                          .collection('DUSTBINS')
                          .document('13')
                          .get();
                      var document2 = await Firestore.instance
                          .collection('DUSTBINS')
                          .document('14')
                          .get();
                      var document3 = await Firestore.instance
                          .collection('DUSTBINS')
                          .document('15')
                          .get();
                      var document4 = await Firestore.instance
                          .collection('DUSTBINS')
                          .document('16')
                          .get();
                      var document5 = await Firestore.instance
                          .collection('DUSTBINS')
                          .document('17')
                          .get();
                      var document6 = await Firestore.instance
                          .collection('DUSTBINS')
                          .document('18')
                          .get();

                      int areavalue = int.parse(document1.data['DVALUE']) +
                          int.parse(document2.data['DVALUE']) +
                          int.parse(document3.data['DVALUE']) +
                          int.parse(document4.data['DVALUE']) +
                          int.parse(document5.data['DVALUE']) +
                          int.parse(document6.data['DVALUE']);

                      await Firestore.instance
                          .collection('AREAS')
                          .document('$areano')
                          .setData({
                        'ANO': '$areano',
                        'AVALUE': '${(areavalue / 6).toInt()}',
                      }).catchError((e) {
                        print(e);
                      });
                    }

                    if (int.parse(_dustbinno) <= 24 &&
                        int.parse(_dustbinno) > 18) {
                      int areano = 4;
                      var document1 = await Firestore.instance
                          .collection('DUSTBINS')
                          .document('19')
                          .get();
                      var document2 = await Firestore.instance
                          .collection('DUSTBINS')
                          .document('20')
                          .get();
                      var document3 = await Firestore.instance
                          .collection('DUSTBINS')
                          .document('21')
                          .get();
                      var document4 = await Firestore.instance
                          .collection('DUSTBINS')
                          .document('22')
                          .get();
                      var document5 = await Firestore.instance
                          .collection('DUSTBINS')
                          .document('23')
                          .get();
                      var document6 = await Firestore.instance
                          .collection('DUSTBINS')
                          .document('24')
                          .get();

                      int areavalue = int.parse(document1.data['DVALUE']) +
                          int.parse(document2.data['DVALUE']) +
                          int.parse(document3.data['DVALUE']) +
                          int.parse(document4.data['DVALUE']) +
                          int.parse(document5.data['DVALUE']) +
                          int.parse(document6.data['DVALUE']);

                      await Firestore.instance
                          .collection('AREAS')
                          .document('$areano')
                          .setData({
                        'ANO': '$areano',
                        'AVALUE': '${(areavalue / 6).toInt()}',
                      }).catchError((e) {
                        print(e);
                      });
                    }

                    if (int.parse(_dustbinno) <= 30 &&
                        int.parse(_dustbinno) > 24) {
                      int areano = 5;
                      var document1 = await Firestore.instance
                          .collection('DUSTBINS')
                          .document('25')
                          .get();
                      var document2 = await Firestore.instance
                          .collection('DUSTBINS')
                          .document('26')
                          .get();
                      var document3 = await Firestore.instance
                          .collection('DUSTBINS')
                          .document('27')
                          .get();
                      var document4 = await Firestore.instance
                          .collection('DUSTBINS')
                          .document('28')
                          .get();
                      var document5 = await Firestore.instance
                          .collection('DUSTBINS')
                          .document('29')
                          .get();
                      var document6 = await Firestore.instance
                          .collection('DUSTBINS')
                          .document('30')
                          .get();

                      int areavalue = int.parse(document1.data['DVALUE']) +
                          int.parse(document2.data['DVALUE']) +
                          int.parse(document3.data['DVALUE']) +
                          int.parse(document4.data['DVALUE']) +
                          int.parse(document5.data['DVALUE']) +
                          int.parse(document6.data['DVALUE']);

                      await Firestore.instance
                          .collection('AREAS')
                          .document('$areano')
                          .setData({
                        'ANO': '$areano',
                        'AVALUE': '${(areavalue / 6).toInt()}',
                      }).catchError((e) {
                        print(e);
                      });
                    }

                    await Firestore.instance
                        .collection('DUSTBINS')
                        .document('$TempDustbinID')
                        .setData({
                      'DNO': '$_dustbinno',
                      'DVALUE': '$_dustbinvalue',
                      'FLOOR': '${((int.parse(_dustbinno) + 1) / 2).toInt()}',
                      if (int.parse(_dustbinno) <= 6) 'AREA': '1',
                      if (int.parse(_dustbinno) <= 12 &&
                          int.parse(_dustbinno) > 6)
                        'AREA': '2',
                      if (int.parse(_dustbinno) <= 18 &&
                          int.parse(_dustbinno) > 12)
                        'AREA': '3',
                      if (int.parse(_dustbinno) <= 24 &&
                          int.parse(_dustbinno) > 18)
                        'AREA': '4',
                      if (int.parse(_dustbinno) <= 30 &&
                          int.parse(_dustbinno) > 24)
                        'AREA': '5',
                    }).catchError((e) {
                      print(e);
                    });
                  }
//                if(int.parse(TempDustbinID) <= 2){
//                  var document1 = await Firestore.instance.collection('DUSTBINS').document('1').get();
//                  var document2 = await Firestore.instance.collection('DUSTBINS').document('2').get();
//                  print('trying to store in floor value');
//                  print(document1.data['DVALUE']);
//                  print(document2.data['DVALUE']);
//                  int floorvalue=int.parse(document1.data['DVALUE'])+int.parse(document2.data['DVALUE']);
//                  await Firestore.instance.collection('FLOORS').document('1').updateData({
//                    'FVALUE':'${floorvalue/2}',
//                  }).catchError((e){print(e);});
//
//                 await Firestore.instance.collection('DUSTBINS').document('$TempDustbinID').updateData({
//                    'FLOOR':'1',
//                    'AREA':'1',
//                  }).catchError((e){print(e);});
//                }
//
//                if(int.parse(TempDustbinID) <= 4 && int.parse(TempDustbinID) >= 3){
//
//                 await Firestore.instance.collection('DUSTBINS').document('$TempDustbinID').updateData({
//                    'FLOOR':'2',
//                    'AREA':'1',
//                  }).catchError((e){print(e);});
//                }
//
//                if(int.parse(TempDustbinID) <= 6 && int.parse(TempDustbinID) >= 5){
//                 await Firestore.instance.collection('DUSTBINS').document('$TempDustbinID').updateData({
//                    'FLOOR':'3',
//                    'AREA':'1',
//                  }).catchError((e){print(e);});
//                }
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
                  //print('$_areano::$_areavalue');
                  await Firestore.instance
                      .collection('DUSTBINS')
                      .document('$_dustbinno')
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
//                await Firestore.instance.collection('AREAS').document('$_areano').updateData({
//                  'ANO':'$_areano',
//                  'AVALUE':'$_areavalue'
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
