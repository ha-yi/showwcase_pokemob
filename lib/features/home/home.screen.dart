import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final _scrollController = ScrollController();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // scaffold with image app bar expandable, with infinite scroll list view that fetch data before it reach bottom.
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('The Pokemon'),
              background: Image.asset(
                'assets\img\appbar.jpg',
                fit: BoxFit.cover,
              ),
            ),
            pinned: true,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return ListTile(
                  title: Text('Item $index'),
                );
              },
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}
