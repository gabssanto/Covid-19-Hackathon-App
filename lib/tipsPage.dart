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
                  // só pra nao ser tao estatico
                  tips.shuffle();
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
          image: tips[index].image,
          url: tips[index].url,
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
  final String url;

  TipItem({this.title, this.description, this.image, this.url});

  factory TipItem.fromJson(Map<String, dynamic> json) {
    return TipItem(
      title: json['title'] as String,
      description: json['description'] as String,
      image: json['image'] as String,
      url: json['url'] as String,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(left: 5.0, right: 5.0),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: <Widget>[
          SizedBox(
              height: 75.0,
              width: MediaQuery.of(context).size.width / 3.7,
              child: Container(
                transform: Matrix4.translationValues(0.0, 10.0, 0.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.transparent,
                ),
                child: LayoutBuilder(builder: (context, constraint) {
                  return Container(
                    width: 60.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: (() {
                            return image != null
                                ? AssetImage(image)
                                : NetworkImage(
                                    'https://bloximages.newyork1.vip.townnews.com/wfsb.com/content/tncms/assets/v3/editorial/7/e5/7e5f698a-63b6-11ea-8771-d3793e20699a/5e69139c582eb.image.jpg');
                          })()),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
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
                textAlign: TextAlign.center,
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
