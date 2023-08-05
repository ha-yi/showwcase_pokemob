import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:showwcase_pokemob/app/locale/keys.locale.dart';
import 'package:showwcase_pokemob/features/home/home.controller.dart';

class HomeScreen extends GetView<HomeController> {
  final _scrollController = ScrollController();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(Words.homeTitle.tr),
              background: Image.asset(
                'assets/img/appbar.jpg',
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
