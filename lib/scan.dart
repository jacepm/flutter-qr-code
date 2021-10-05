import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:qr_code/reusable.dart';

class Scan extends StatefulWidget {
  Scan({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _ScanState createState() => _ScanState();
}

class _ScanState extends State<Scan> {
  String qrResult = 'Not yet scanned!';

  void _qrCodeScanner() {
    Future.delayed(Duration.zero, () async {
      ScanResult scanning = await BarcodeScanner.scan();
      setState(() {
        qrResult = scanning.rawContent != ''
            ? scanning.rawContent
            : qrResult;
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
            ReusableWidgets.textBuilder(
              text: 'RESULT',
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
            ReusableWidgets.textBuilder(
              text: qrResult,
              fontSize: 16.0,
            ),
            SizedBox(height: 20.0),
            ReusableWidgets.buttonBuilder(
              text: 'SCAN',
              onPressed: () {
                _qrCodeScanner();
              },
            ),
          ],
        ),
      ),
    );
  }
}
