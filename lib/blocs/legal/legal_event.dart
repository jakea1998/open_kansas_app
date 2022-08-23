part of 'legal_bloc.dart';

abstract class LegalEvent extends Equatable {
  const LegalEvent();

  @override
  List<Object> get props => [];
}

class LegalEventLoadLegal extends LegalEvent {}

class LegalEventAcceptLegal extends LegalEvent {}
