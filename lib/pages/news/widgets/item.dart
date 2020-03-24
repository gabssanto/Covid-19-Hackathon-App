import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsItem extends StatelessWidget {
  final String author;
  final String title;
  final String description;
  final String url;

// se adicionar esses argumentos ele misteriosamente nao funciona
  final String urlToImage;
  final String publishedAt;

//  final String content;

  NewsItem({
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
//      this.content
  });

  factory NewsItem.fromJson(Map<String, dynamic> json) {
    return NewsItem(
      author: json['author'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      url: json['url'] as String,
      urlToImage: json['urlToImage'],
      publishedAt: json['publishedAt'],
//      content: json['content'] as String,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Card(
            margin: EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
            child: ListTile(
              isThreeLine: true,
              onTap: () async {
                await _launchURL(url ??
                    'https://trends.google.com.br/trends/trendingsearches/daily?geo=BR');
              },
              title: Container(
                child: Text(
                  title ?? 'Sem título',
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      description ?? 'Sem descrição',
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Container(
                      child: Text(
                        'Há ${DateTime.now().difference(DateTime.parse(publishedAt)).inHours} horas',
                        softWrap: true,
                        style: TextStyle(
                            fontSize: 14.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
              trailing: Container(
                width: 60.0,
                height: 60.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(urlToImage ??
                          'http://www.miovitae.es/wp-content/uploads/2018/07/Noticias.png')),
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
              ),
            ),
            elevation: 0,
          ),
        ]);
  }

  _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url, forceWebView: true); //forceWebView
    } else {
      throw 'Could not launch $url';
    }
  }
}
