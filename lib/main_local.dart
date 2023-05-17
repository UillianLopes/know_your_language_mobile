import 'package:flutter/material.dart';
import 'package:know_your_language/src/know_your_language_app.dart';
import 'flavors.dart';

void main() {
  Flavors.appFlavor = Flavor.local;
  runApp(const KnowYourLanguageApp());
}
