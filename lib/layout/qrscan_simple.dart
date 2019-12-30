//import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter/services.dart';


class QrscanSimple extends StatefulWidget {
  @override
  State<QrscanSimple> createState() => _QrscanSimpleState();
}

class _QrscanSimpleState extends State<QrscanSimple> {

  String barcode = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QrscanSimple'),
      ),
      body: Column(children: <Widget>[
        QrImage(
          data: 'This QR code has an embedded image as well',
          version: QrVersions.auto,
          size: 320,
          gapless: false,
          embeddedImage: AssetImage('images/ic_launcher.png'),
          embeddedImageStyle: QrEmbeddedImageStyle(
            size: Size(80, 80),
          ),
        ),
        Container(
            margin: EdgeInsets.all(5),
            width: double.maxFinite,
            child: RaisedButton(onPressed:(){
              scan();
            },child: Text('二维码生成与扫描'),)
        ),

        Text(barcode),

      ],),
    );
  }

  Future scan() async {
//    try {
//      String barcode = await BarcodeScanner.scan();
//      setState(() => this.barcode = barcode);
//    } on PlatformException catch (e) {
//      if (e.code == BarcodeScanner.CameraAccessDenied) {
//        setState(() {
//          this.barcode = 'The user did not grant the camera permission!';
//        });
//      } else {
//        setState(() => this.barcode = 'Unknown error: $e');
//      }
//    } on FormatException{
//      setState(() => this.barcode = 'null (User returned using the "back"-button before scanning anything. Result)');
//    } catch (e) {
//      setState(() => this.barcode = 'Unknown error: $e');
//    }
  }
}
