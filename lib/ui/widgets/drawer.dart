import 'package:flutter/material.dart';
import 'package:open_kansas/ui/pages/disposal_site_page.dart';
import 'package:open_kansas/ui/pages/drug_disposal_education_page.dart';
import 'package:open_kansas/ui/pages/non_opioid_medication_page.dart';
import 'package:open_kansas/ui/pages/opioid_conversion_calculator_page.dart';
import 'package:open_kansas/ui/pages/pdmp_page.dart';
import 'package:open_kansas/ui/pages/quantity_suggested_page.dart';
import 'package:open_kansas/ui/widgets/drawer_list_widget.dart';
import 'package:open_kansas/utils/fonts.dart';

class Drawer1 extends StatelessWidget {
  const Drawer1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.blue,
        width: MediaQuery.of(context).size.width * 0.6,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "Open Kansas",
                style: headingFont.copyWith(color: Colors.white),
              ),
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
                text: "Test Reminders for Patients", onTapped: () {}),
          ],
        ),
      ),
    );
  }
}
