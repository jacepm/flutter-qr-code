import 'package:flutter/material.dart';

class Generate extends StatefulWidget {
  Generate({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _GenerateState createState() => _GenerateState();
}

class _GenerateState extends State<Generate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[],
        ),
      ),
    );
  }
}
