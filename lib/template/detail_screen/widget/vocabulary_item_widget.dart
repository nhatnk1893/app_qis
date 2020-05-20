import 'package:app_qis/model/entity/vocabulary_jv.dart';
import 'package:flutter/material.dart';

class VocabularyItem extends StatelessWidget {
  final Vocabulary vocabularyItem;

  const VocabularyItem({Key key, this.vocabularyItem}) : super(key: key);

  String drawedVocabulary() {
    return vocabularyItem.hiragana != null
        ? vocabularyItem.hiragana
        : vocabularyItem.word;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
          height: 250,
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
                        '$drawedVocabulary',
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
