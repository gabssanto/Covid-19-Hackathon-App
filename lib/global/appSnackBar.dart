import 'package:flutter/material.dart';

Widget _shouldAppearLoadingProgress(bool isLoading) {
  if (isLoading) {
    return Container(
      child: CircularProgressIndicator(),
      width: 15,
      height: 15,
    );
  } else {
    return Text('');
  }
}

SnackBar appSnackBar(String displayText, {bool isLoading = false}) {
  return SnackBar(
    duration: Duration(seconds: 5),
    content: Row(
      children: <Widget>[
        Text(displayText),
        _shouldAppearLoadingProgress(isLoading)
      ],
    ),
  );
}
