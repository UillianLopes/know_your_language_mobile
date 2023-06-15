import 'package:flutter/material.dart';

extension ColorShemeExtension on ColorScheme {
  Color get success {
    return const Color.fromARGB(255, 75, 181, 67);
  }

  Color get successContainer {
    return const Color.fromARGB(255, 75, 181, 67).withOpacity(0.2);
  }

  Color get onSuccess {
    return Colors.white;
  }
}
