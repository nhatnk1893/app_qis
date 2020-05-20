import 'package:app_qis/model/entity/vocabulary_jv.dart';
import 'package:app_qis/template/detail_screen/widget/vocabulary_item_widget.dart';
import 'package:flutter/material.dart';

class VocabularyTab extends StatelessWidget {
  final vocabulary;

  const VocabularyTab({Key key, this.vocabulary}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      child: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        shrinkWrap: true,
        itemCount: vocabulary.length,
        itemBuilder: (BuildContext context, int index) {
          Vocabulary _vocabulary = vocabulary[index];
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: VocabularyItem(vocabularyItem: _vocabulary),
          );
        },
      ),
    );
  }
}
