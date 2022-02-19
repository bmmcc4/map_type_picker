import 'package:flutter/material.dart';
import 'package:map_type_picker/map_type_picker.dart';
import 'package:platform_maps_flutter/platform_maps_flutter.dart';
import 'package:example/screens/homepagescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}
