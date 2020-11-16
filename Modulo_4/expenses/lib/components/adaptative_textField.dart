import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AdaptativeTextFild extends StatelessWidget {
  final TextInputType keyboardType;
  final TextEditingController controller;
  final Function(String) onSubmitted;
  final String label;
  final bool isIOS;
  final bool autoFocus;

  const AdaptativeTextFild({
    @required this.isIOS,
    this.keyboardType = TextInputType.text,
    this.controller,
    this.onSubmitted,
    this.label,
    this.autoFocus = false,
  });

  @override
  Widget build(BuildContext context) {
    return isIOS
        ? Padding(
            padding: const EdgeInsets.only(
              bottom: 10,
            ),
            child: CupertinoTextField(
              keyboardType: this.keyboardType,
              onSubmitted: this.onSubmitted,
              controller: this.controller,
              placeholder: this.label,
              autofocus: this.autoFocus,
              padding: EdgeInsets.symmetric(horizontal: 6, vertical: 12),
            ),
          )
        : TextField(
            keyboardType: this.keyboardType,
            onSubmitted: this.onSubmitted,
            controller: this.controller,
            autofocus: this.autoFocus,
            decoration: InputDecoration(
              labelText: this.label,
            ));
  }
}
