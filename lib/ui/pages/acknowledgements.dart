import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:open_kansas/ui/widgets/drawer.dart';
import 'package:open_kansas/utils/colors.dart';

class Acknowledgements extends StatefulWidget {
  const Acknowledgements({Key? key}) : super(key: key);

  @override
  State<Acknowledgements> createState() => _AcknowledgementsState();
}

class _AcknowledgementsState extends State<Acknowledgements> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(appBarTheme: AppBarTheme(color: blueColor)),
      child: Scaffold(
        appBar:AppBar(
          
          title: Text('Acknowledgements')),
        drawer: Drawer1(),
        body: 
    
        Column(
          children: [
            SizedBox(height: 10,),
            Card(
        margin: EdgeInsets.all(12),
        elevation: 4,
        shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(12))
        ,clipBehavior: Clip.hardEdge,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text("Aaron LacKamp MD would like to thank: the Wyandotte County Kansas Health Department, Michigan OPEN, KSA, KU GME, KU anesthesiology, KDHE, Kansas Prescription Drug and Opioid Advisory Committee, DCCCA, Krista Machado, Adrienne Hearrell, Jessica Keane, Toby Becker, Jake Stegeman. Mark Bicket MD, Susheel Govindan MD, JP Pozek MD, Ty Kane, Greg Unruh MD, KS AG office, and everyone else who provided feedback, support, or content.")
        ),
      )
            
          ],
        ),
      ),
    );
  }
}