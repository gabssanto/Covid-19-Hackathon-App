import 'package:covid19/pages/news/widgets/item.dart';
import 'package:flutter/material.dart';

class NewsList extends StatelessWidget {
  final List<NewsItem> news;

  NewsList({Key key, this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: news.length,
        itemBuilder: (context, index) {
          return NewsItem(
            author: news[index].author,
            title: news[index].title,
            description: news[index].description,
            url: news[index].url,
            urlToImage: news[index].urlToImage,
            publishedAt: news[index].publishedAt,
          );
        });
  }
}
