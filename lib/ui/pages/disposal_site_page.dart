import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_kansas/ui/widgets/drawer.dart';
import 'package:open_kansas/utils/colors.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class DisposalSitePage extends StatefulWidget {
  const DisposalSitePage({Key? key}) : super(key: key);

  @override
  State<DisposalSitePage> createState() => _DisposalSitePageState();
}

class _DisposalSitePageState extends State<DisposalSitePage> {
  _launchDisposalSiteUrl() async {
    const disposal_site_url =
        'https://apps.deadiversion.usdoj.gov/pubdispsearch/spring/main?execution=e1s1';
    if (await canLaunchUrlString(disposal_site_url)) {
      await launchUrlString(disposal_site_url);
    } else {
      throw 'Could not launch $disposal_site_url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(appBarTheme: AppBarTheme(color: blueColor)),
      child: Scaffold(
        appBar: AppBar(title: Text('Safe Opioid Prescribing')),
        drawer: Drawer1(),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Center(
              child: GestureDetector(
            onTap: () {
              _launchDisposalSiteUrl();
            },
            child: Card(
              shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
              elevation: 4,
              clipBehavior: Clip.hardEdge,
              color: blueColor,
              child: Container(
                height: 40,
                width: 200,
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 20,
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      Text('Search Disposal Sites',
                          style: GoogleFonts.montserrat(color: Colors.white))
                    ],
                  ),
                )),
              ),
            ),
          )),
        ),
      ),
    );
  }
}
