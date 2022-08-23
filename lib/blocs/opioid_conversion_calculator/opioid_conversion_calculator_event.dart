part of 'opioid_conversion_calculator_bloc.dart';

@immutable
abstract class OpioidConversionCalculatorEvent extends Equatable {}

class OpioidConversionCalculatorEventSelectInput
    extends OpioidConversionCalculatorEvent {
  final OpioidType newInput;
  OpioidConversionCalculatorEventSelectInput({required this.newInput});
  @override
  // TODO: implement props
  List<Object?> get props => [newInput];
}

class OpioidConversionCalculatorEventSelectOutput
    extends OpioidConversionCalculatorEvent {
  final OpioidType newOutput;
  OpioidConversionCalculatorEventSelectOutput({required this.newOutput});
  @override
  // TODO: implement props
  List<Object?> get props => [newOutput];
}

class OpioidConversionCalculatorEventCalculate
    extends OpioidConversionCalculatorEvent {
  final double input;
  OpioidConversionCalculatorEventCalculate({required this.input});
  @override
  // TODO: implement props
  List<Object?> get props => [input];
}
