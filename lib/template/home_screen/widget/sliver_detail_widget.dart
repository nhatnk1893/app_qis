import 'package:flutter/material.dart';

class SliverDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 5),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Text('LIVE TRADING'),
            ),
            Container(child: Text('data'))
          ]),
    );
  }
}
