import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/theme_changer_provider.dart';

class DarkThemeScreen extends StatefulWidget {
  const DarkThemeScreen({Key? key}) : super(key: key);

  @override
  State<DarkThemeScreen> createState() => _DarkThemeScreenState();
}

class _DarkThemeScreenState extends State<DarkThemeScreen> {
  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChangerProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('theme changer'),
      ),
      body: Column(
        children: [
          RadioListTile<ThemeMode>(
            title: Text('light mode'),
            value: ThemeMode.light,
            groupValue: themeChanger.thememode,
            onChanged: themeChanger.setTheme,
          ),
          RadioListTile<ThemeMode>(
            title: Text('dark mode'),
            value: ThemeMode.dark,
            groupValue: themeChanger.thememode,
            onChanged: themeChanger.setTheme,
          ),
          RadioListTile<ThemeMode>(
            title: Text('system mode'),
            value: ThemeMode.system,
            groupValue: themeChanger.thememode,
            onChanged: themeChanger.setTheme,
          )
        ],
      ),
    );
  }
}
