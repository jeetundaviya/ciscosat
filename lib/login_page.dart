import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class login extends StatefulWidget {
  login({Key key}) : super(key: key);

  @override
  _loginState createState() => _loginState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
bool _autoValidate = false;

class _loginState extends State<login> {
  String _email, _password;
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey,
        title: Text('L  O  G  I  N',
            style: GoogleFonts.francoisOne(
              fontSize: 40,
            )),
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Image.asset(
              'images/logo_with_name.png',
              height: 200,
            ),
          ),
          Flexible(
            child: Form(
              key: _formKey,
              autovalidate: _autoValidate,
              child: Card(
                child: ListView(
                  children: [
                    Column(
                      children: <Widget>[
                        TextFormField(
//                          validator: validateEmail,
//                          onSaved: (String val) {
//                            _email = val;
//                          },
                          decoration: new InputDecoration(
                            enabledBorder: new OutlineInputBorder(
                              borderSide: new BorderSide(
                                  color: Colors.grey[600], width: 6),
                            ),
                            hintText: 'ID no.',
                            // helperText: 'Keep it short, this is just a demo.',
                            labelText: 'I D',

                            prefixIcon: const Icon(
                              Icons.person,
                              color: Colors.grey,
                              size: 120,
                            ),
                            prefixText: ' ',
                            //suffixText: 'USD',
                            //suffixStyle: const TextStyle(color: Colors.green)
                          ),
                          onChanged: (value) {
                            _email = value;
                            print(_email);
                          },
                          autovalidate: true,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          autovalidate: true,
//                          validator: validatePassword,
//                          onSaved: (String val) {
//                            _password = val;
//                          },
                          decoration: new InputDecoration(
                            enabledBorder: new OutlineInputBorder(
                              borderSide: new BorderSide(
                                  color: Colors.grey[600], width: 6),
                            ),
                            // helperText: 'Keep it short, this is just a demo.',
                            labelText: 'Password',
                            prefixIcon: const Icon(
                              Icons.vpn_key,
                              color: Colors.grey,
                              size: 120,
                            ),
                            prefixText: ' ',
                            //suffixText: 'USD',
                            //suffixStyle: const TextStyle(color: Colors.green)
                          ),
                          obscureText: true,
                          onChanged: (value) {
                            _password = value;
                            print(_password);
                          },
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        FlatButton(
                            child: Image.asset(
                              'images/login.png',
                              height: 150,
                            ),
                            onPressed: () async {
                              try {
                                var check_user =
                                    await _auth.signInWithEmailAndPassword(
                                        email: _email, password: _password);
                                user = check_user.user;
                                if (user.uid ==
                                    'yJPXcwEoQ2WETO6nwW0yziR33Bk1') //admin
                                  Navigator.pushNamed(context, '/MainMenu');
                                if (user.uid !=
                                    'yJPXcwEoQ2WETO6nwW0yziR33Bk1') //non-admin
                                  Navigator.pushNamed(context, '/userMenu');
                              } catch (e) {
                                print(e);
                                return showDialog<Null>(
                                  context: context,
                                  builder: (ctx) => AlertDialog(
                                    title: Text('An Error occurred!'),
                                    content:
                                        Text('Invalid Email ID or Passward'),
                                    actions: <Widget>[
                                      FlatButton(
                                          child: Text('ok'),
                                          onPressed: () async =>
                                              Navigator.of(context).pop())
                                    ],
                                  ),
                                );
                              }
                            }),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//String validatePassword(String value) {
//// Indian Mobile number are of 10 digit only
//  if (value.length < 6)
//    return 'Password should at least be of 6 digit';
//  else
//    return null;
//}
//
//String validateEmail(String value) {
//  Pattern pattern =
//      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
//  RegExp regex = new RegExp(pattern);
//  if (!regex.hasMatch(value))
//    return 'Enter Valid Email';
//  else
//    return null;
//}
