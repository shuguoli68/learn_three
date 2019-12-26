import 'package:flutter/material.dart';
import 'package:learn_three/global/common.dart';
//import 'package:url_launcher/url_launcher.dart';

class UrlSimple extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _UrlSimple();
}

class _UrlSimple extends State<UrlSimple>{
  @override
  Widget build(BuildContext context) {
    const String email = '1652219550a@gmail.com';
    const String subject = 'email test';
    const String body = '这是一次email测试';
    return Scaffold(
      appBar: AppBar(title: Text('url跳转'),),
      body: Column(children: <Widget>[

        Container(
            margin: EdgeInsets.all(5),
            width: double.maxFinite,
            child: RaisedButton(onPressed:(){
              _makeAPhoneCall('123456');
            },child: Text('拨打电话'),)
        ),

        Container(
            margin: EdgeInsets.all(5),
            width: double.maxFinite,
            child: RaisedButton(onPressed:(){
              _sendAMessage('456123');
            },child: Text('发送短信'),)
        ),

        Container(
            margin: EdgeInsets.all(5),
            width: double.maxFinite,
            child: RaisedButton(onPressed:(){
              _launchInBrowser('https://www.baidu.com');
            },child: Text('MVP示例'),)
        ),

        Container(
            margin: EdgeInsets.all(5),
            width: double.maxFinite,
            child: RaisedButton(onPressed:(){
              _launchInBrowser('https://www.bing.com');
            },child: Text('MVP示例'),)
        ),

        Container(
            margin: EdgeInsets.all(5),
            width: double.maxFinite,
            child: RaisedButton(onPressed:(){
              _sendEmail(email,subject,body);
            },child: Text('发送邮件'),)
        ),

      ],),
    );
  }

  Future<Null> _makeAPhoneCall(String phone) async {
//    phone = "tel:$phone";
//    if (await canLaunch(phone)) {
//      await launch(phone);
//    } else {
//      throw 'Could not send $phone';
//    }
  }

  Future<Null> _sendAMessage(String phone) async {
//    phone = "sms:$phone";
//    if (await canLaunch(phone)) {
//      await launch(phone);
//    } else {
//      throw 'Could not launch $phone';
//    }
  }

  Future<Null> _launchInBrowser(String url) async {
//    if (await canLaunch(url)) {
//      await launch(url, forceSafariVC: false, forceWebView: false);
//    } else {
//      throw 'Could not launch $url';
//    }
  }

  Future<Null> _launchInWebViewOrVC(String url) async {
//    if (await canLaunch(url)) {
//      await launch(url, forceSafariVC: true, forceWebView: true);
//    } else {
//      throw 'Could not launch $url';
//    }
  }

  Future<Null> _sendEmail(String email,String subject,String body) async {
//    email = "mailto:$email?subject=$subject&body=$body";
//    if (await canLaunch(email)) {
//      await launch(email);
//    } else {
//      throw 'Could not send $email';
//    }
  }
}