import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:showwcase_pokemob/app/app.routes.dart';
import 'package:showwcase_pokemob/app/locale/translation.locale.dart';
import 'package:showwcase_pokemob/domain/repository/api.repository.dart';
import 'package:showwcase_pokemob/domain/repository/storage.repository.dart';
import 'package:showwcase_pokemob/domain/service/api.service.dart';

void main() async {
  await initServices();
  runApp(const MyApp());
}

initServices() async {
  var storage = Get.put(StorageRepository());
  await storage.initialize();
  Get.put(ApiRepository());

  Get.put(PokemonService());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: AppTranslation(),
      locale: const Locale('en', 'US'),
      title: 'The Pokemon',
      getPages: AppPages.pages,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/splash',
    );
  }
}
