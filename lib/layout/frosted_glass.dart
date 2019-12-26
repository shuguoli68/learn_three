import 'dart:ui';

import 'package:flutter/material.dart';

class FrostedGlass extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _FrostedGlass();
}

class _FrostedGlass extends State<FrostedGlass>{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Stack(
        children: <Widget>[
          new ConstrainedBox(
              constraints: const BoxConstraints.expand(),
              child: new FlutterLogo()),
          new Center(
            child: new ClipRect(
              child: new BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Opacity(
                  opacity: 0.5,
                  child: new Container(
                    width: 200.0,
                    height: 200.0,
                    decoration: new BoxDecoration(
//                  color: Colors.grey.shade200.withOpacity(0.5),
                      color: Colors.grey.shade200,
                    ),
                    child: new Center(
                      child: new Text('Frosted',
                          style: Theme.of(context).textTheme.display3),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}