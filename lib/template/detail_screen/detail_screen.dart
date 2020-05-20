import 'package:app_qis/template/detail_screen/widget/vocabulary_quiz_tab_widget.dart';
import 'package:app_qis/template/detail_screen/widget/vocabulary_tab_widget.dart';
import 'package:app_qis/template/home_screen/home_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatelessWidget {
  final String urlImg;
  final String name;

  const DetailScreen({Key key, this.urlImg, this.name}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenProvider>(builder:
        (BuildContext context, HomeScreenProvider provider, Widget child) {
      var _lstVocabulary = provider.lstVocabulary;
      return Scaffold(
        body: DefaultTabController(
          length: 2,
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  expandedHeight: 120.0,
                  floating: false,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                      centerTitle: true,
                      title: Text("$name",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          )),
                      background: Image.asset(
                        urlImg,
                        fit: BoxFit.cover,
                      )),
                  bottom: TabBar(
                    labelColor: Colors.black87,
                    unselectedLabelColor: Colors.grey,
                    tabs: [
                      new Tab(icon: new Icon(Icons.book), text: "Vocabulary"),
                      new Tab(
                          icon: new Icon(Icons.question_answer), text: "Quiz"),
                    ],
                  ),
                ),
              ];
            },
            body: TabBarView(children: [
              VocabularyTab(
                vocabulary: _lstVocabulary,
              ),
              VocabularyQuizTab(
                vocabulary: _lstVocabulary,
              )
            ]),
          ),
        ),
      );
    });
  }
}
