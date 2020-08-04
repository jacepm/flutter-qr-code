import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';

class Scan extends StatefulWidget {
  Scan({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _ScanState createState() => _ScanState();
}

class _ScanState extends State<Scan> {
  String result = 'Not yet scanned!';

  void _qrCodeScanner() {
    Future.delayed(Duration.zero, () async {
      ScanResult scanning = await BarcodeScanner.scan();
      setState(() {
        result = scanning.rawContent;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Container(
        padding: EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _textBuilder(
              text: 'RESULT',
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
            _textBuilder(text: result, fontSize: 16.0),
            SizedBox(height: 20.0),
            FlatButton(
              padding: EdgeInsets.all(10.0),
              child: Text('SCAN'),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(color: Colors.blue, width: 3.0),
              ),
              onPressed: () {
                _qrCodeScanner();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _textBuilder({String text, double fontSize, FontWeight fontWeight}) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight ?? FontWeight.normal,
      ),
      textAlign: TextAlign.center,
    );
  }
}
