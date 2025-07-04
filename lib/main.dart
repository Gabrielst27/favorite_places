import 'package:favorite_places/screens/places_screen.dart';
import 'package:favorite_places/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: const App()));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Melhores Lugares',
      theme: theme,
      home: PlacesScreen(),
    );
  }
}
