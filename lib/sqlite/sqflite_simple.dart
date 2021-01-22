import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class SqfliteSimple extends StatefulWidget {
  @override
  _SqfliteSimple createState() => _SqfliteSimple();

}

class _SqfliteSimple extends State<SqfliteSimple> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SQLite'),
      ),
      body: Center(child: Column(children: <Widget>[
        Text('SQLite框架：sqflite'),
      ],)),
    );
  }

}
