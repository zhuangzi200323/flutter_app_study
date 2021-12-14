import 'package:flutter/material.dart';

import '../../page_index.dart';

class StarRate extends StatelessWidget {
  final double rating;
  final int starCount;
  final double rate;
  final Color starColor;
  final double width;

  StarRate(
      {Key? key,
      this.rating = 0.0,
      this.starCount = 0,
      this.rate = 0.0,
      this.starColor: Colors.blueGrey,
      this.width: 100})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SmoothStarRating(
            rating: rating, starCount: starCount, size: 12, color: starColor),
        Gaps.hGap8,
        Container(
          width: width,
          child: LinearProgressIndicator(
              backgroundColor: Colors.grey,
              value: rate,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.red)),
        )
      ],
      mainAxisAlignment: MainAxisAlignment.end,
    );
  }
}
