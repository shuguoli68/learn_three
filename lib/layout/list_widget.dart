import 'package:flutter/material.dart';

//需要定义一个回调，决定是在同一个屏幕上显示更改详细视图还是在较小的屏幕上导航到不同界面。
typedef Null ItemSelectedCallback(int value);
//列表的Widget
class ListWidget extends StatelessWidget {
  ItemSelectedCallback itemSelectedCallback;

  ListWidget({@required this.itemSelectedCallback});

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return new ListTile(
            title: new Text("$index"),
            onTap: () {
              //设置点击事件
              this.itemSelectedCallback(index);
            },
          );
        });
  }
}