import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';

class Complains extends StatefulWidget {
  @override
  _ComplainsState createState() => _ComplainsState();
}

class _ComplainsState extends State<Complains> {
  String deleteID;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey,
        title: Text('C O M P L A I N S',
            style: GoogleFonts.francoisOne(
              fontSize: 40,
            )),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            StreamBuilder<QuerySnapshot>(
                stream: Firestore.instance.collection('COMPLAINS').snapshots(),
                builder: (context, remarks) {
                  if (!remarks.hasData) {
                    return Center(
                        child: CircularProgressIndicator());
                  }

                  List<Column> RemarksList = [];


                  for (var user in remarks.data.documents) {
                    print(user.documentID);
                    String Tempcomplain = user.data['Complain'].toString();
//                    String TempRemark2 = user.data['Remark2'].toString();
//                    String TempRemark3 = user.data['Remark3'].toString();
                    String User = user.data['user'].toString();
//                    String TempField2 = user.data['Field2'].toString();
//                    String TempField3 = user.data['Field3'].toString();

                    Column complainer = Column(
                      children: <Widget>[SizedBox(height: 30,),
                        Container(
                          height: 40,
                          width: 300,
                          //color: Colors.cyan,
                          child: Center(child: Text('ID  :  ' + user.documentID,
                            style: GoogleFonts.francoisOne(
                                fontSize: 30, color: Colors.white),)),
                          decoration: BoxDecoration(
                            color: Colors.grey[600],
                            borderRadius: new BorderRadius.only(
                                topLeft: const Radius.circular(15.0),
                                topRight: const Radius.circular(15.0)),
                          ),
                        ),
                        //SizedBox(height: 20,),
                      ],);
                    Column Complains = Column(children: <Widget>[
                      Container(
                        height: 100,
                        width: 300,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(30, 5, 0, 0),
                          child: Text(User + '  :  ' + Tempcomplain,
                            style: GoogleFonts.titilliumWeb(
                                color: Colors.white, fontSize: 20),),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey[800],
                          borderRadius: new BorderRadius.only(
                              bottomLeft: const Radius.circular(15.0),
                              bottomRight: const Radius.circular(15.0)),
                        ),
//
                      ),
                      //SizedBox(height: 10,)
                    ],);
//                    Column fieldbutton2 = Column(children: <Widget>[
//                      Container(
//                        height: 40,
//                        width: 300,
//                        child: Padding(
//                          padding: const EdgeInsets.fromLTRB(30,5,0, 0),
//                          child: Text(TempField2+'        :  '+TempRemark2,style: GoogleFonts.titilliumWeb(color: Colors.white,fontSize: 20),),
//                        ),
//                        decoration: BoxDecoration(
//                          color: Colors.grey[800],
////                                  borderRadius: new BorderRadius.only(
////                                      topLeft:  const  Radius.circular(15.0),
////                                      topRight: const  Radius.circular(15.0)),
//                        ),
//
//                      ),],);
//                    Column fieldbutton3 = Column(children: <Widget>[
//                      Container(
//                        height: 40,
//                        width: 300,
//                        child: Padding(
//                          padding: const EdgeInsets.fromLTRB(30,5,0, 0),
//                          child: Text(TempField3+'  :  '+TempRemark3,style: GoogleFonts.titilliumWeb(color: Colors.white,fontSize: 20),),
//                        ),
//                        decoration: BoxDecoration(
//                          color: Colors.grey[800],
//                          borderRadius: new BorderRadius.only(
//                              bottomLeft:  const  Radius.circular(15.0),
//                              bottomRight: const  Radius.circular(15.0)),
//                        ),
//                      ),],);
//                                Text remarkbutton1 = Text(TempRemark1);
//                                Text remarkbutton2 = Text(TempRemark2);
//                                Text remarkbutton3 = Text(TempRemark3);
//                                Text fieldbutton1 = Text(TempField1+':'+TempRemark1);
//                                Text fieldbutton2 = Text(TempField2+':'+TempRemark2);
//                                Text fieldbutton3 = Text(TempField3+':'+TempRemark3);

                    RemarksList.add(complainer);
                    RemarksList.add(Complains);
//                                RemarksList.add(remarkbutton1);
                    //                   RemarksList.add(fieldbutton2);
//                                RemarksList.add(remarkbutton2);
                    //                 RemarksList.add(fieldbutton3);
//                                RemarksList.add(remarkbutton3);
                  }

                  return Screen(RemarksList);

                  // return Screen(AreaList,'A R E A S');

                }),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                Container(

                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(30.0),
                        topRight: const Radius.circular(30.0),
                        bottomLeft: const Radius.circular(30.0),
                        bottomRight: const Radius.circular(30.0)),

                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 0),
                      ),
                      hintText: 'Delete Id',
                      // helperText: 'Keep it short, this is just a demo.',
                      labelText: 'Delete Complain',

                      prefixIcon: Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 50,
                      ),
                      //prefixText: ' ',
                      //suffixText: 'USD',
                      //suffixStyle: const TextStyle(color: Colors.green)
                    ),
                    onChanged: (value) {
                      deleteID = value;
                      print(deleteID);
                    },
                    //autovalidate: true,
                  ),
                ),
                SizedBox(height: 5,),
                Container(
                  height: 70,
                  width: 70,
                  child: FittedBox(
                    child: FloatingActionButton(
                      // heroTag: null,
                      backgroundColor: Colors.grey[800],
                      onPressed: () async {
                        //print('$_areano::$_areavalue');
                        await Firestore.instance
                            .collection('COMPLAINS')
                            .document('$deleteID')
                            .delete().catchError((e) {
                          print(e);
                        });
                      },
                      child: Icon(Icons.indeterminate_check_box),
//                      label: Text(
//                        ' D E L E T E ',
//                        style: GoogleFonts.francoisOne(fontSize: 20),
//                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }

  Expanded Screen(List<Column> remark,) {
    return Expanded(
      child: Scaffold(
        backgroundColor: Colors.white,

        body: ListView(children: remark),


      ),
    );
  }
}
