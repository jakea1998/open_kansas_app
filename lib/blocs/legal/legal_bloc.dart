import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:open_kansas/blocs/repos/shared_prefs_repo.dart';

part 'legal_event.dart';
part 'legal_state.dart';

class LegalBloc extends Bloc<LegalEvent, LegalState> {
  SharedPrefsRepo sharedPrefsRepo = SharedPrefsRepo();
  LegalBloc() : super(LegalState.initial()) {
    on<LegalEventLoadLegal>((event, emit) async {
      // TODO: implement event handler
      emit(state.copyWith(status: LegalStatus.loading));
      final isAccepted = await sharedPrefsRepo.checkIfAcceptedAgreement();
      emit(state.copyWith(status: LegalStatus.loaded,acceptedAgreement: isAccepted));
    });
    on<LegalEventAcceptLegal>((event, emit) async{
      // TODO: implement event handler
      emit(state.copyWith(status: LegalStatus.loading));
      await sharedPrefsRepo.acceptAgreement();
      emit(state.copyWith(status: LegalStatus.loaded,acceptedAgreement: true));
    });
  }
}
