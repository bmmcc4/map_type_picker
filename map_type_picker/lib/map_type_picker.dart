library map_type_picker;

import 'package:flutter/material.dart';
import 'package:platform_maps_flutter/platform_maps_flutter.dart';

class MapTypePicker extends StatefulWidget {
  const MapTypePicker({
    Key? key,
    this.horizontalPadding,
    this.edgeInsetsAll,
    this.buttonSpacing,
    this.backgroundColor,
    this.buttonSelectedColor,
    this.buttonTextColor,
    required this.notifyParent,
  }) : super(key: key);

  final double? horizontalPadding;
  final double? edgeInsetsAll;
  final double? buttonSpacing;
  final Color? backgroundColor;
  final Color? buttonSelectedColor;
  final Color? buttonTextColor;

  final Function() notifyParent;

  static var mapType;

  MapType returnMapType(String mapTypeStr) {
    switch (mapTypeStr) {
      case 'Satellite':
        return mapType = MapType.satellite;
      case 'Hybrid':
        return mapType = MapType.hybrid;
      case 'Standard':
        return mapType = MapType.normal;
      default:
        return mapType = mapType;
    }
  }

  @override
  _MapTypePickerState createState() => _MapTypePickerState();
}

class _MapTypePickerState extends State<MapTypePicker> {
  var mapTypes = {'Standard': false, 'Satellite': false, 'Hybrid': false};

  @override
  void initState() {
    _setDefaultMapType(mapTypes);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(widget.edgeInsetsAll ?? 0),
        padding:
            EdgeInsets.symmetric(horizontal: widget.horizontalPadding ?? 5),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (var mapTypeEntry in mapTypes.entries)
              TextButton(
                  child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: widget.buttonSpacing ?? 15),
                      child: Text(mapTypeEntry.key.toString(),
                          style: const TextStyle(fontWeight: FontWeight.w600))),
                  onPressed: () {
                    mapTypes.updateAll((key, value) => false);
                    mapTypes.update(mapTypeEntry.key, (value) => !value);
                    widget.returnMapType(mapTypeEntry.key);
                    widget.notifyParent();
                  },
                  style: mapTypeEntry.value == true
                      ? TextButton.styleFrom(
                          primary: widget.buttonSelectedColor ?? Colors.black,
                          backgroundColor:
                              widget.buttonSelectedColor ?? Colors.white)
                      : TextButton.styleFrom(
                          primary: widget.buttonSelectedColor ?? Colors.black))
          ],
        ),
        decoration: BoxDecoration(
            color: widget.backgroundColor,
            borderRadius: BorderRadius.circular(5)));
  }

  Future _setDefaultMapType(Map<String, bool> mapTs) async {
    if (MapTypePicker.mapType == MapType.normal) {
      mapTs.update('Standard', (value) => true);
    } else if (MapTypePicker.mapType == MapType.satellite) {
      mapTs.update('Satellite', (value) => true);
    } else if (MapTypePicker.mapType == MapType.hybrid) {
      mapTs.update('Hybrid', (value) => true);
    }
  }
}
