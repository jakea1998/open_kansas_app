part of 'opioid_conversion_calculator_bloc.dart';

enum OpioidConversionCalculatorStatus { initial, loading, loaded, error }

class OpioidConversionCalculatorState extends Equatable {
  final OpioidConversionCalculatorStatus? status;
  final OpioidType? selectedInput;
  final OpioidType? selectedOutput;

  final double? output;
  final double? mmeOutput;
  OpioidConversionCalculatorState(
      {this.status, this.selectedInput, this.selectedOutput, this.output,this.mmeOutput});
  factory OpioidConversionCalculatorState.initial() {
    return OpioidConversionCalculatorState(
        output: 0.0,
        mmeOutput: 0.0,
        selectedInput: OpioidType(name: "Oxycodone", value: 0),
        selectedOutput: OpioidType(name: "Morphine (Oral)", value: 2),
        status: OpioidConversionCalculatorStatus.initial);
  }
  OpioidConversionCalculatorState copyWith(
      {OpioidConversionCalculatorStatus? status,
      OpioidType? selectedInput,
      OpioidType? selectedOutput,
      double? mmeOutput,
      double? output}) {
    return OpioidConversionCalculatorState(
        output: output ?? this.output,
        mmeOutput: mmeOutput ?? this.mmeOutput,
        selectedInput: selectedInput ?? this.selectedInput,
        selectedOutput: selectedOutput ?? this.selectedOutput,
        status: status ?? this.status);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [status, selectedInput, mmeOutput, selectedOutput, output];
}
