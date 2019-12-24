import 'package:flutter/material.dart';

//详细视图的Widget,简单的显示一个文本
class DetailWidget extends StatelessWidget {
  final int data;

  DetailWidget(this.data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: new Center(
          child: new Text("详细视图:$data"),
        ),
      ),
    );
  }
}