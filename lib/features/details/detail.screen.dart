import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:showwcase_pokemob/features/details/detail.controller.dart';
import 'package:showwcase_pokemob/model/pokemon.model.dart';
import 'package:showwcase_pokemob/utilities/list.ext.dart';

import 'package:showwcase_pokemob/utilities/color.ext.dart';

class DetailScreen extends GetView<DetailController> {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var data = Get.arguments as Pokemon;
    controller.setPokemon(data);

    return Scaffold(
      appBar: AppBar(title: Text(data.name ?? '-')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              color: controller.backgroundColor.withBrighness(1.5),
              child: Container(
                margin: const EdgeInsets.all(24),
                width: double.maxFinite,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Image.network(
                        controller.preferredImage,
                        width: 200,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      data.name ?? '-',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      'Type: ${data.types?.firstOrNull()?.type?.name ?? '-'}',
                      style: TextStyle(
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                        color: Colors.grey[600],
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      'Base Stat: ${controller.moves.length}',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      'Skills/moves: ${data.stats?.firstOrNull()?.baseStat ?? '-'}',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: controller.moves
                          .map(
                            (e) => Chip(
                              label: Text(e ?? '-'),
                              backgroundColor: controller.backgroundColor.getDifferentColor(),
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
