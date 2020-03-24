import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:covid19/global/backAppBar.dart';
import 'package:covid19/pages/diagnosis/constants.dart';
import 'package:covid19/pages/diagnosis/widgets/item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<DiagnosisItem>> fetchDiagnosis(http.Client client) async {
  final response = await client.get('https://google.com');
  return compute(parseDiagnosis, response.body);
}

List<DiagnosisItem> parseDiagnosis(String responseBody) {
  final parsed = json.decode(responseBody.toString()).cast<String, dynamic>();
  return (parsed["diagnosticos"] as List)
      .map<DiagnosisItem>((json) => DiagnosisItem.fromJson(json))
      .toList();
}

class DiagnosisPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackAppBar(
        title: "Diagnósticos",
      ),
      body: Container(
        alignment: Alignment.center,
        child: FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString(ConstantsDiagnosisPage.jsonPath),
            // http
            // fetchDiagnosis(http.Client()),
            builder: (context, snapshot) {
              if (snapshot.hasError) print(snapshot.error);

              List<DiagnosisItem> diags =
                  parseDiagnosis(snapshot.data.toString());
              diags.sort((a, b) =>
                  DateTime.parse(a.date).compareTo(DateTime.parse(b.date)));

              return diags.isNotEmpty
                  ? CarouselSlider(
                      height: MediaQuery.of(context).size.height / 1.3,
                      items: diags)
                  : Center(child: CircularProgressIndicator());

              // http
              // if (snapshot.hasError) print(snapshot.error);

              // return snapshot.hasData
              //     ? CarouselSlider(
              //         height: MediaQuery.of(context).size.height / 1.3,
              //         items: snapshot.data)
              //     : Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }
}
