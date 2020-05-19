import 'package:app_qis/model/entity/level_vocabulary_jv.dart';
import 'package:app_qis/template/home_screen/widget/item_level.dart';
import 'package:flutter/material.dart';

class ListLevel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      shrinkWrap: true,
      itemCount: lstLevel.length,
      itemBuilder: (BuildContext context, int index) {
        LevelVocabulary level = lstLevel[index];
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: ItemLevel(
            name: level.name,
            urlImg: level.imgUrl,
            level: level.level,
          ),
        );
      },
    );
  }
}
