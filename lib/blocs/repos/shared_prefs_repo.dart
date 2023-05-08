import 'package:open_kansas/blocs/repos/base_shared_prefs_repo.dart';
import 'package:open_kansas/models/link_model.dart';
import 'package:open_kansas/ui/pages/pdmp_page.dart';
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

  @override
  Future<Link?> checkforPdmpLink() async {
    // TODO: implement checkforPdmpLink
    prefs = await SharedPreferences.getInstance();
    if (prefs?.containsKey("PdmpLinkExists") == false) {
      await prefs?.setString("name", "");
      await prefs?.setString("link", "");
      await prefs?.setBool("islink", false);
      await prefs?.setString("linkType", "Select");
      await prefs?.setBool("PdmpLinkExists", true);
      return null;
    } else {
      final name = prefs?.getString("name");
      final link = prefs?.getString("link");
      final isLink = prefs?.getBool("islink");
      final linkType = prefs?.getString("linkType");
      PDMP? link1 = PDMP.select;
      switch (linkType) {
        case "Select":
          link1 = PDMP.select;
          break;
        case "Link":
          link1 = PDMP.link;
          break;
        case "Other":
          link1 = PDMP.other;
          break;
      }

      return Link(
          name: name ?? "",
          link: link ?? "",
          linkType: link1,
          isLink: isLink ?? false);
    }
  }

  @override
  Future<void> saveLink({required Link link}) async {
    // TODO: implement saveLink
    await prefs?.setString("name", link.name);
    await prefs?.setString("link", link.link);
    await prefs?.setBool("islink", link.isLink);
    switch (link.linkType) {
      case PDMP.other:
        await prefs?.setString("linkType", "Other");
        break;
       case PDMP.select:
        await prefs?.setString("linkType", "Select");
        break;
      case PDMP.link:
        await prefs?.setString("linkType", "Link");
        break;
    }
    await prefs?.setBool("PdmpLinkExists", true);
  }
}
