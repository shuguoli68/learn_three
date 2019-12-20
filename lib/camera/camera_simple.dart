import 'dart:async';
import 'package:flutter/material.dart';
//import 'package:camera/camera.dart';

class CameraSimple extends StatefulWidget {
  @override
  _CameraSimpleState createState() => _CameraSimpleState();
}

class _CameraSimpleState extends State<CameraSimple> {
//  List<CameraDescription> cameras;
//  CameraController controller;
  bool isOk = false;

  _initData()async{
//    cameras = await availableCameras();
//    controller = CameraController(cameras[0], ResolutionPreset.medium);
//    print('initdata');
//    controller.initialize().then((_) {
//      print(mounted);
//      if (!mounted) {
//        return;
//      }
//      setState(() { isOk = true; });
//    });
  }

  @override
  void initState(){
    super.initState();
    _initData();
  }

  @override
  void dispose() {
//    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if(isOk){
//      if (!controller.value.isInitialized) {
        return Container();
//      }
//      return AspectRatio(
//          aspectRatio:
//          controller.value.aspectRatio,
//          child: CameraPreview(controller));
    }else{
      return Container(child: Text('empty'),);
    }

  }
}