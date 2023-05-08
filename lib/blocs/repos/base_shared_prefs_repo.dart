import 'package:open_kansas/models/link_model.dart';
import 'package:open_kansas/ui/pages/pdmp_page.dart';

abstract class BaseSharedPrefsRepo {
  Future<bool> checkIfAcceptedAgreement();
  Future<void> acceptAgreement();
  Future<Link?> checkforPdmpLink();
  Future<void> saveLink({required Link link});
}
