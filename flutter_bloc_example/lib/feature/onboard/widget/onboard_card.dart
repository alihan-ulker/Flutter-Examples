import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/feature/onboard/on_board_model.dart';

//onboard card ile modelden uretilen title, description, imageWithPath degerleri alindi
//alinan degerler onboard view de PageView.builder icinde gosterildi.

class OnboardCard extends StatelessWidget {
  const OnboardCard({Key? key, required this.model}) : super(key: key);

  final OnBoardModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          model.title,
          style: Theme.of(context).textTheme.headline4,
        ),
        Text(model.description),
        Image.asset(model.imageWithPath),
      ],
    );
  }
}
