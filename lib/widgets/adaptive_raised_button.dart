import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveRaisedButton extends StatelessWidget {
  final String text;
  final Function handler;

  AdaptiveRaisedButton(this.text, this.handler);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            color: Theme.of(context).primaryColor,
            child: Text(
              text,
              style: TextStyle(color: Theme.of(context).textTheme.button.color),
            ),
            onPressed: handler,
          )
        : RaisedButton(
            color: Theme.of(context).primaryColor,
            child: Text(
              text,
              style: TextStyle(color: Theme.of(context).textTheme.button.color),
            ),
            onPressed: handler,
          );
  }
}
