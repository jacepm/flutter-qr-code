import 'package:flutter/material.dart';
import 'package:qr_code/generate.dart';
import 'package:qr_code/reusable.dart';
import 'package:qr_code/scan.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter QR Code',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter QR Code'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(widget.title),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image.asset('images/qr-code.png'),
            SizedBox(height: 20.0),
            ReusableWidgets.buttonBuilder(
              text: 'Scan QR Code',
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Scan(title: 'Scan QR Code'),
                ));
              },
            ),
            ReusableWidgets.buttonBuilder(
              text: 'Generate QR Code',
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Generate(title: 'Generate QR Code'),
                ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
