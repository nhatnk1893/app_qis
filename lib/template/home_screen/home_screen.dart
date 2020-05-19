import 'package:app_qis/template/home_screen/widget/chart_widget.dart';
import 'package:app_qis/template/home_screen/widget/list_level_widget.dart';
import 'package:app_qis/template/home_screen/widget/sliver_detail_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(),
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: null),
          IconButton(icon: Icon(Icons.more_vert), onPressed: null)
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            expandedHeight: 80,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: ChartWidget(),
            ),
          ),
          SliverList(delegate: SliverChildListDelegate([SliverDetail()])),
          SliverFillRemaining(child: ListLevel())
        ],
      ),
    );
  }
}
