import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:open_kansas/ui/pages/flyer_page.dart';
import 'package:open_kansas/ui/widgets/drawer.dart';
import 'package:open_kansas/utils/colors.dart';
import 'package:open_kansas/utils/spacers.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';

class DrugDisposalEducation extends StatefulWidget {
  const DrugDisposalEducation({Key? key}) : super(key: key);

  @override
  State<DrugDisposalEducation> createState() => _DrugDisposalEducationState();
}

class _DrugDisposalEducationState extends State<DrugDisposalEducation> {
  Future<List<Image>> getTableForFlushList() async {
    // Load from assets
    List<Image> images = [];
    print('run');
    PDFDocument doc =
        await PDFDocument.fromAsset('lib/assets/general/flushList.pdf');
    print('count:${doc.count}');
    for (int i = 1; i < 5; i++) {
      final doc1 = await doc.get(page: i);

      images.add(Image.file(
        File(doc1.imgPath ?? ""),
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.fitWidth,
      ));
    }
    return images;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final pdf = FutureBuilder<List<Image>>(
        future: getTableForFlushList(),
        builder: (context, snapshot) {
          print('snap');
          print(snapshot.data?.length);
          return Column(
            children: snapshot.data
                    ?.map((e) => Image(
                          image: e.image,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.fitWidth,
                        ))
                    .toList() ??
                [],
          );
        });
    return Theme(
      data: ThemeData(appBarTheme: AppBarTheme(color: blueColor)),
      child: Scaffold(
        appBar: AppBar(title: Text('Safe Opioid Prescribing')),
        drawer: Drawer1(),
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                  "Educate your patients on proper opioid disposal and safe storage of medications until disposal. For most patients using a designated drug disposal location on the DEA disposal finder is the best option. Using a drug take back day, drug neutralizing disposal bag, or tailback program may also be options depending on availability. For patients with limited options the FDA flush list specifies which medications can be flushed down the waste water. These are generally high risk medications that should not be kept in the home when not needed. Other prescription medications can be placed in the trash once identifying information is removed and mixed with inert material. For chemotherapy medication and bulk medications other instructions apply. Please find the printable material that can be used as flyers or discussion material."),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FlyerPage(
                            assetImage:
                                "lib/assets/drug_disposal_flyers/disposal_facts.jpeg")));
              },
              child: Image.asset(
                "lib/assets/drug_disposal_flyers/disposal_facts.jpeg",
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fitWidth,
              ),
            ),
            midVSpacer,
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FlyerPage(
                            assetImage:
                                "lib/assets/drug_disposal_flyers/disposal_options.jpeg")));
              },
              child: Image.asset(
                "lib/assets/drug_disposal_flyers/disposal_options.jpeg",
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fitWidth,
              ),
            ),
            midVSpacer,
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FlyerPage(
                            assetImage:
                                "lib/assets/drug_disposal_flyers/disposal_plan.jpeg")));
              },
              child: Image.asset(
                "lib/assets/drug_disposal_flyers/disposal_plan.jpeg",
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fitWidth,
              ),
            ),
            midVSpacer,
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FlyerPage(
                            assetImage:
                                "lib/assets/drug_disposal_flyers/opioids_manage_pain_safely.jpeg")));
              },
              child: Image.asset(
                "lib/assets/drug_disposal_flyers/opioids_manage_pain_safely.jpeg",
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fitWidth,
              ),
            ),
            midVSpacer,
            /* Image.asset(
              "lib/assets/drug_disposal_flyers/remove_risks_opioids.jpeg",
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fitWidth,
            ), */
            //midVSpacer,
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FlyerPage(
                            assetImage:
                                "lib/assets/drug_disposal_flyers/single_opportunity_opioids.jpeg")));
              },
              child: Image.asset(
                "lib/assets/drug_disposal_flyers/single_opportunity_opioids.jpeg",
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fitWidth,
              ),
            ),
            pdf
            /*  DataTable(
              columns: [
                DataColumn(label: Text("Medicine")),
                DataColumn(label: Text("Active Ingredient"))
              ], rows: [
                DataRow(cells: )
              ]) */
          ],
        ),
      ),
    );
  }
}
