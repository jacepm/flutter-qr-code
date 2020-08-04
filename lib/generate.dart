import 'package:flutter/material.dart';
import 'package:qr_code/reusable.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Generate extends StatefulWidget {
  Generate({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _GenerateState createState() => _GenerateState();
}

class _GenerateState extends State<Generate> {
  String qrData = 'https://github.com/jacepm';
  TextEditingController qrController = TextEditingController();

  void _qrCodeGenerator() {
    setState(() {
      qrData =
          qrController.text.isEmpty ? 'https://flutter.dev' : qrController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(30.0),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              QrImage(data: qrData),
              SizedBox(height: 20.0),
              ReusableWidgets.textBuilder(
                text: 'Get your link/text to the QR CODE',
              ),
              TextField(
                controller: qrController,
                decoration: InputDecoration(
                  hintText: 'Enter the link/text here..',
                ),
              ),
              SizedBox(height: 20.0),
              ReusableWidgets.buttonBuilder(
                text: 'GENERATE',
                onPressed: () {
                  _qrCodeGenerator();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
