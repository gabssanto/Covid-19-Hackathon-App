import 'dart:convert';

import 'package:covid19/global/backAppBar.dart';
import 'package:covid19/pages/news/constants.dart';
import 'package:covid19/pages/news/widgets/item.dart';
import 'package:covid19/pages/news/widgets/list.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<NewsItem>> fetchHealthNews(http.Client client) async {
  final String url =
      "${NewsPageConstants.baseUrl}/top-headlines?apiKey=${NewsPageConstants.key}&category=health&country=br";
  final response = await client.get(url);
  return compute(parseNews, response.body);
}

List<NewsItem> parseNews(String responseBody) {
  final parsed = json.decode(responseBody);
  return (parsed['articles'])
      .map<NewsItem>((json) => NewsItem.fromJson(json))
      .toList();
}

class NewsPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: BackAppBar(
          title: 'Notícias',
        ),
        body: Container(
          child: Column(children: <Widget>[
            Expanded(
                flex: 1,
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    child: GestureDetector(
                      child: FutureBuilder<List<NewsItem>>(
                        future: fetchHealthNews(http.Client()),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) print(snapshot.error);

                          return snapshot.hasData
                              ? NewsList(news: snapshot.data)
                              : Center(child: CircularProgressIndicator());
                        },
                      ),
                    )))
          ]),
        ));
  }
}
