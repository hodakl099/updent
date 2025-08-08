import 'package:flutter/material.dart';
import 'package:updent/l10n/app_localizations.dart';

// Helper function to get localized strings
String getLocalized(BuildContext context, String key,
    [Map<String, String>? args]) {
  final localizations = AppLocalizations.of(context)!;

  final localizedMap = {
    'appTitle': localizations.appTitle
  };

  return localizedMap[key] ?? key;
}

/// Removes the leading '+' from a phone number if present.
String removePlusFromPhone(String phone) {
  if (phone.startsWith('+')) {
    return phone.substring(1);
  }
  return phone;
}
