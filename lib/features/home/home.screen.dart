import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:showwcase_pokemob/app/app.routes.dart';
import 'package:showwcase_pokemob/app/locale/keys.locale.dart';
import 'package:showwcase_pokemob/features/home/home.controller.dart';

class HomeScreen extends GetView<HomeController> {
  final _scrollController = ScrollController();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        controller.loadPokemons();
      }
    });
    return Scaffold(
      body: Obx(
        () => CustomScrollView(
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
                  if (index == controller.pokemons.length) {
                    return const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                      ],
                    );
                  }
                  var item = controller.pokemons[index];
                  return ListTile(
                    title: Text(item.name ?? '-'),
                    onTap: item.pokemonDetail != null
                        ? () {
                            Get.toNamed(AppPages.details, arguments: item.pokemonDetail);
                          }
                        : null,
                    leading: item.pokemonDetail?.sprites?.frontDefault != null ? Image.network(item.pokemonDetail!.sprites!.frontDefault!) : null,
                  );
                },
                childCount: controller.pokemons.length + (controller.isLoading.isTrue ? 1 : 0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
