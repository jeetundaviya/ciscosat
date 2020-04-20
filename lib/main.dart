import 'package:ciscosat/modify_floor.dart';
import 'package:ciscosat/reports.dart';
import 'package:flutter/material.dart';
import 'modify_dustbin.dart';
import 'start_page.dart';
import 'login_page.dart';
import 'areas_page.dart';
import 'floor_page.dart';
import 'dustbin_page.dart';

import 'remarks.dart';
import 'support.dart';
import 'MainMenu.dart';
import 'start.dart';
import 'modify_arrea.dart';
import 'UpdatedArea.dart';
import 'package:ciscosat/ModifyMenu.dart';
import 'LiveUpdatesMenu.dart';
import 'UpdatedFloor.dart';
import 'UpdatedArea.dart';
import 'UpdatedDustbin.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
//          '/':(context)=>SplashScreen(),
        '/': (context) => remarks(),
        '/menu': (context) => menu(),
        '/login': (context) => login(),
        '/remarks': (context) => remarks(),
        '/support': (context) => support(),
        '/area': (context) => areas(),
        '/floor': (context) => floors(),
        '/modifymenu': (context) => modify(),
        '/marea': (context) => modifyArea(),
        '/mfloor': (context) => modifyFloor(),
        '/mdustbin': (context) => modifyDustbin(),
        '/dustbin': (context) => dustbins(),
        '/AfterLogin': (context) => AfterMenu(),
        '/UpdatedArea': (context) => updatedarea(),
        '/UpdatedFloor': (context) => updatedfloor(),
        '/UpdatedDustbin': (context) => updateddustbin(),
      },
    );
  }
}
