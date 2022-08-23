import 'package:open_kansas/blocs/repos/base_shared_prefs_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsRepo extends BaseSharedPrefsRepo {
  SharedPreferences? prefs;
  @override
  Future<void> acceptAgreement() async {
    // TODO: implement acceptAgreement
    prefs = await SharedPreferences.getInstance();
    await prefs?.setBool("acceptedAgreement", true);
  }

  @override
  Future<bool> checkIfAcceptedAgreement() async {
    // TODO: implement checkIfAcceptedAgreement
    prefs = await SharedPreferences.getInstance();
    final accepted = prefs?.getBool("acceptedAgreement");
    if (accepted != null) {
      return accepted;
    }
    return false;
  }
}
