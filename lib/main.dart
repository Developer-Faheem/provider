import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider1/provider/count_provider.dart';
import 'package:provider1/provider/example_one_provider.dart';
import 'package:provider1/provider/faviourite_provider.dart';
import 'package:provider1/provider/theme_changer_provider.dart';
import 'package:provider1/screens/Example2.dart';
import 'package:provider1/screens/count_example.dart';
import 'package:provider1/screens/example_one.dart';
import 'package:provider1/screens/faviourite/dark_theme_screen.dart';
import 'package:provider1/screens/faviourite/faviourite_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CountProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ExampleOneProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => FaviouriteProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ThemeChangerProvider(),
        ),
      ],
      child: Builder(
        builder: (BuildContext context) {
          final themeChanger = Provider.of<ThemeChangerProvider>(context);

          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              brightness: Brightness.light,
              //customize the bright theme
              primarySwatch: Colors.red,
            ),
            themeMode: themeChanger.thememode,
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              //customize the dark theme
            ),
            home: const DarkThemeScreen(),
          );
        },
      ),
    );
  }
}

//for single provider
// return ChangeNotifierProvider(
// create: (_) => CountProvider(),
// child: MaterialApp(
// title: 'Flutter Demo',
// theme: ThemeData(
// primarySwatch: Colors.blue,
// ),
// home: const ExampleOneScreen(),
// ),
// );

//multiple provider without the theme changer//before the theme work
// @override
// Widget build(BuildContext context) {
//   return MultiProvider(
//     providers: [
//       ChangeNotifierProvider(
//         create: (_) => CountProvider(),
//       ),
//       ChangeNotifierProvider(
//         create: (_) => ExampleOneProvider(),
//       ),
//       ChangeNotifierProvider(
//         create: (_) => FaviouriteProvider(),
//       ),
//       ChangeNotifierProvider(
//         create: (_) => ThemeChangerProvider(),
//       ),
//     ],
//     child: MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const FaviouriteScreen(),
//     ),
//   );
// }
// }
