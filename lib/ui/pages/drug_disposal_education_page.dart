import 'package:flutter/material.dart';
import 'package:open_kansas/ui/widgets/drawer.dart';
import 'package:open_kansas/utils/spacers.dart';

class DrugDisposalEducation extends StatefulWidget {
  const DrugDisposalEducation({ Key? key }) : super(key: key);

  @override
  State<DrugDisposalEducation> createState() => _DrugDisposalEducationState();
}

class _DrugDisposalEducationState extends State<DrugDisposalEducation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(title: Text('Safe Opioid Prescribing')),
      drawer: Drawer1(),
      body: ListView(
        children: [
          Image.asset("lib/assets/drug_disposal_flyers/disposal_facts.jpeg",width: MediaQuery.of(context).size.width,fit: BoxFit.fitWidth,)
          ,midVSpacer,
          Image.asset("lib/assets/drug_disposal_flyers/disposal_options.jpeg",width: MediaQuery.of(context).size.width,fit: BoxFit.fitWidth,),
          midVSpacer,
          Image.asset("lib/assets/drug_disposal_flyers/disposal_plan.jpeg",width: MediaQuery.of(context).size.width,fit: BoxFit.fitWidth,),
          midVSpacer,
          Image.asset("lib/assets/drug_disposal_flyers/opioids_manage_pain_safely.jpeg",width: MediaQuery.of(context).size.width,fit: BoxFit.fitWidth,),
          midVSpacer,
          Image.asset("lib/assets/drug_disposal_flyers/remove_risks_opioids.jpeg",width: MediaQuery.of(context).size.width,fit: BoxFit.fitWidth,),
          midVSpacer,
          Image.asset("lib/assets/drug_disposal_flyers/single_opportunity_opioids.jpeg",width: MediaQuery.of(context).size.width,fit: BoxFit.fitWidth,),
        ],
      ),
    );
  }
}