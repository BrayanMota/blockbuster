import 'dart:convert';

import 'package:http/http.dart';

import 'models.dart';

class ProductionService {
  final String apiKey = "32e129c3";
  final url = "https://www.omdbapi.com/?apikey=32e129c3&type=movie&s=";
  final List<ProductionModel> _productionList = <ProductionModel>[];

  Future<List<ProductionModel>> testeRequisicao(String search) async {
    try {
      _productionList.clear();
      final uri = this.url + search;
      final url = Uri.parse(uri);
      final response = await get(url);
      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        if (body["Response"] == "True") {
          for (var production in body["Search"]) {
            final ProductionModel productionModel =
                ProductionModel.fromJson(production);
            _productionList.add(productionModel);
          }
        }
      }
    } catch (error) {
      Exception(error.toString());
    }
    return _productionList;
  }
}
