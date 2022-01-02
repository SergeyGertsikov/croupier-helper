import 'package:flutter/material.dart';
import 'package:pockergui1/src/view/app.dart';
import 'package:pockergui1/src/view/home.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => MainScreen(),
        '/todo': (context) => MatchScreen(),
      },
    ));
