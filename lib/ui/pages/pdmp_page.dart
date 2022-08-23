import 'package:flutter/material.dart';
import 'package:open_kansas/models/link_model.dart';
import 'package:open_kansas/ui/widgets/buttons.dart';
import 'package:open_kansas/ui/widgets/drawer.dart';
import 'package:open_kansas/utils/fonts.dart';
import 'package:open_kansas/utils/pdmp_links.dart';
import 'package:fluent_ui/fluent_ui.dart' as fluent;
import 'package:open_kansas/utils/spacers.dart';
import 'package:url_launcher/url_launcher_string.dart';

enum PDMP { select, other, link }

class PDMPPage extends StatefulWidget {
  const PDMPPage({Key? key}) : super(key: key);

  @override
  State<PDMPPage> createState() => _PDMPPageState();
}

class _PDMPPageState extends State<PDMPPage> {
  Link? selectedLink;
  PDMP linkType = PDMP.select;
  late TextEditingController otherUrlController;
  String otherUrl = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    otherUrlController = TextEditingController();
    otherUrlController
      .addListener(() {
        otherUrl = otherUrlController.text;
      });
  }

  _launchPdmpSiteUrl(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget getSelection() {
    switch (linkType) {
      case PDMP.select:
        return Container();
      case PDMP.link:
        return button1(
            fn: () {
              _launchPdmpSiteUrl(selectedLink?.link ?? "");
            },
            text: "Open Link");
      case PDMP.other:
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: otherUrlController,
                decoration: InputDecoration(hintText: "Enter Other PDMP Url"),
              ),
              button1(
              fn: () {
                _launchPdmpSiteUrl(otherUrl ?? "");
              },
              text: "Open Link")
            ],
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Safe Opioid Prescribing')),
      drawer: Drawer1(),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Text("Select state for opioid prescription:",
                      style: regularText),
                  SizedBox(
                    height: 8,
                  ),
                  fluent.DropDownButton(
                      title: Text(selectedLink?.name ?? "Select"),
                      items: pdmpLinks
                          .map<fluent.MenuFlyoutItem>(
                              (e) => fluent.MenuFlyoutItem(
                                  text: Text(e.name),
                                  onPressed: () {
                                    setState(() {
                                      selectedLink = e;
                                      if (e.name.toLowerCase() == "select") {
                                        linkType = PDMP.select;
                                      } else if (e.name.toLowerCase() ==
                                          "other") {
                                        linkType = PDMP.other;
                                      } else {
                                        linkType = PDMP.link;
                                      }
                                    });
                                  }))
                          .toList()),
                ],
              ),
            ),
            midVSpacer,
            getSelection()
          ],
        ),
      ),
    );
  }
}
