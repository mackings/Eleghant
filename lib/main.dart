import 'package:etest/HomePG.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:fluttertoast/fluttertoast.dart';



void main() async {
  runApp(const MyApp());

  WidgetsFlutterBinding.ensureInitialized();
  final keyApplicationId = 'RZBr9gUcvOHhUiZw2AWqccU9enELYdiwxQFDuXNb';
  final keyClientKey = 'uRpe4TSfFtQpbxF5NCXfiJjWBgucxUMlHLs3wnT9';
  final keyParseServerUrl = 'https://parseapi.back4app.com';

  await Parse().initialize(keyApplicationId, keyParseServerUrl,
      clientKey: keyClientKey, autoSendSessionId: true);

  var firstObject = ParseObject('FirstClass')
    ..set(
        'message', 'Hey ! First message from Flutter. Parse is now connected');
  await firstObject.save();

  print('done');

}

class MyApp extends StatefulWidget {
  const MyApp({Key ?key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: mysignup(),
    );
  }
}
