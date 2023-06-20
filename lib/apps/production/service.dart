import 'dart:convert';

import 'package:http/http.dart';

import 'models.dart';

class ProductionService {
  final String apiKey;
  final String url;
  final List<ProductionModel> _productionList = <ProductionModel>[];

  ProductionService({
    this.apiKey = "32e129c3",
    this.url = "https://www.omdbapi.com/",
  });

  Future<List<ProductionModel>> getProductions(String search) async {
    try {
      _productionList.clear();
      final String urlFormated = '$url?apikey=$apiKey&type=movie&s=$search';
      final uri = Uri.parse(urlFormated);
      final response = await get(uri);
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

  Future<ProductionModel> getProduction(String imdbID) async {
    ProductionModel productionModel = ProductionModel();
    try {
      final String urlFormated = '$url?apikey=$apiKey&type=movie&i=$imdbID';
      final uri = Uri.parse(urlFormated);
      final response = await get(uri);
      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        productionModel = ProductionModel.fromJson(body);
      }
    } catch (error) {
      Exception(error.toString());
    }
    return productionModel;
  }
}
