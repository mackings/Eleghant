import 'package:flutter/material.dart';

class daenjoy extends StatefulWidget {
  const daenjoy({Key ? key}) : super(key: key);

  @override
  _daenjoyState createState() => _daenjoyState();
}

class _daenjoyState extends State<daenjoy> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("Enjoy ground"),
        ),
      ),
    );
  }
}
