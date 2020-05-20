import 'package:app_qis/model/vocabs.dart';
import 'package:app_qis/views/widgets/answer_widget.dart';
import 'package:app_qis/views/widgets/question_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title, this.vocabs, this.flutterTts})
      : super(key: key);

  final String title;
  final Vocabs vocabs;
  final FlutterTts flutterTts;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int counter;
  bool isShowAnswer;
  QuestionFrame qFrame;
  AnswerFrame aFrame;

  Vocabs vocabs;
  Vocab vocab;
  TextEditingController userInputController;

  @override
  initState() {
    super.initState();
    counter = 1;
    vocab = widget.vocabs.drawWord();
    isShowAnswer = false;
    userInputController = new TextEditingController();
    createNewFrames();
  }

  @override
  void dispose() {
    userInputController.dispose();
    super.dispose();
  }

  void displayNextWord() {
    Vocab newVocab = widget.vocabs.drawWord();
    setState(() {
      counter++;
      vocab = newVocab;
      isShowAnswer = false;
      userInputController.clear();
      createNewFrames();
    });
  }

  void showAnswer() {
    setState(() {
      isShowAnswer = !isShowAnswer;
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

  Future _showAlert(BuildContext context, String message) async {
    return showDialog(
        context: context,
        child: new AlertDialog(
          title: new Image.asset('assets/img/tuananh.jpg'),
          actions: <Widget>[
            new Text('Hello baby'),
            new FlatButton(
                onPressed: () => Navigator.pop(context), child: new Text('Ok'))
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
              padding: EdgeInsets.all(5.0),
              icon: Image.asset(
                'assets/img/tuananh.jpg',
                fit: BoxFit.cover,
              ),
              onPressed: () =>
                  _showAlert(context, 'Do you like flutter, I do!')),
        ],
      ),
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
                        color: Colors.blue,
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
                        color: Colors.blue,
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
