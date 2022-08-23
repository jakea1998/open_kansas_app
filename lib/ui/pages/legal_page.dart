import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_kansas/blocs/legal/legal_bloc.dart';
import 'package:open_kansas/ui/pages/opioid_conversion_calculator_page.dart';
import 'package:open_kansas/ui/widgets/agree_checkbox.dart';
import 'package:open_kansas/utils/fonts.dart';
import 'package:open_kansas/utils/spacers.dart';

class LegalPage extends StatefulWidget {
  const LegalPage({Key? key}) : super(key: key);

  @override
  State<LegalPage> createState() => _LegalPageState();
}

class _LegalPageState extends State<LegalPage> {
  bool accepted = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Spacer(
              flex: 1,
            ),
            Column(children: [
              Text('Open Kansas',style: headerStyle.copyWith(fontSize: 28,color: Colors.blue),),
              midVSpacer,
              Text('Placeholder Logo'),
            ]),
            Spacer(
              flex: 1,
            ),
            Padding(padding: EdgeInsets.all(20),child: Text("This app is provided for informational purposes only.  The user of this app acknowledges that it is the sole responsibility of the prescribing physician and their clinical judgement to ensure safe and proper care of the patient.   Please delete this app if you do not acknowledge this disclaimer.  Any use of this app is understood to be an acknowledgement of indemnification of the owner/creator of the app."),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AgreeCheckBox(
                  callback: (value) {
                    setState(() {
                      accepted = value;
                    });
                  },
                ),
                SizedBox(width: 5,),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'I acknowledge.',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                )
              ],
            ),
            GestureDetector(
              onTap: accepted
                  ? () {
                      BlocProvider.of<LegalBloc>(context)
                          .add(LegalEventAcceptLegal());
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  OpioidConversionCalculatorPage()));
                    }
                  : null,
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                clipBehavior: Clip.hardEdge,
                color: accepted ? Colors.blue : Colors.grey[800],
                child: Container(
                  height: 50,
                  width: 200,
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  Text(
                    "Continue",
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                    size: 25,
                  )
                    ],
                  ),
                ),
              ),
              
            )
          ]),
        ),
      ),
    );
  }
}
