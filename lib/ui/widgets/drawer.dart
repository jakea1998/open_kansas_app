import 'package:flutter/material.dart';
import 'package:open_kansas/ui/pages/acknowledgements.dart';
import 'package:open_kansas/ui/pages/disposal_site_page.dart';
import 'package:open_kansas/ui/pages/drug_disposal_education_page.dart';
import 'package:open_kansas/ui/pages/non_opioid_medication_page.dart';
import 'package:open_kansas/ui/pages/opioid_conversion_calculator_page.dart';
import 'package:open_kansas/ui/pages/pdmp_page.dart';
import 'package:open_kansas/ui/pages/quantity_suggested_page.dart';
import 'package:open_kansas/ui/widgets/drawer_list_widget.dart';
import 'package:open_kansas/utils/colors.dart';
import 'package:open_kansas/utils/fonts.dart';

class Drawer1 extends StatelessWidget {
  const Drawer1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: blueColor,
        width: MediaQuery.of(context).size.width * 0.6,
        child: ListView(
          children: [
            Row(
              children: [
               
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset('lib/assets/general/OpenKSLogo.png',width: 150,fit: BoxFit.fitWidth,)
                ),
                Spacer(flex: 1,),
              ],
            ),
            DrawerListWidget(text: "Non-Opioid Adjuncts", onTapped: () {
              Navigator.push(context,
                      MaterialPageRoute(builder: (context) => NonOpioidMedicationPage()));
            }),
            DrawerListWidget(
                text: "Opioid Conversion Calculator", onTapped: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => OpioidConversionCalculatorPage()));
                }),
            DrawerListWidget(text: "Quantity Suggested", onTapped: () {
              Navigator.push(context,
                      MaterialPageRoute(builder: (context) => QuantitySuggestedPage()));
            }),
            DrawerListWidget(
                text: "PDMP",
                onTapped: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PDMPPage()));
                }),
            DrawerListWidget(text: "Drug Disposal Education", onTapped: () {
               Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DrugDisposalEducation()));
            }),
            
            DrawerListWidget(text: "Disposal Location Finder", onTapped: () {
              Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DisposalSitePage()));
            }),
            DrawerListWidget(
                text: "Text Reminders for Patients", onTapped: () {}),
            DrawerListWidget(
                text: "User Guide", onTapped: () {}),
            DrawerListWidget(
                text: "Acknowledgements", onTapped: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Acknowledgements()));
                }),
          ],
        ),
      ),
    );
  }
}
