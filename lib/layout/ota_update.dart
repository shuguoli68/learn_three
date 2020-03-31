import 'package:flutter/material.dart';
import 'package:ota_update/ota_update.dart';

class UpdatePage extends StatefulWidget {
  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  OtaEvent currentEvent;

  @override
  void initState() {
    super.initState();
  }

  Future<void> tryOtaUpdate() async {
    try {
      //LINK CONTAINS APK OF FLUTTER HELLO WORLD FROM FLUTTER SDK EXAMPLES
      OtaUpdate()
          .execute('http://gdown.baidu.com/data/wisegame/0d5a2f3c0e6b889c/qunaerlvxing_146.apk', destinationFilename: 'flutter_hello_world.apk')
          .listen(
            (OtaEvent event) {
          setState(() => currentEvent = event);
        },
      );
    } catch (e) {
      print('Failed to make OTA update. Details: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (currentEvent == null) {
      return Container(
        child: RaisedButton(onPressed:(){
          tryOtaUpdate();
        },child: Text('app下载更新'),)
      );
    }
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text(
              'OTA status: ${currentEvent.status} : ${currentEvent.value} \n'),
        ),
      ),
    );
  }
}