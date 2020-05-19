import 'package:flutter/material.dart';

class ItemLevel extends StatelessWidget {
  final String name;
  final String urlImg;
  final int level;

  const ItemLevel({Key key, this.name, this.urlImg, this.level})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {},
      child: Container(
          height: 250,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/img/level1.jpg"),
                fit: BoxFit.cover,
              ),
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
                        '$name $urlImg',
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
