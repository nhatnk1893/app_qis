import 'package:app_qis/model/vocabs.dart';
import 'package:app_qis/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  _MyApp createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  Vocabs vocabs;
  FlutterTts flutterTts;
  bool isLoading;

  Future<void> initData() async {
    vocabs = await Vocabs.loadVocabs();
    await flutterTts.setLanguage("ja-JP");
  }

  @override
  void initState() {
    super.initState();

    isLoading = true;
    flutterTts = new FlutterTts();

    initData().then((result) {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'QIS THÁNG 5',
        theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.blue,
        ),
        home: isLoading
            ? Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  title: Text('QIS THÁNG 5'),
                ),
                body: Center(
                  child: Text('Loading...'),
                ),
              )
            : HomePage(
                title: 'Kana Listening Test',
                vocabs: vocabs,
                flutterTts: flutterTts),
        debugShowCheckedModeBanner: false);
  }
}
