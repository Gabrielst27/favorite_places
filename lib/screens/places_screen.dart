import 'package:flutter/material.dart';

class PlacesScreen extends StatelessWidget {
  const PlacesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Seus Lugares',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        backgroundColor: Theme.of(context).colorScheme.onSurface,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add),
            color: Theme.of(context).colorScheme.surfaceBright,
          ),
        ],
      ),
      body: const Placeholder(),
    );
  }
}
