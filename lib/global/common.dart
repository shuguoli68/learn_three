import 'dart:io';

import 'package:flutter/material.dart';


goTo(BuildContext context, Widget key){
  Navigator.of(context).push(MaterialPageRoute(builder: (_){
    return key;
  }));
}

goToRm(BuildContext context, Widget key){
  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_){
    return key;
  }), (route) => route == null);
}

numStr(int count){
  if(count<11000){
    return count.toString();
  }else if(count<10000*100){
    return (count/10000.0).toStringAsFixed(2)+'万';
  }else{
    return (count/10000.0).toStringAsFixed(1)+'万';
  }
}

isAndroid(){
  if(Platform.isAndroid)
    return true;
  return false;
}
