import 'package:flutter/material.dart';
import 'package:fluent_ui/fluent_ui.dart' as fluent;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_kansas/blocs/legal/legal_bloc.dart';
import 'package:open_kansas/ui/pages/legal_page.dart';
import 'package:open_kansas/ui/widgets/drawer.dart';
import 'package:open_kansas/ui/widgets/opioid_calculator.dart';
import 'package:open_kansas/ui/widgets/opioid_calculator_info.dart';

class OpioidConversionCalculatorPage extends StatefulWidget {
  const OpioidConversionCalculatorPage({Key? key}) : super(key: key);

  @override
  State<OpioidConversionCalculatorPage> createState() =>
      _OpioidConversionCalculatorPageState();
}

class _OpioidConversionCalculatorPageState
    extends State<OpioidConversionCalculatorPage> {
 

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Safe Opioid Prescribing')),
      drawer: Drawer1(),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              OpioidCalculator(),
              Expanded(child: OpioidCalculatorInfo()),
              SizedBox(
                height: 12,
              )
            ],
          )),
    );
  }
}
