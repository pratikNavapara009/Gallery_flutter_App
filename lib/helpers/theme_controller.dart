import 'package:flutter/material.dart';
import 'package:gallery_app_1/models/modelpage.dart';

class ThemeProvider extends ChangeNotifier {
  Light light = Light(isDark: false);

  void changeTheme() {
    light.isDark = !light.isDark;
    notifyListeners();
  }
}
