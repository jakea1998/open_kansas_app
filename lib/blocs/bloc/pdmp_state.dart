part of 'pdmp_bloc.dart';

abstract class PdmpState extends Equatable {
  const PdmpState();
  
  @override
  List<Object> get props => [];
}

class PdmpInitial extends PdmpState {}
