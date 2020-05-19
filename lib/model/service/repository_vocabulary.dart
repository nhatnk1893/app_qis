import 'package:app_qis/model/entity/vocabulary_jv.dart';

abstract class RepositoryVocabulary {
  Future<List<Vocabulary>> getListVocabulary(int id);
}
