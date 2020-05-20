import 'package:app_qis/template/detail_screen/detail_screen.dart';
import 'package:app_qis/template/home_screen/home_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class ItemLevel extends StatelessWidget {
  final String name;
  final String urlImg;
  final int level;

  const ItemLevel({Key key, this.name, this.urlImg, this.level})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Provider.of<HomeScreenProvider>(context, listen: false)
            .fetchData(level);
        Navigator.push(
          context,
          PageTransition(
              type: PageTransitionType.rightToLeft, child: DetailScreen()),
        );
      },
      child: Container(
          height: 60,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.blue[200], width: 1.0)),
          child: new Material(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.blue[400],
                    ),
                    SizedBox(
                      width: 32,
                    ),
                    Expanded(
                        child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '$name',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.blue[300]),
                      ),
                    ))
                  ],
                )),
          )),
    );
  }
}
