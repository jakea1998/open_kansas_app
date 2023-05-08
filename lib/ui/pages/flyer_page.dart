import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:open_kansas/utils/colors.dart';
import 'package:printing/printing.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';

class FlyerPage extends StatefulWidget {
  final String assetImage;
  const FlyerPage({Key? key, required this.assetImage}) : super(key: key);

  @override
  State<FlyerPage> createState() => _FlyerPageState();
}

class _FlyerPageState extends State<FlyerPage> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      
      data: ThemeData(appBarTheme: AppBarTheme(color: blueColor)),
      child: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            actions: [
              Padding(
                      padding: EdgeInsets.all(8),
                      child: IconButton(
                        icon: Icon(
                          Icons.print,
                          color: Colors.white,
                          size: 25,
                        ),
                        onPressed: () async {
                          HapticFeedback.mediumImpact();
                          final doc = pw.Document();
                          final image = await imageFromAssetBundle(
                              "lib/assets/drug_disposal_flyers/disposal_facts.jpeg");
    
                          doc.addPage(pw.Page(build: (pw.Context context) {
                            return pw.Center(
                              child: pw.Image(image),
                            ); // Center
                          }));
                          await Printing.layoutPdf(
                              onLayout: (format) => doc.save());
                        },
                      ))
            ],
              leading: BackButton(
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
            
          ),),
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(children: [
              
              Spacer(
                flex: 1,
              ),
              InteractiveViewer(
               
      panEnabled: false, // Set it to false
      boundaryMargin: EdgeInsets.all(0),
      minScale: 0.5,
      maxScale: 2,
    
                child: Image.asset(
                  widget.assetImage,
                  fit: BoxFit.fitWidth,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              Spacer(
                flex: 1,
              )
            ]),
          )),
    );
  }
}
