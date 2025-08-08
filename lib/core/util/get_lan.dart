

import 'package:updent/core/util/strings_constant.dart';
import 'package:updent/main.dart';

String getCurrentLanguage() {
  final code = prefs.getString(LAGUAGE_CODE);
  if (code == null) {
    return 'en';
  }
  return code.toString();
}
