import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'pdmp_event.dart';
part 'pdmp_state.dart';

class PdmpBloc extends Bloc<PdmpEvent, PdmpState> {
  PdmpBloc() : super(PdmpInitial()) {
    on<PdmpEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
