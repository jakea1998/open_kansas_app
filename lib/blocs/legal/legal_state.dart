part of 'legal_bloc.dart';

enum LegalStatus { initial, loading, loaded, error }

class LegalState extends Equatable {
  final LegalStatus? status;
  final bool? acceptedAgreement;
  LegalState({this.status, this.acceptedAgreement});
  factory LegalState.initial() {
    return LegalState(status: LegalStatus.initial, acceptedAgreement: false);
  }
  LegalState copyWith({LegalStatus? status, bool? acceptedAgreement}) {
    return LegalState(
        status: status ?? this.status,
        acceptedAgreement: acceptedAgreement ?? this.acceptedAgreement);
  }

  @override
  List<Object?> get props => [status, acceptedAgreement];
}
