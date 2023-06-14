import 'package:flutter/material.dart';
import 'package:flutter_bloc_example_3/src/app_strings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.appBarText),
      ),
      drawer: const Drawer(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) {
            return Card(
              child: Column(
                children: [
                  Icon(Icons.abc),
                  Text("Test"),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
