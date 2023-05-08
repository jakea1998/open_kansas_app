part of 'pdmp_bloc.dart';

abstract class PdmpEvent extends Equatable {
  const PdmpEvent();

  @override
  List<Object> get props => [];
}

class PdmpEventLoadSelection extends PdmpEvent {}

class PdmpEventSaveSelection extends PdmpEvent {
  final Link link;
  
  const PdmpEventSaveSelection({required this.link});

  @override
  List<Object> get props => [link];
}

class PdmpEventMakeSelection extends PdmpEvent {
  final Link link;
  
  const PdmpEventMakeSelection({required this.link});

  @override
  List<Object> get props => [link];
}
class PdmpEventSetOtherUrl extends PdmpEvent {
  final String url;
  
  const PdmpEventSetOtherUrl({required this.url});

  @override
  List<Object> get props => [url];
}