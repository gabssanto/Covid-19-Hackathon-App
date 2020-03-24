import 'package:flutter/material.dart';

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
