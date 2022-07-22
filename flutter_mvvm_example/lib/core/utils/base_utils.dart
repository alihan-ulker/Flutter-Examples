import 'package:flutter/material.dart';
import 'package:flutter_mvvm_example/core/shared/ui_text.dart';

Center buildErrorWidget() => Center(child: Text(UIText.error));

Center buildLoadingWidget() => const Center(child: CircularProgressIndicator());
