import 'package:covid19/global/backAppBar.dart';
import 'package:covid19/pages/tips/constants.dart';
import 'package:covid19/pages/tips/widgets/item.dart';
import 'package:covid19/pages/tips/widgets/list.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class TipsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BackAppBar(
          title: 'Dicas',
        ),
        body: Container(
            padding: EdgeInsets.only(top: 10),
            child: GestureDetector(
              child: FutureBuilder(
                future: DefaultAssetBundle.of(context)
                    .loadString(ConstantsTipsPage.jsonPath),
                builder: (context, snapshot) {
                  if (snapshot.hasError) print(snapshot.error);

                  List<TipItem> tips = parseTip(snapshot.data.toString());
                  tips.shuffle();

                  return tips.isNotEmpty
                      ? TipsList(tips: tips)
                      : Center(child: CircularProgressIndicator());
                },
              ),
            )));
  }
}

List<TipItem> parseTip(String responseBody) {
  final parsed = json.decode(responseBody.toString()).cast<String, dynamic>();
  return (parsed["dicas"] as List)
      .map<TipItem>((json) => TipItem.fromJson(json))
      .toList();
}
