import 'package:flutter/material.dart';
import 'package:open_kansas/ui/widgets/drawer.dart';
import 'package:open_kansas/ui/widgets/non_opioid_adjuncts.dart';

class NonOpioidMedicationPage extends StatefulWidget {
  const NonOpioidMedicationPage({Key? key}) : super(key: key);

  @override
  State<NonOpioidMedicationPage> createState() =>
      _NonOpioidMedicationPageState();
}

class _NonOpioidMedicationPageState extends State<NonOpioidMedicationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(title: Text('Safe Opioid Prescribing')),
      drawer: Drawer1(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: const NonOpioidAdjuncts(),
      ),
    );
  }
}
