import 'dart:math';

import 'package:app_qis/model/entity/vocabulary_jv.dart';
import 'package:app_qis/template/detail_screen/widget/quiz_answer.dart';
import 'package:app_qis/template/detail_screen/widget/quiz_question.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class QuizPage extends StatefulWidget {
  final List<Vocabulary> vocabs;
  final FlutterTts flutterTts;

  const QuizPage({Key key, this.vocabs, this.flutterTts}) : super(key: key);
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int counter;
  bool isShowAnswer;
  QuestionFrame qFrame;
  AnswerFrame aFrame;
  Vocabulary vocab;
  TextEditingController userInputController;
  int position = 0;
  var rand = new Random();

  @override
  initState() {
    super.initState();
    counter = 1;
    vocab = drawWord();
    isShowAnswer = false;
    userInputController = new TextEditingController();
    createNewFrames();
  }

  @override
  void dispose() {
    userInputController.dispose();
    super.dispose();
  }

  Vocabulary drawWord() {
    do {
      this.position = rand.nextInt(widget.vocabs.length);
    } while (widget.vocabs[this.position].word.length < 4 ||
        widget.vocabs[this.position].meaning.length == 0);
    return widget.vocabs[this.position];
  }

  void showAnswer() {
    setState(() {
      isShowAnswer = !isShowAnswer;
    });
  }

  void displayNextWord() {
    Vocabulary newVocab = drawWord();
    setState(() {
      counter++;
      vocab = newVocab;
      isShowAnswer = false;
      userInputController.clear();
      createNewFrames();
    });
  }

  void createNewFrames() {
    qFrame = new QuestionFrame(
      questionNumber: counter.toString(),
      vocab: vocab,
      showAnswer: showAnswer,
      userInputController: userInputController,
      flutterTts: widget.flutterTts,
    );
    aFrame = new AnswerFrame(
      vocab: vocab,
      userInputController: userInputController,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: isShowAnswer ? aFrame : qFrame,
            ),
            Container(
              padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    child: Ink(
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: CircleBorder(),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.visibility),
                        iconSize: 36.0,
                        color: Colors.black87,
                        tooltip: 'Show Answer',
                        onPressed: showAnswer,
                      ),
                    ),
                  ),
                  Container(
                    child: Ink(
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: CircleBorder(),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.navigate_next),
                        iconSize: 36.0,
                        color: Colors.black87,
                        tooltip: 'Next Word',
                        onPressed: displayNextWord,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
