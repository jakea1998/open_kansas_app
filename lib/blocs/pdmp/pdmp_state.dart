part of 'pdmp_bloc.dart';

enum PdmpStatus { loading, loaded, initial, error }

class PdmpState extends Equatable {
  final PdmpStatus? pdmpStatus;
  final Link? selectedLink;
  
  const PdmpState({this.pdmpStatus, this.selectedLink,});
  factory PdmpState.initial() {
    return PdmpState(selectedLink: null, pdmpStatus: PdmpStatus.initial,);
  }
  PdmpState copyWith({PdmpStatus? pdmpStatus, Link? selectedLink,}) {
    return PdmpState(
        pdmpStatus: pdmpStatus ?? this.pdmpStatus,
        
        selectedLink: selectedLink ?? this.selectedLink);
  }

  @override
  List<Object?> get props => [pdmpStatus, selectedLink];
}
