import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

/* 
 * Criado com a intenção de adaptar o Button conforme 
 * a plataforma do aparelho (Android\IOS)
 */

class AdaptativeButton extends StatelessWidget {
  final String label;
  final Function onPressed;

  AdaptativeButton({
    this.label,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            color: Theme.of(context).primaryColor,
            child: Text(this.label),
            onPressed: this.onPressed,
          )
        : RaisedButton(
            color: Theme.of(context).primaryColor,
            textColor: Theme.of(context).textTheme.button.color,
            child: Text(this.label),
            onPressed: this.onPressed,
          );
  }
}
