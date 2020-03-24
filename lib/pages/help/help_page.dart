import 'dart:core';
import 'package:covid19/global/backAppBar.dart';
import 'package:covid19/pages/help/widgets/map.dart';
import 'package:flutter/material.dart';

class HelpPage extends StatefulWidget {
  @override
  _HelpPageState createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackAppBar(
        title: 'Ajuda',
      ),
      body: UBSMap(),
    );
  }
}
