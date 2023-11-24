import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeChanger with ChangeNotifier {
  ThemeData _themeData;

  ThemeChanger(this._themeData);

  ThemeData getTheme() => _themeData;

  void setTheme(ThemeData theme) {
    _themeData = theme;
    notifyListeners(); // Notify listeners for the change
  }
}


// Example of changing to a dark theme
void changeToDarkTheme(BuildContext context) {
  final theme = ThemeData.dark().copyWith(
    appBarTheme: ThemeData.dark().appBarTheme.copyWith(
      color: Colors.black, // Change the app bar color
    ),
  );

  Provider.of<ThemeChanger>(context, listen: false).setTheme(theme);
}

// Example of changing to a light theme
void changeToLightTheme(BuildContext context) {
  final theme = _buildLightTheme(); // Function to create a light theme
  Provider.of<ThemeChanger>(context, listen: false).setTheme(theme);
}


ThemeData _buildLightTheme() {
  return ThemeData.light().copyWith(
    appBarTheme: ThemeData.light().appBarTheme.copyWith(
      color: Colors.blue, // Set the default app bar color
    ),
    // Define other properties of the light theme
  );
}

