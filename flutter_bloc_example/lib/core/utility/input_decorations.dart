import 'package:flutter/material.dart';

//input decoration kismini bir kere tanimladik
//login view de kullanildi
class ProjectInputs extends InputDecoration {
  const ProjectInputs(String title)
      : super(
          border: const OutlineInputBorder(),
          labelText: title,
          focusColor: Colors.red,
        );
}
