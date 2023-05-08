import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:open_kansas/blocs/repos/shared_prefs_repo.dart';
import 'package:open_kansas/models/link_model.dart';
import 'package:open_kansas/ui/pages/pdmp_page.dart';

part 'pdmp_event.dart';
part 'pdmp_state.dart';

class PdmpBloc extends Bloc<PdmpEvent, PdmpState> {
  final repo = SharedPrefsRepo();
  PdmpBloc() : super(PdmpState.initial()) {
    on<PdmpEventLoadSelection>((event, emit) async {
      // TODO: implement event handler
      Link? link = await repo.checkforPdmpLink();
      print(link?.link);
      if (link != null)
        emit(state.copyWith(selectedLink: link, pdmpStatus: PdmpStatus.loaded));
      else
        emit(state.copyWith(pdmpStatus: PdmpStatus.loaded));
    });
    on<PdmpEventSaveSelection>((event, emit) async {
      await repo.saveLink(link: event.link);
    });
    on<PdmpEventMakeSelection>((event, emit) async {
      emit(state.copyWith(
          pdmpStatus: PdmpStatus.loaded, selectedLink: event.link));
    });
    on<PdmpEventSetOtherUrl>((event, emit) async {
      emit(state.copyWith(
        pdmpStatus: PdmpStatus.loading,
      ));
      Link? link = state.selectedLink;
      link?.link = event.url;
      print(link?.link);
      emit(state.copyWith(pdmpStatus: PdmpStatus.loaded, selectedLink: link));
    });
  }
}
