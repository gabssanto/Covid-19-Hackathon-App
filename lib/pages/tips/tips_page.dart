import 'package:covid19/global/backAppBar.dart';
import 'package:covid19/pages/tips/constants.dart';
import 'package:covid19/pages/tips/widgets/item.dart';
import 'package:covid19/pages/tips/widgets/list.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class TipsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BackAppBar(
          title: 'Dicas',
        ),
        body: _body(context));
  }

  _body(BuildContext context) {
    return SafeArea(
      child: Container(
        child: GestureDetector(
          child: _buildTipsList(context),
        ),
      ),
    );
  }

  _buildTipsList(context) {
    return FutureBuilder<List<TipItem>>(
      future: fetchTips(context: context),
      builder: (context, snapshot) {
        if (snapshot.hasError) print(snapshot.error);

        return snapshot.hasData
            ? TipsList(tips: (() {
                snapshot.data.shuffle();
                return snapshot.data;
              })())
            : Center(child: CircularProgressIndicator());
      },
    );
  }
}

Future<List<TipItem>> fetchTips({BuildContext context}) async {
  String jsonString = await DefaultAssetBundle.of(context)
      .loadString(ConstantsTipsPage.jsonPath);
  return compute(parseTip, jsonString);
}

List<TipItem> parseTip(String responseBody) {
  final parsed = json.decode(responseBody);
  return (parsed["dicas"] as List)
      .map<TipItem>((json) => TipItem.fromJson(json))
      .toList();
}
