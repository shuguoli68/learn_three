import 'package:flutter/material.dart';
import 'package:share/share.dart';

import 'camera/camera_simple.dart';
import 'connect/connect_simple.dart';
import 'fresh/fresh_simple.dart';
import 'global/common.dart';
import 'imgpicker/img_picker.dart';
import 'layout/large_screen.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  void _incrementCounter() {
    Share.share('check out my website https://example.com');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LTL'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.map), onPressed: (){
            goTo(context, LargeScreenPage(title: '大屏幕适配',));
          },),

        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[

            Container(
                margin: EdgeInsets.all(5),
                width: double.maxFinite,
                child: RaisedButton(onPressed:(){
                  goTo(context, FreshSimple());
                },child: Text('刷新加载'),)
            ),

            Container(
                margin: EdgeInsets.all(5),
                width: double.maxFinite,
                child: RaisedButton(onPressed:(){
                  goTo(context, CameraSimple());
                },child: Text('相机'),)
            ),

            Container(
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  border: Border(left: BorderSide(color: Colors.red,width: 3,style: BorderStyle.solid)),
                ),
                width: double.maxFinite,
                child: RaisedButton(onPressed:(){
                  goTo(context, ConnectSimple());
                },child: Text('网络状态'),)
            ),

            Container(
                margin: EdgeInsets.all(5),
                width: double.maxFinite,
                child: RaisedButton(onPressed:(){
                  goTo(context, ImgPicker());
                },child: Text('相机相册'),)
            ),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}