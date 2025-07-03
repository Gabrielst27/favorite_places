import 'package:favorite_places/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Melhores Lugares',
      theme: theme,
      home: const Placeholder(),
    );
  }
}
