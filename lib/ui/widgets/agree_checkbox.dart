import 'package:flutter/material.dart';

class AgreeCheckBox extends StatefulWidget {
  final ValueSetter<bool>? callback;
  AgreeCheckBox({this.callback});
  MyAgreeCheckBox createState() => MyAgreeCheckBox();
}

///TODO: Make This Modular
class MyAgreeCheckBox extends State<AgreeCheckBox> {
  bool tf1 = false;
  @override
  Widget build(BuildContext context) {
    return Checkbox(
        value: tf1,
        checkColor: Colors.white,
        activeColor: Colors.blue,
        onChanged: (tf) {
          setState(() {
            tf1 = tf!;
            widget.callback!(this.tf1);
          });
        });
  }
}
