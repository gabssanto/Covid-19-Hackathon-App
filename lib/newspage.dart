import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class NewsPageConstants {
  static String baseUrl = "https://newsapi.org/v2/";
  static String key = "fabb2c957786470e82d3576ffe748541";
}

class NewsPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Center(
            child: Text("Notícias", style: TextStyle(color: Colors.blue)),
          ),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: SafeArea(
          child: Column(children: <Widget>[
            Expanded(
                flex: 1,
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    child: GestureDetector(
                      child: FutureBuilder<List<News>>(
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

Future<List<News>> fetchHealthNews(http.Client client) async {
  final String url =
      "${NewsPageConstants.baseUrl}/top-headlines?apiKey=${NewsPageConstants.key}&category=health&country=br";
  final response = await client.get(url);
  return compute(parseNews, response.body);
}

List<News> parseNews(String responseBody) {
  final parsed = json.decode(responseBody);
  return (parsed['articles']).map<News>((json) => News.fromJson(json)).toList();
}

class News {
  final String author;
  final String title;
  final String description;
  final String url;

// se adicionar esses argumentos ele misteriosamente nao funciona
  final String urlToImage;
  final String publishedAt;
//  final String content;

  News({
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
//      this.content
  });

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      author: json['author'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      url: json['url'] as String,
      urlToImage: json['urlToImage'],
      publishedAt: json['publishedAt'],
//      content: json['content'] as String,
    );
  }
}

class NewsList extends StatelessWidget {
  final List<News> news;
  NewsList({Key key, this.news}) : super(key: key);

  _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url, forceWebView: true); //forceWebView
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: news.length,
        itemBuilder: (context, index) {
          return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Card(
                  margin: EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                  child: ListTile(
                    isThreeLine: true,
                    onTap: () async {
                      await _launchURL(news[index].url);
                    },
                    title: Container(
                      child: Text(
                        news[index].title,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    subtitle: Container(
                      child: Text(
                        news[index].description,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 4,
                      ),
                    ),
                    trailing: Column(children: <Widget>[
                      Container(
                          child: CircleAvatar(
                        radius: 20.0,
                        backgroundColor: Colors.transparent,
                        backgroundImage: NetworkImage(news[index].urlToImage),
                      )),
                      Text(
                        '${DateTime.now().difference(DateTime.parse(news[index].publishedAt)).inHours} horas atrás',
                        softWrap: true,
                        style: TextStyle(
                            fontSize: 9.0, fontWeight: FontWeight.bold),
                      ),
                    ]),
                  ),
                  elevation: 6,
                ),
              ]);
        });
  }
}
