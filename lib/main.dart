import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'camera/camera_simple.dart';
import 'connect/connect_simple.dart';
import 'fresh/fresh_simple.dart';
import 'global/common.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'LTL'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void _incrementCounter() {
    Share.share('check out my website https://example.com');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
                width: double.maxFinite,
                child: RaisedButton(onPressed:(){
                  goTo(context, ConnectSimple());
                },child: Text('网络状态'),)
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
