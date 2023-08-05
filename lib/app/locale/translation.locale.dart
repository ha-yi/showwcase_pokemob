import 'package:get/get.dart';
import 'package:showwcase_pokemob/app/locale/locales/en.dart';
import 'package:showwcase_pokemob/app/locale/locales/id.dart';

class AppTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': EnUS().texts,
        'id_ID': IdID().texts,
      };
}
