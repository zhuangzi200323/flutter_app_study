import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:flutter/material.dart';

class ViewOptionBottom extends StatelessWidget {
  final int id;
  final int praiseCount;

  ViewOptionBottom({Key? key, this.id = 0, this.praiseCount = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Icon(Icons.favorite_border, color: Colors.white, size: 20),
      Text('$praiseCount赞',
          style: TextStyle(color: Colors.white, fontSize: 13)),
      Spacer(),
      Icon(Feather.share, color: Colors.white, size: 20)
    ]);
  }
}
