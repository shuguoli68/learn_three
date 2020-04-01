import 'package:flutter/material.dart';
import 'package:share/share.dart';

import 'camera/camera_simple.dart';
import 'connect/connect_simple.dart';
import 'fresh/fresh_simple.dart';
import 'global/api_service.dart';
import 'global/common.dart';
import 'imgpicker/img_picker.dart';
import 'layout/back_press.dart';
import 'layout/down_menu.dart';
import 'layout/frosted_glass.dart';
import 'layout/large_screen.dart';
import 'layout/notification_simple.dart';
import 'layout/ota_update.dart';
import 'layout/permission_simple.dart';
import 'layout/pick_page.dart';
import 'layout/qrscan_simple.dart';
import 'layout/simple_chart.dart';
import 'layout/slider_screen.dart';
import 'layout/swiper_page.dart';
import 'mvp/view/login_page.dart';
import 'pay_input/pay_page.dart';
import 'url_launcher/url_simple.dart';

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
                  goTo(context, SliderScreen());
                },child: Text('应该介绍页'),)
            ),

            Container(
                margin: EdgeInsets.all(5),
                width: double.maxFinite,
                child: RaisedButton(onPressed:(){
                  goTo(context, PermissionSimple());
                },child: Text('权限申请'),)
            ),

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

            Container(
                margin: EdgeInsets.all(5),
                width: double.maxFinite,
                child: RaisedButton(onPressed:(){
                  goTo(context, LoginPage());
                },child: Text('MVP示例'),)
            ),

            Container(
                margin: EdgeInsets.all(5),
                width: double.maxFinite,
                child: RaisedButton(onPressed:(){
                  goTo(context, UrlSimple());
                },child: Text('url_launcher'),)
            ),

            Container(
                margin: EdgeInsets.all(5),
                width: double.maxFinite,
                child: RaisedButton(onPressed:(){
                  goTo(context, FrostedGlass());
                },child: Text('毛玻璃'),)
            ),

            Container(
                margin: EdgeInsets.all(5),
                width: double.maxFinite,
                child: RaisedButton(onPressed:(){
                  goTo(context, NotifyPage());
                },child: Text('通知'),)
            ),

            Container(
                margin: EdgeInsets.all(5),
                width: double.maxFinite,
                child: RaisedButton(onPressed:(){
                  goTo(context, QrscanSimple());
                },child: Text('二维码生成与扫描'),)
            ),

            Container(
                margin: EdgeInsets.all(5),
                width: double.maxFinite,
                child: RaisedButton(onPressed:(){
                  goTo(context, BackPress());
                },child: Text('返回拦截'),)
            ),

            Container(
                margin: EdgeInsets.all(5),
                width: double.maxFinite,
                child: RaisedButton(onPressed:(){
                  goTo(context, PayPage());
                },child: Text('支付密码输入框'),)
            ),

            Container(
                margin: EdgeInsets.all(5),
                width: double.maxFinite,
                child: RaisedButton(onPressed:(){
                  goTo(context, DownMenu());
                },child: Text('下拉菜单'),)
            ),

            Container(
                margin: EdgeInsets.all(5),
                width: double.maxFinite,
                child: RaisedButton(onPressed:(){
                  goTo(context, PickPage());
                },child: Text('选择器'),)
            ),

            Container(
                margin: EdgeInsets.all(5),
                width: double.maxFinite,
                child: RaisedButton(onPressed:(){
                  goTo(context, UpdatePage());
                },child: Text('app下载更新'),)
            ),

            Container(
                margin: EdgeInsets.all(5),
                width: double.maxFinite,
                child: RaisedButton(onPressed:(){
                  goTo(context, SwiperPage());
                },child: Text('swiper轮播'),)
            ),

            Container(
                margin: EdgeInsets.all(5),
                width: double.maxFinite,
                child: RaisedButton(onPressed:(){
                  goTo(context, ChartPage());
                },child: Text('各式图表'),)
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

  _down(){
    ApiService.downLoad().then((response){
      response.data;
    });
  }
}