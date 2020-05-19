import 'package:app_qis/model/entity/vocabulary_jv.dart';
import 'package:app_qis/model/service/repositoryImpl_vocabulary.dart';
import 'package:app_qis/model/service/repository_vocabulary.dart';
import 'package:flutter/material.dart';

class HomeScreenProvider extends ChangeNotifier {
  RepositoryVocabulary _repositoryVocabulary = RepositoryImplVocabulary();
  List<Vocabulary> lstVocabulary = [];
  bool isLoading = true;

  fetchData(id) async {
    setLoading(true);
    final data = await _repositoryVocabulary.getListVocabulary(id);
    setVocabulary(data);
    setLoading(false);
  }

  void setLoading(value) async {
    isLoading = await value;
    notifyListeners();
  }

  void setVocabulary(value) async {
    if (value != null) {
      lstVocabulary = value;
    }
    notifyListeners();
  }
}
