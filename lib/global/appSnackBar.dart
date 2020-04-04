import 'package:flutter/material.dart';

SnackBar loadingSnackBar(String displayText) {
  return SnackBar(
    content: Row(
      children: <Widget>[
        Text(displayText),
        Container(
          child: CircularProgressIndicator(),
          width: 15,
          height: 15,
        )
      ],
    ),
  );
}
