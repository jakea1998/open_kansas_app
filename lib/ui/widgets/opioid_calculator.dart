import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluent_ui/fluent_ui.dart' as fluent;
import 'package:open_kansas/blocs/opioid_conversion_calculator/opioid_conversion_calculator_bloc.dart';
import 'package:open_kansas/models/opioid_model.dart';
import 'package:open_kansas/utils/fonts.dart';
import 'package:open_kansas/utils/opioid_conversion_rates.dart';

class OpioidCalculator extends StatefulWidget {
  const OpioidCalculator({Key? key}) : super(key: key);

  @override
  State<OpioidCalculator> createState() => _OpioidCalculatorState();
}

class _OpioidCalculatorState extends State<OpioidCalculator> {
  late TextEditingController inputTextFieldController;
  late TextEditingController outputTextFieldController;
  late TextEditingController mmeOutputTextFieldController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    inputTextFieldController = TextEditingController();
    inputTextFieldController.addListener(() {});
    outputTextFieldController = TextEditingController();
    mmeOutputTextFieldController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(left: 12, right: 12, top: 12),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: BlocConsumer<OpioidConversionCalculatorBloc,
              OpioidConversionCalculatorState>(
          listenWhen: ((previous, current) =>
              previous.output != current.output),
          listener: ((context, state) {
            outputTextFieldController.text = state.output.toString();
            mmeOutputTextFieldController.text = state.mmeOutput.toString();
          }),
          builder: (context, state) {
            return Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(8),
                  child:
                      Text("Opioid Conversion Calculator", style: headingFont),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: inputTextFieldController,
                          scrollPadding: EdgeInsets.zero,
                          decoration: InputDecoration(
                              isDense: true, hintText: "Input (mg)"),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      fluent.DropDownButton(
                        title: Text(state.selectedInput?.name ?? ""),
                        items: opioidTypes
                            .map<fluent.MenuFlyoutItem>(
                                (e) => fluent.MenuFlyoutItem(
                                    text: Text(e.name),
                                    onPressed: () {
                                      BlocProvider.of<
                                                  OpioidConversionCalculatorBloc>(
                                              context)
                                          .add(
                                              OpioidConversionCalculatorEventSelectInput(
                                                  newInput: e));
                                    }))
                            .toList(),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          readOnly: true,
                          controller: outputTextFieldController,
                          scrollPadding: EdgeInsets.zero,
                          decoration: InputDecoration(
                              isDense: true, hintText: "Output (mg)"),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      fluent.DropDownButton(
                        title: Text(state.selectedOutput?.name ?? ""),
                        items: opioidTypes
                            .map<fluent.MenuFlyoutItem>(
                                (e) => fluent.MenuFlyoutItem(
                                    text: Text(e.name),
                                    onPressed: () {
                                      BlocProvider.of<
                                                  OpioidConversionCalculatorBloc>(
                                              context)
                                          .add(
                                              OpioidConversionCalculatorEventSelectOutput(
                                                  newOutput: e));
                                      mmeOutputTextFieldController.text = "";
                                      outputTextFieldController.text = "";
                                    }))
                            .toList(),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                    onTap: () {
                      if (inputTextFieldController.text != "" &&
                          double.tryParse(inputTextFieldController.text) !=
                              null) {
                        BlocProvider.of<OpioidConversionCalculatorBloc>(context)
                            .add(OpioidConversionCalculatorEventCalculate(
                                input: double.tryParse(
                                        inputTextFieldController.text) ??
                                    0));
                      }
                    },
                    child: Card(
                      color: Colors.blue,
                      margin: EdgeInsets.only(
                          left: 12, right: 12, top: 16, bottom: 12),
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14)),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "Calculate Daily Dose",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          readOnly: true,
                          controller: mmeOutputTextFieldController,
                          scrollPadding: EdgeInsets.zero,
                          decoration: InputDecoration(
                              isDense: true, hintText: "MME Output (mg)"),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Morphine Milligram\nEquivalents",
                        style: subheadingFont,
                      )
                    ],
                  ),
                ),
              ],
            );
          }),
    );
  }
}
