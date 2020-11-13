import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'controler_platform.dart';

class AdaptativeTextFild extends StatelessWidget {
  final TextInputType keyboardType;
  final TextEditingController controller;
  final Function(String) onSubmitted;
  final String label;

  AdaptativeTextFild({
    this.keyboardType = TextInputType.text,
    this.controller,
    this.onSubmitted,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return ControlerPlatform.isIOS
        ? Padding(
            padding: const EdgeInsets.only(
              bottom: 10,
            ),
            child: CupertinoTextField(
              keyboardType: this.keyboardType,
              onSubmitted: this.onSubmitted,
              controller: this.controller,
              placeholder: label,
              padding: EdgeInsets.symmetric(horizontal: 6, vertical: 12),
            ),
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
