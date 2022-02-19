<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

Dart package that creates a custom picker to easily change between map types when using Platform Maps in your app.

## Features

Use a Stack widget to overlay the map type picker ontop of a Platform Map, then easily switch between different map types. Map type picker colors are completly customizable.
![map-switching-type-with-picker](https://github.com/bmmcc4/map_type_picker/blob/main/map_type_picker/lib/example%20videos/ezgif.com-gif-maker.gif)

## Getting started

The platform_maps_flutter package must be imported into your project before using the map_type_picker package

## Usage

1. Set starting map type in your Widget initState
```dart
@override
  void initState() {
    MapTypePicker.mapType = MapType.normal; // Here, options are .normal, .hybrid, .satellite
    super.initState();
  }
```
2. Set Platform Map mapType to variable set in initState
```dart
PlatformMap(
            mapType: MapTypePicker.mapType, // Here
            initialCameraPosition: const CameraPosition(
              target: LatLng(51.507391, -0.1277),
              zoom: 10.0,
            ))
```
3. In the same class as the Map Type Picker, create a refresh function to update parent Platform Map state from child MapTypePicker
```dart
refresh() {
    setState(() {});
  }
```
4. Overlay Platform Map with Map Type Picker widget, pass the refresh function in the notifyParent argument
```dart
MapTypePicker(notifyParent: refresh)
```

## Additional information

See example for full sample app implementing the Map Type Picker widget.
