import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:learn_three/global/common.dart';
import 'package:intro_slider/slide_object.dart';

class SliderScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _SliderScreen();
}

class _SliderScreen extends State<SliderScreen>{
  List<Slide> slides = new List();

  @override
  void initState() {
    super.initState();

    slides.add(
      new Slide(
        title: "FLUTTER",
        description:
        "Get Faster Development, Flexible UI & Access Native Features. Learn More! High-Quality Interfaces. Flexible UI. Fast Development.",
        pathImage: "images/ic_launcher.png",
        backgroundColor: Colors.blue,
      ),
    );
    slides.add(
      new Slide(
        title: "DART",
        description:
        "Developers at Google and elsewhere use Dart to create high-quality, mission-critical apps for iOS, Android, and the web. With features aimed at client-side development, Dart is a great fit for both mobile and web apps.",
        pathImage: "images/ic_launcher.png",
        backgroundColor: Colors.green,
      ),
    );
    slides.add(
      new Slide(
        title: "WELECOME",
        description:
        "开始你的app",
        pathImage: "images/ic_launcher.png",
        backgroundColor: Colors.red,
      ),
    );
  }

  void onDonePress() {
    Navigator.pop(context);
  }

  void onSkipPress() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      slides: this.slides,
      onDonePress: this.onDonePress,
      onSkipPress: this.onSkipPress,
    );
  }
}