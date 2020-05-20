import 'package:app_qis/model/entity/vocabulary_jv.dart';
import 'package:app_qis/template/detail_screen/widget/quiz_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class VocabularyQuizTab extends StatefulWidget {
  final List<Vocabulary> vocabulary;

  const VocabularyQuizTab({Key key, this.vocabulary}) : super(key: key);

  @override
  _VocabularyQuizTabState createState() => _VocabularyQuizTabState();
}

class _VocabularyQuizTabState extends State<VocabularyQuizTab> {
  FlutterTts flutterTts;
  bool isLoading;
  Future<void> initData() async {
    await flutterTts.setLanguage("ja-JP");
  }

  @override
  void initState() {
    super.initState();
    flutterTts = new FlutterTts();
    initData().then((result) {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : QuizPage(vocabs: widget.vocabulary));
  }
}
