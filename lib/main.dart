import 'package:example/initial_main.dart';
import 'package:example/presentation/screens/home/home_page.dart';
import 'package:example/presentation/theme/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(InitialMain.initial(const App()));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme().lightTheme,
      home: const HomePage(),
    );
  }
}
