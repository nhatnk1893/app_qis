import 'dart:convert';

import 'package:app_qis/model/entity/vocabulary_jv.dart';
import 'package:app_qis/model/service/repository_vocabulary.dart';
import 'package:flutter/services.dart' show rootBundle;

class RepositoryImplVocabulary with RepositoryVocabulary {
  @override
  Future<List<Vocabulary>> getListVocabulary(int id) async {
    String vocabJson = await rootBundle.loadString("assets/n5_to_n1.json");
    final jsonResponse = (jsonDecode(vocabJson) as List)
        .map((e) => new Vocabulary.fromJson(e))
        .where((element) => element.level == id)
        .toList();
    return jsonResponse;
  }
}
