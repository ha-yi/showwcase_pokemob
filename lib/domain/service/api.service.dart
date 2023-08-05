import 'package:get/get.dart';

class ApiService extends GetxService {
  final _client = GetConnect();
  final _baseUrl = 'https://pokeapi.co/api/v2/';
  final _pageLimit = 20;

  @override
  onInit() {
    super.onInit();
    _client.baseUrl = _baseUrl;
  }

  Future getPokemons(int page) async {
    var response = await _client.get('/pokemon/?limit=$_pageLimit&offset=${((page - 1) * _pageLimit)}');
    return response.body;
  }
}
