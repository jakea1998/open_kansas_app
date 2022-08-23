abstract class BaseSharedPrefsRepo {
  Future<bool> checkIfAcceptedAgreement();
  Future<void> acceptAgreement();
}
