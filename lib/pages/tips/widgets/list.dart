import 'package:covid19/pages/tips/widgets/item.dart';
import 'package:flutter/material.dart';

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
