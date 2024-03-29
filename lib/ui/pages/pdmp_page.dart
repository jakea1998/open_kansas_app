import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_kansas/models/link_model.dart';
import 'package:open_kansas/ui/widgets/buttons.dart';
import 'package:open_kansas/ui/widgets/drawer.dart';
import 'package:open_kansas/utils/colors.dart';
import 'package:open_kansas/utils/fonts.dart';
import 'package:open_kansas/utils/pdmp_links.dart';
import 'package:fluent_ui/fluent_ui.dart' as fluent;
import 'package:open_kansas/utils/spacers.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../blocs/pdmp/pdmp_bloc.dart';

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
    if (BlocProvider.of<PdmpBloc>(context).state.selectedLink?.linkType ==
        PDMP.other) {
      otherUrlController.text =
          BlocProvider.of<PdmpBloc>(context).state.selectedLink?.link ?? "";
    }
    otherUrlController.addListener(() {
      //otherUrl = otherUrlController.text;
      //if (BlocProvider.of<PdmpBloc>(context).state.pdmpStatus == PDMP.other)
        BlocProvider.of<PdmpBloc>(context)
            .add(PdmpEventSetOtherUrl(url: otherUrlController.text));
    });
  }

  _launchPdmpSiteUrl(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget button2({required VoidCallback fn, required String text}) {
    return GestureDetector(
        onTap: fn,
        child: Container(
          width: 200,
          child: Card(
            color: blueColor,
            margin: EdgeInsets.only(top: 16, bottom: 12),
            elevation: 4,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  text,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ),
        ));
  }

  Widget getSelection(Link link1) {
    PDMP type = link1.linkType;
    switch (type) {
      case PDMP.select:
        return Container();
      case PDMP.link:
        return button2(
            fn: () {
              _launchPdmpSiteUrl(link1.link ?? "");
            },
            text: "Open Link");
      case PDMP.other:
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: otherUrlController,
                decoration: InputDecoration(hintText: "Enter Other PDMP URL"),
              ),
              button2(
                  fn: () {
                    _launchPdmpSiteUrl(link1.link ?? "");
                  },
                  text: "Open Link")
            ],
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(appBarTheme: AppBarTheme(color: blueColor)),
      child: Scaffold(
        appBar: AppBar(title: Text('Safe Opioid Prescribing')),
        drawer: Drawer1(),
        body: BlocBuilder<PdmpBloc, PdmpState>(
          builder: (context, state) {
            return Container(
              width: MediaQuery.of(context).size.width,
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
                            title: Text(state.selectedLink?.name ?? "Select"),
                            items: pdmpLinks
                                .map<fluent.MenuFlyoutItem>(
                                    (e) => fluent.MenuFlyoutItem(
                                        text: Text(e.name),
                                        onPressed: () {
                                          BlocProvider.of<PdmpBloc>(context)
                                              .add(PdmpEventMakeSelection(
                                            link: e,
                                          ));
                                          /* selectedLink = e;
                                            if (e?.name.toLowerCase() ==
                                                "select") {
                                              linkType = PDMP.select;
                                            } else if (e?.name.toLowerCase() ==
                                                "other") {
                                              linkType = PDMP.other;
                                            } else {
                                              linkType = PDMP.link;
                                            } */
                                        }))
                                .toList())
                      ],
                    ),
                  ),
                  midVSpacer,
                  getSelection(
                    state.selectedLink ??
                        Link(
                            isLink: false,
                            name: "",
                            link: otherUrlController.text,
                            linkType: PDMP.select),
                  ),
                  GestureDetector(
                      onTap: () {
                        if (selectedLink?.linkType != PDMP.select) {
                          if (selectedLink?.linkType == PDMP.other) {
                            BlocProvider.of<PdmpBloc>(context)
                                .add(PdmpEventSaveSelection(
                              link: state.selectedLink ??
                                  Link(
                                      isLink: false,
                                      name: "",
                                      link: otherUrlController.text,
                                      linkType: PDMP.select),
                            ));
                          } else {
                            BlocProvider.of<PdmpBloc>(context)
                                .add(PdmpEventSaveSelection(
                              link: state.selectedLink ??
                                  Link(
                                      isLink: false,
                                      name: "",
                                      link: "",
                                      linkType: PDMP.select),
                            ));
                          }
                        }
                      },
                      child: Container(
                        width: 200,
                        child: Card(
                          color: blueColor,
                          margin: EdgeInsets.only(top: 16, bottom: 12),
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14)),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                "Save",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                      )),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
