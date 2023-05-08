import 'package:flutter/material.dart';
import 'package:open_kansas/utils/colors.dart';
import 'package:fluent_ui/fluent_ui.dart' as fluent;

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
    return fluent.Checkbox(
      checked: tf1,
        
       style: fluent.CheckboxThemeData(
        checkedDecoration: fluent.ButtonState.all(fluent.BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: Colors.white,width: 2),
          color: Colors.transparent
          )) ,
        uncheckedIconColor: fluent.ButtonState.all(Colors.transparent),
        uncheckedDecoration: fluent.ButtonState.all(fluent.BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: Colors.white,width: 2),
          color: Colors.transparent))  ,
        checkedIconColor: fluent.ButtonState.all(Colors.white), ),
        onChanged: (tf) {
          setState(() {
            tf1 = tf!;
            widget.callback!(this.tf1);
          });
        });
  }
}
