// ignore_for_file: file_names

import 'package:etest/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

class mysignup extends StatefulWidget {
  @override
  _mysignupState createState() => _mysignupState();
}

// ignore: camel_case_types
class _mysignupState extends State<mysignup> {
  final String finger =
      ("hhttps://www.svgrepo.com/download/44455/fingerprint.svg");

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black38,
        appBar: AppBar(
          backgroundColor: Colors.black38,
          title: Text("The"),
        ),
        body: Container(
          child: Column(
            children: [
              Text(
                'Thor',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(229, 229, 229, 1),
                    fontFamily: 'Roboto',
                    fontSize: 300,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.white,
            child: SvgPicture.network(
              "https://www.svgrepo.com/download/13645/next.svg",
              height: 15.0,
              width: 80.0,

            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Mysignup()));
              Fluttertoast.showToast(msg: "Welcome To Thor");
                  }
            ),
        drawer: Drawer(),
      ),
    );
  }
}
