import 'package:flutter/material.dart';
import 'package:networking/src/Scereen/parsing_json.dart';
import 'package:networking/src/Scereen/pasing_json_map.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:JsonParsingMap(),
      
    );
  }
}
