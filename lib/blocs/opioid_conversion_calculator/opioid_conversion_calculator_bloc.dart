import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:open_kansas/models/opioid_model.dart';
import 'package:open_kansas/utils/opioid_conversion_rates.dart';

part 'opioid_conversion_calculator_event.dart';
part 'opioid_conversion_calculator_state.dart';

class OpioidConversionCalculatorBloc extends Bloc<
    OpioidConversionCalculatorEvent, OpioidConversionCalculatorState> {
  OpioidConversionCalculatorBloc()
      : super(OpioidConversionCalculatorState.initial()) {
    on<OpioidConversionCalculatorEventSelectInput>((event, emit) {
      // TODO: implement event handler
      emit(state.copyWith(status: OpioidConversionCalculatorStatus.loading));
      emit(state.copyWith(
          status: OpioidConversionCalculatorStatus.loaded,
          selectedInput: event.newInput));
    });
    on<OpioidConversionCalculatorEventSelectOutput>((event, emit) {
      // TODO: implement event handler
      emit(state.copyWith(status: OpioidConversionCalculatorStatus.loading));
      emit(state.copyWith(
          status: OpioidConversionCalculatorStatus.loaded,
          selectedOutput: event.newOutput));
    });
    on<OpioidConversionCalculatorEventCalculate>((event, emit) {
      // TODO: implement event handler
      emit(state.copyWith(status: OpioidConversionCalculatorStatus.loading));
      final multiplier = conversionTable[state.selectedInput?.value ?? 0]
          [state.selectedOutput?.value ?? 0];
      final mmeMultiplier = conversionTable[state.selectedInput?.value ?? 0][2];
      final mmeOutput = event.input * mmeMultiplier;
      final output = event.input * multiplier;
      emit(state.copyWith(
          status: OpioidConversionCalculatorStatus.loaded, output: output,mmeOutput: mmeOutput));
    });
  }
}
