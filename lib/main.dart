import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fluent_ui/fluent_ui.dart' as fluent;
import 'package:open_kansas/blocs/legal/legal_bloc.dart';
import 'package:open_kansas/blocs/pdmp/pdmp_bloc.dart';
import 'package:open_kansas/ui/pages/disposal_site_page.dart';
import 'package:open_kansas/ui/pages/legal_page.dart';
import 'package:open_kansas/ui/pages/opioid_conversion_calculator_page.dart';
import 'package:open_kansas/utils/colors.dart';
import 'blocs/opioid_conversion_calculator/opioid_conversion_calculator_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  /* Widget getInitialPage(BuildContext context) {
    final accepted =
        BlocProvider.of<LegalBloc>(context).state.acceptedAgreement;
    print('accepted:$accepted');
    if (accepted != null && accepted != true) {
      return SplashScreen(widget:LegalPage());
    } else
      return SplashScreen(widget:OpioidConversionCalculatorPage());
  } */

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<OpioidConversionCalculatorBloc>(
          create: (context) => OpioidConversionCalculatorBloc(),
        ),
         BlocProvider<PdmpBloc>(
          lazy: false,
          create: (context) => PdmpBloc()..add(PdmpEventLoadSelection()),
        ),
        BlocProvider<LegalBloc>(
          lazy: true,
          create: (context) => LegalBloc()..add(LegalEventLoadLegal()),
        )
      ],
      child: fluent.FluentApp(
          
          title: 'Open Kansas',
          debugShowCheckedModeBanner: false,
          home: Theme(
            data: ThemeData(appBarTheme: AppBarTheme(color: blueColor)),
            child: Home())),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<Widget> getInitialPage(BuildContext context) async {
    await BlocProvider.of<LegalBloc>(context).stream.first;
    print(BlocProvider.of<LegalBloc>(context).state.status);
    print(BlocProvider.of<LegalBloc>(context).state.acceptedAgreement);
    final accepted =
        BlocProvider.of<LegalBloc>(context).state.acceptedAgreement;
    print('accepted:$accepted');
    if (accepted != null && accepted != true) {
      return SplashScreen(widget: LegalPage());
    } else
      return SplashScreen(widget: DisposalSitePage());
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Widget>(
        future: getInitialPage(context),
        builder: (context, snapshot) {
          if (snapshot.hasData)
            return snapshot.data ?? Container();
          else
            return Container();
        });
  }
}

class SplashScreen extends StatefulWidget {
  final Widget widget;

  SplashScreen({required this.widget});
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(
        Duration(seconds: 2),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => widget.widget)));
  }

  @override
  Widget build(BuildContext context) {
    // ScreenSize.height = MediaQuery.of(context).size.height;
    // ScreenSize.width = MediaQuery.of(context).size.width;
    return Material(
      child: Container(
        color: blueColor,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Spacer(
                    flex: 1,
                  ),
                  Center(
                    child: Image.asset('lib/assets/general/OpenKSLogo.png',
                        width: 200, fit: BoxFit.fitWidth),
                  ),
                  Spacer(
                    flex: 1,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
