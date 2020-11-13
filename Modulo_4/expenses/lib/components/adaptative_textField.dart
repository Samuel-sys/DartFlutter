import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'controler_platform.dart';

class AdaptativeTextFild extends StatelessWidget {
  final TextInputType keyboardType;
  final TextEditingController controller;
  final Function(String) onSubmitted;
  final String label;

  AdaptativeTextFild({
    this.keyboardType,
    this.controller,
    this.onSubmitted,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return ControlerPlatform.isIOS
        ? CupertinoTextField(
            keyboardType: this.keyboardType,
            onSubmitted: this.onSubmitted,
            controller: this.controller,
            placeholder: label,
          )
        : TextField(
            keyboardType: this.keyboardType,
            onSubmitted: this.onSubmitted,
            controller: this.controller,
            decoration: InputDecoration(
              labelText: this.label,
            ));
  }
}
