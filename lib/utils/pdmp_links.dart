import 'package:open_kansas/models/link_model.dart';

String ksKtracsPdmp = 'https://kansas.pmpaware.net/login';
String moPdmp = 'https://missouri.pmpaware.net/login';
String nePdmp = 'https://secure.cynchealth.org';
String coPdmp = 'https://colorado.pmpaware.net/login';

List<Link> pdmpLinks = [
  Link(name: "Select",link:"",isLink: false),
  Link(name: "Kansas (KTracs)",link: ksKtracsPdmp,isLink: true),
  Link(name: "Missouri",link: moPdmp,isLink: true),
  Link(name: "Nebraska",link: nePdmp,isLink: true),
  Link(name: "Colorado",link: coPdmp,isLink: true),
  Link(name: "Other",link:"",isLink: false),
];
