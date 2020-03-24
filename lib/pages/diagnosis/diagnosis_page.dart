import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:covid19/global/backAppBar.dart';
import 'package:covid19/pages/diagnosis/constants.dart';
import 'package:covid19/pages/diagnosis/widgets/item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DiagnosisPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackAppBar(
        title: "Diagnósticos",
      ),
      body: Container(
        alignment: Alignment.center,
        child: FutureBuilder<List<DiagnosisItem>>(
            future: fetchDiagnosis(context: context),
            builder: (context, snapshot) {
              if (snapshot.hasError) print(snapshot.error);

              return snapshot.hasData
                  ? CarouselSlider(
                      height: MediaQuery.of(context).size.height / 1.3,
                      items: (() {
                        snapshot.data.sort((a, b) => DateTime.parse(a.date)
                            .compareTo(DateTime.parse(b.date)));

                        return snapshot.data;
                      })())
                  : Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }
}

Future<List<DiagnosisItem>> fetchDiagnosis({BuildContext context}) async {
  String jsonString = await DefaultAssetBundle.of(context)
      .loadString(ConstantsDiagnosisPage.jsonPath);
  return compute(parseDiagnosis, jsonString);
}

List<DiagnosisItem> parseDiagnosis(String responseBody) {
  final parsed = json.decode(responseBody);
  return (parsed["diagnosticos"] as List)
      .map<DiagnosisItem>((json) => DiagnosisItem.fromJson(json))
      .toList();
}
