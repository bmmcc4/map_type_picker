import 'package:flutter/material.dart';
import 'package:map_type_picker/map_type_picker.dart';
import 'package:platform_maps_flutter/platform_maps_flutter.dart';

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

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    MapTypePicker.mapType = MapType.normal; // Set Default Map Type here
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sample Map Type Picker"), elevation: 0),
      body: Stack(children: [
        PlatformMap(
            mapType: MapTypePicker.mapType, // Enter Map Type Here
            initialCameraPosition: const CameraPosition(
              target: LatLng(51.507391, -0.1277),
              zoom: 10.0,
            )),
        MapTypePicker(
            notifyParent: refresh,
            edgeInsetsAll: 10,
            backgroundColor: Colors.grey.withOpacity(0.45)) // Overlay Here
      ]),
    );
  }

  // refresh to update parent state from child
  refresh() {
    setState(() {});
  }
}
