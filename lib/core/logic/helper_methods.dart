import 'package:flutter/material.dart';
final navigatorKey = GlobalKey<NavigatorState>();

Future<void> navigateTo(Widget page)async
{
  Navigator.of(navigatorKey.currentContext!).push(MaterialPageRoute(
      builder: (context) => (page)));

}

bool password = false;
bool verifyPassword = false;
String? validatePasswordMatch(String value) {
  if (password != verifyPassword) {
    return 'Passwords do not match';
  }

  return null;
}
