import 'package:flutter/material.dart';
import 'package:open_kansas/ui/widgets/drawer.dart';
import 'package:open_kansas/ui/widgets/quantity_suggested_table.dart';

class QuantitySuggestedPage extends StatefulWidget {
  const QuantitySuggestedPage({ Key? key }) : super(key: key);

  @override
  State<QuantitySuggestedPage> createState() => _QuantitySuggestedPageState();
}

class _QuantitySuggestedPageState extends State<QuantitySuggestedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Safe Opioid Prescribing')),
      drawer: Drawer1(),
      body: ListView(
        children:[ QuantitySuggestedTable()],
      ),
    );
  }
}