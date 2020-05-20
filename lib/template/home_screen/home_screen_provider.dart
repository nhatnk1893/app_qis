import 'package:app_qis/model/entity/vocabulary_jv.dart';
import 'package:flutter/material.dart';

class HomeScreenProvider extends ChangeNotifier {
  Vocabs vocabs;
  bool isLoading = true;

  fetchData(id) async {
    setLoading(true);
    final lstVocab = await Vocabs.loadVocabs();
    setVocabs(lstVocab);
    setLoading(false);
  }

  void setLoading(value) async {
    isLoading = await value;
    notifyListeners();
  }

  void setVocabs(value) async {
    vocabs = value;
    notifyListeners();
  }
}
