import 'dart:async';
import 'package:cat_fact/models/cat_fact.dart';
import 'package:cat_fact/networking/api_provider.dart';

class CatFactRepository {
  ApiProvider _provider = ApiProvider();

  Future<CatFactModel> fetchCatFactData() async {
    final response = await _provider.get("facts");
    return CatFactModel.fromJson(response);
  }
}
