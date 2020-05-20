import 'package:app_qis/model/entity/vocabulary_jv.dart';
import 'package:flutter/material.dart';

class AnswerFrame extends StatelessWidget {
  const AnswerFrame({Key key, this.vocab, this.userInputController})
      : super(key: key);

  final Vocabulary vocab;
  final TextEditingController userInputController;

  @override
  Widget build(BuildContext context) {
    bool isInputCorrect = userInputController.text == vocab.word ||
        (vocab.hasHiragana() && userInputController.text == vocab.hiragana);
    String result = isInputCorrect ? 'O' : 'X';

    return Container(
      child: Expanded(
        child: Align(
            alignment: Alignment.center,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    vocab.word,
                    style: Theme.of(context).textTheme.display2,
                    textAlign: TextAlign.center,
                  ),
                  Visibility(
                    visible: vocab.hasHiragana(),
                    child: Text(
                      vocab.hiragana,
                      style: Theme.of(context).textTheme.display2,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 15.0),
                    child: Text(vocab.romaji,
                        style: Theme.of(context).textTheme.display1,
                        textAlign: TextAlign.center),
                  ),
                  Text(
                    '[${vocab.meaning}]',
                    style: TextStyle(color: Colors.grey, fontSize: 18.0),
                    textAlign: TextAlign.center,
                  ),
                  Visibility(
                    visible: userInputController.text.length > 0,
                    child: Container(
                      padding: const EdgeInsets.only(top: 45.0, bottom: 15.0),
                      child: Text(
                        'Your input: ${userInputController.text} ($result)',
                        style: TextStyle(
                            color: isInputCorrect ? Colors.green : Colors.red),
                      ),
                    ),
                  )
                ])),
      ),
    );
  }
}
