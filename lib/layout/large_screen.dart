import 'package:flutter/material.dart';

import 'detail_widget.dart';
import 'list_widget.dart';
import 'package:learn_three/global/common.dart';

class LargeScreenPage extends StatefulWidget {
  LargeScreenPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LargeScreenState createState() => new _LargeScreenState();
}

class _LargeScreenState extends State<LargeScreenPage> {
  bool isLargeScreen; //是否是大屏幕

  var selectValue = 0; //保存选择的内容

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new OrientationBuilder(builder: (context, orientation) {
        print("width:${MediaQuery.of(context).size.width}");
        //判断屏幕宽度
        if (MediaQuery.of(context).size.width > 600) {
          isLargeScreen = true;
        } else {
          isLargeScreen = false;
        }
        //两个widget是放在一个Row中进行显示，如果是小屏幕的话，用一个空的Container进行占位
        //如果是大屏幕的话，则用Expanded进行屏幕的划分并显示详细视图
        return new Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            new Expanded(child: new ListWidget(
              itemSelectedCallback: (value) {
                //定义列表项的点击回调
                if (isLargeScreen) {
                  selectValue = value;
                  setState(() {});
                } else {
                  goTo(context, DetailWidget(value));
                }
              },
            )),
            isLargeScreen
                ? new Expanded(child: new DetailWidget(selectValue))
                : new Container()
          ],
        );
      }),
    );
  }
}