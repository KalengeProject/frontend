import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';

class Light extends StatefulWidget {
  @override
  _Light createState() => _Light();
}

class _Light extends State<Light> {

  var userData;

  void turnOnOffLight() {
    DynamicTheme.of(context).setBrightness(
        Theme.of(context).brightness == Brightness.dark
            ? Brightness.light
            : Brightness.dark);
    }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: IconButton(onPressed: turnOnOffLight, icon: Icon(Icons.lightbulb_outline)),
    );
  }


}