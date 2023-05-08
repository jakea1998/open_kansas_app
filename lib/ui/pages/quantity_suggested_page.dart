import 'package:flutter/material.dart';
import 'package:open_kansas/ui/widgets/drawer.dart';
import 'package:open_kansas/ui/widgets/quantity_suggested_table.dart';
import 'package:fluent_ui/fluent_ui.dart' as fluent;
import 'package:open_kansas/utils/colors.dart';
class QuantitySuggestedPage extends StatefulWidget {
  const QuantitySuggestedPage({ Key? key }) : super(key: key);

  @override
  State<QuantitySuggestedPage> createState() => _QuantitySuggestedPageState();
}

class _QuantitySuggestedPageState extends State<QuantitySuggestedPage> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(appBarTheme: AppBarTheme(color: blueColor)),
      child: Scaffold(
        appBar: AppBar(title: Text('Safe Opioid Prescribing')),
        drawer: Drawer1(),
        body: ListView(
          children:[ QuantitySuggestedTable()],
        ),
      ),
    );
  }
}