import 'package:flutter/material.dart';

class AssetPage extends StatelessWidget {
  const AssetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Asset Page"),
      ),
      body: const Center(
        child: Text("This is the Asset Page"),
      ),
    );
  }
}
