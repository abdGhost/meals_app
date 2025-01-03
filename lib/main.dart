import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meal/screens/tabs_screen.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 131, 57, 0),
  ),
  textTheme: GoogleFonts.latoTextTheme().copyWith(
    bodyMedium: GoogleFonts.lato(fontSize: 16, fontWeight: FontWeight.w400),
    titleLarge: GoogleFonts.lato(fontSize: 20, fontWeight: FontWeight.bold),
  ),
);

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meal App', // Added a title for better clarity
      theme: theme,
      home: TabsScreen(),
    );
  }
}
