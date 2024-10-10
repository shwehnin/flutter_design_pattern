import 'package:flutter/material.dart';
import 'package:counter_app/platform_button.dart';
import 'package:counter_app/platform_indicator.dart';

abstract class AbstractFactory {
  Widget buildButton(BuildContext context, String text, VoidCallback onPressed);
  Widget buildIndicator(BuildContext context);
}

class AbstractFactoryImpl implements AbstractFactory {
  static AbstractFactoryImpl? _instance;
  AbstractFactoryImpl._internal() {
    print("HELLO");
  }

  static AbstractFactoryImpl get instance {
    _instance ??= AbstractFactoryImpl._internal();
    return _instance!;
  }

  @override
  Widget buildButton(
      BuildContext context, String text, VoidCallback onPressed) {
    return PlatformButton(Theme.of(context).platform).build(
      onPressed,
      Text(text),
    );
  }

  @override
  Widget buildIndicator(BuildContext context) {
    return PlatformIndicator(Theme.of(context).platform).build();
  }
}
