import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DrawerListWidget extends StatelessWidget {
  final String text;
  final VoidCallback onTapped;
  
   DrawerListWidget({Key? key,required this.text,
  required this.onTapped,}) : super(key: key);
   TextStyle style =
      GoogleFonts.montserrat(fontWeight: FontWeight.normal, color: Colors.white);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapped,
      child: Container(
                               // height: height,
    margin: EdgeInsets.only(
      //top: 4,bottom: 4,
      right:15,left: 15),
      padding: EdgeInsets.only(top: 4,bottom: 4),
                                child: Row(
                                  children: [
                                    Text(text, style: style),
                                    Spacer(flex: 1,),
                                    Icon(
                                    Icons.navigate_next,
                                    color: Colors.white,
                                    size: 25,
                                  ),
                                    
                                  ],
                                ),
                              ),
    );
  }
}
