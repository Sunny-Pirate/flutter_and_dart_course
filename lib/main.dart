import 'package:flutter/material.dart';
import 'package:flutter_and_dart_course/screens/categories.dart';
import 'package:google_fonts/google_fonts.dart';

final appTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 131, 57, 0),
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme,
      // home: const MealsScreen(title: 'Some cat', meals: dummyMeals),
      home: const Scaffold(
        body: CategoriesScreen(),
      ),
    );
  }
}
