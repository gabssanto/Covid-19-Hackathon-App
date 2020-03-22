import 'package:covid19/global/backAppBar.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/foundation.dart';

class ConstantsTipsPage {
  static final String jsonPath = 'assets/dicas.json';
}

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
                  List<TipItem> tips = parseTip(snapshot.data.toString());

                  if (snapshot.hasError) print(snapshot.error);

                  return tips.isNotEmpty
                      ? TipsList(tips: tips)
                      : Center(child: CircularProgressIndicator());
                },
              ),
            )));
  }
}

class TipsList extends StatelessWidget {
  final List<TipItem> tips;

  TipsList({Key key, this.tips}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 5.0,
        mainAxisSpacing: 15.0,
      ),
      itemCount: tips.length,
      itemBuilder: (context, index) {
        return Container(
            child: TipItem(
          title: tips[index].title,
          description: tips[index].description,
        ));
      },
    );
  }
}

List<TipItem> parseTip(String responseBody) {
  final parsed = json.decode(responseBody.toString()).cast<String, dynamic>();
  return (parsed["dicas"] as List)
      .map<TipItem>((json) => TipItem.fromJson(json))
      .toList();
}

class TipItem extends StatelessWidget {
  final String title;
  final String description;
  final String image;

  TipItem({this.title, this.description, this.image});

  factory TipItem.fromJson(Map<String, dynamic> json) {
    return TipItem(
      title: json['title'],
      description: json['description'],
      image: json['image'],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(left: 5.0, right: 5.0),
      height: 190,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: <Widget>[
          SizedBox(
              height: 80.0,
              width: MediaQuery.of(context).size.width / 3.7,
              child: Container(
                transform: Matrix4.translationValues(0.0, 10.0, 0.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.transparent,
                ),
                child: LayoutBuilder(builder: (context, constraint) {
                  return Icon(
                    Icons.help,
                    size: constraint.biggest.height,
                  );
                }),
              )),
          Container(
            padding: EdgeInsets.only(top: 10),
            child: ListTile(
              title: Text(
                title,
                style: TextStyle(
                    color: const Color(0xff040b0f),
                    fontWeight: FontWeight.w900,
                    fontFamily: "Montserrat",
                    fontStyle: FontStyle.normal,
                    fontSize: 14),
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                maxLines: 2,
              ),
              subtitle: Text(
                description,
                style: TextStyle(
                  color: const Color(0xff040b0f),
                  fontWeight: FontWeight.w500,
                  fontFamily: "Montserrat",
                  fontStyle: FontStyle.normal,
                  fontSize: 12,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 5,
                softWrap: true,
                textAlign: TextAlign.left,
              ),
            ),
          )
        ],
      ),
    );
  }
}
