import 'package:app_qis/model/entity/level_vocabulary_jv.dart';
import 'package:app_qis/template/home_screen/widget/chart_widget.dart';
import 'package:app_qis/template/home_screen/widget/item_level.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('QIS Brycen'),
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: null),
          IconButton(icon: Icon(Icons.more_vert), onPressed: null)
        ],
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.white,
            expandedHeight: 400,
            floating: true,
            pinned: false,
            flexibleSpace: FlexibleSpaceBar(
              background: ChartWidget(),
            ),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
            (context, index) => ItemLevel(
              name: lstLevel[index].name,
              urlImg: lstLevel[index].name,
              level: lstLevel[index].level,
            ),
            childCount: lstLevel.length,
          ))
        ],
      ),
    );
  }
}
