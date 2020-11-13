import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AdaptativeButton extends StatelessWidget {
  final String label;
  final Function onPressed;
  final bool isIOS;

  AdaptativeButton({this.label, this.onPressed, @required this.isIOS});

  @override
  Widget build(BuildContext context) {
    return isIOS
        ? CupertinoButton(
            color: Theme.of(context).primaryColor,
            child: Text(this.label),
            onPressed: this.onPressed,
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
          )
        : RaisedButton(
            color: Theme.of(context).primaryColor,
            textColor: Theme.of(context).textTheme.button.color,
            child: Text(this.label),
            onPressed: this.onPressed,
          );
  }
}
