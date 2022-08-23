import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fluent_ui/fluent_ui.dart' as fluent;
import 'package:open_kansas/blocs/legal/legal_bloc.dart';
import 'package:open_kansas/ui/pages/legal_page.dart';
import 'package:open_kansas/ui/pages/opioid_conversion_calculator_page.dart';
import 'blocs/opioid_conversion_calculator/opioid_conversion_calculator_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  Widget getInitialPage(BuildContext context) {
    final accepted =
        BlocProvider.of<LegalBloc>(context).state.acceptedAgreement;
    print('accepted:$accepted');
    if (accepted != null && accepted != true) {
      return LegalPage();
    } else
      return OpioidConversionCalculatorPage();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<OpioidConversionCalculatorBloc>(
          create: (context) => OpioidConversionCalculatorBloc(),
        ),
        BlocProvider<LegalBloc>(
          lazy: false,
          create: (context) => LegalBloc()..add(LegalEventLoadLegal()),
        )
      ],
      child: fluent.FluentApp(
          title: 'Open Kansas',
          debugShowCheckedModeBanner: false,
          home: Home()),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget getInitialPage(BuildContext context) {
    final accepted =
        BlocProvider.of<LegalBloc>(context).state.acceptedAgreement;
    print('accepted:$accepted');
    if (accepted != null && accepted != true) {
      return LegalPage();
    } else
      return OpioidConversionCalculatorPage();
  }

  @override
  Widget build(BuildContext context) {
    return getInitialPage(context);
  }
}
