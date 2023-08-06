import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StorageRepository extends GetxService {
  final _storage = GetStorage('pokemon');

  Future<bool> initialize() async {
    return await _storage.initStorage;
  }

  Map<String, dynamic>? get(String url) {
    return _storage.read(url);
  }
}
