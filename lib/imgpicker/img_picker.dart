import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:learn_three/global/common.dart';

class ImgPicker extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _ImgPicker();
}

class _ImgPicker extends State<ImgPicker>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('拍照相册'),
      ),
      body: Column(children: <Widget>[
        RaisedButton(
          onPressed: _takePhoto,
          child: Text("拍照"),
        ),
        RaisedButton(
          onPressed: _openGallery,
          child: Text("选择照片"),
        ),
        RaisedButton(
          onPressed: _takeVideo,
          child: Text("拍摄视频"),
        ),
        RaisedButton(
          onPressed: _getVideo,
          child: Text("选择视频"),
        ),
      ],),
    );
  }

  /*拍照*/
  _takePhoto() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    if(image != null)
      print('拍照返回：' + image.path);
    else
      print('拍照返回：已取消');
  }

  /*相册*/
  _openGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    if(image != null)
      print('相册返回：' + image.path);
    else
      print('相册返回：已取消');
  }

  /*选取视频*/
  _getVideo() async {
    var image = await ImagePicker.pickVideo(source: ImageSource.gallery);
    if(image != null)
      print('选取视频：' + image.path);
    else
      print('选取视频：已取消');
  }
  /*拍摄视频*/
  _takeVideo() async {
    var image = await ImagePicker.pickVideo(source: ImageSource.camera);
    if(image != null)
      print('拍摄视频：' + image.path);
    else
      print('拍摄视频：已取消');
  }
}