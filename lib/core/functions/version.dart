import 'package:package_info_plus/package_info_plus.dart';

class Info {
  Future<String> getAppVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version; // Returns only the version number
  }
}
