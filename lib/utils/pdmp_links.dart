import 'package:open_kansas/models/link_model.dart';
import 'package:open_kansas/ui/pages/pdmp_page.dart';

String ksKtracsPdmp = 'https://kansas.pmpaware.net/login';
String moPdmp = 'https://missouri.pmpaware.net/login';
String nePdmp = 'https://secure.cynchealth.org';
String coPdmp = 'https://colorado.pmpaware.net/login';

List<Link> pdmpLinks = [
  Link(name: "Select",link:"",linkType:PDMP.select,isLink: false),
  Link(name: "Kansas (KTracs)",link: ksKtracsPdmp,linkType: PDMP.link,isLink: true),
  Link(name: "Missouri",link: moPdmp,linkType: PDMP.link,isLink: true),
  Link(name: "Nebraska",link: nePdmp,linkType: PDMP.link,isLink: true),
  Link(name: "Colorado",link: coPdmp,linkType: PDMP.link,isLink: true),
  Link(name: "Other",link:"",linkType: PDMP.other,isLink: false),
];
