import 'package:flutter/material.dart';

class BackPress extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _BackPress();
}

class _BackPress extends State<BackPress>{

  bool type = true;

  @override
  Widget build(BuildContext context) {
    return _body();
  }

  _body(){
    if(type){
      return Scaffold(
        appBar: AppBar(title: Text('返回拦截'),),
        body: SafeArea(
          top: false,
          bottom: false,
          child: Form(
            onWillPop: _onBackPressed,
            child: Column(children: <Widget>[
              Text('实现原理是利用form自带的onWillPop属性，其余与will_pop_scope_demo中一致。'),
              Container(
                  margin: EdgeInsets.all(5),
                  width: double.maxFinite,
                  child: RaisedButton(onPressed:(){
                    setState(() {
                      type = !type;
                    });
                  },child: Text('跳转WillPopScope实现'),)
              ),


            ],),
          ),
        ),
      );
    }else{
      return WillPopScope(
        child: Scaffold(
          appBar: AppBar(title: Text('返回拦截'),),
          body: Column(children: <Widget>[
            Text('实现原理，使用WillPopScope组件，它会检测到子组件的Navigation的pop事件，并拦截下来。我们需要在它的onWillPop属性中返回一个新的组件（一般是一个Dialog）处理是否真的pop该页面。'),
            Container(
                margin: EdgeInsets.all(5),
                width: double.maxFinite,
                child: RaisedButton(onPressed:(){
                  setState(() {
                    type = !type;
                  });
                },child: Text('跳转form实现'),)
            ),

          ],),
        ),
        onWillPop: _onBackPressed,
      );
    }
  }

  Future<bool> _onBackPressed() {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Do you really want to exit the app?'),
          actions: <Widget>[
            FlatButton(
              child: Text('No'),
              onPressed: () => Navigator.pop(context, false),
            ),
            FlatButton(
              child: Text('Yes'),
              onPressed: () => Navigator.pop(context, true),
            ),
          ],
        ));
  }
}