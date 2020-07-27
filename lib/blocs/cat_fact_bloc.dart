import 'dart:async';

import 'package:cat_fact/models/cat_fact.dart';
import 'package:cat_fact/networking/response.dart';
import 'package:cat_fact/repository/listingRepository.dart';

class CatFactBloc {
  CatFactRepository _catFactRepository;
  StreamController _factListController;

  StreamSink<Response<CatFactModel>> get factListSink =>
      _factListController.sink;

  Stream<Response<CatFactModel>> get factListStream =>
      _factListController.stream;

  CatFactBloc() {
    _factListController = StreamController<Response<CatFactModel>>();
    _catFactRepository = CatFactRepository();
    fetchCatFacts();
  }

  fetchCatFacts() async {
    factListSink.add(Response.loading('Getting Cat Facts.'));
    try {
      CatFactModel catsFact = await _catFactRepository.fetchCatFactData();
      factListSink.add(Response.completed(catsFact));
    } catch (e) {
      factListSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _factListController?.close();
  }
}
