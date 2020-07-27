import 'dart:async';
import 'package:cat_fact/models/cat_fact.dart';
import 'package:cat_fact/networking/response.dart';
import 'package:cat_fact/repository/detailFactRepository.dart';

class DetailBloc {
  DetailFactRepository _detailFactRepository;
  StreamController _chuckDataController;

  StreamSink<Response<CatFactModel>> get detailDataSink =>
      _chuckDataController.sink;

  Stream<Response<CatFactModel>> get detailDataStream =>
      _chuckDataController.stream;

  DetailBloc(String category) {
    _chuckDataController = StreamController<Response<CatFactModel>>();
    _detailFactRepository = DetailFactRepository();
    fetchDetailFact(category);
  }

  fetchDetailFact(String category) async {
    detailDataSink.add(Response.loading('Getting A Detailed Fact!'));
    try {
      CatFactModel detailedFact =
          await _detailFactRepository.fetchDetailFact(category);
      detailDataSink.add(Response.completed(detailedFact));
    } catch (e) {
      detailDataSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _chuckDataController?.close();
  }
}
