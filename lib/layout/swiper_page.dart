import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';


class SwiperPage extends StatefulWidget {
  @override
  State<SwiperPage> createState() => _SwiperPageState();
}

class _SwiperPageState extends State<SwiperPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SwiperPage'),
      ),
      body: Swiper(
        itemBuilder: (BuildContext context,int index){
          return new Image.network("https://www.baidu.com/img/bd_logo1.png",fit: BoxFit.fill,);
        },
        itemCount: 3,
        pagination: new SwiperPagination(),
        control: new SwiperControl(),
      ),
    );
  }
}