import 'package:json_annotation/json_annotation.dart';
part 'vocabulary_jv.g.dart';

@JsonSerializable(nullable: false)
class Vocabulary {
  String word;
  String meaning;
  String hiragana;
  String romaji;
  int level;

  Vocabulary({word, meaning, hiragana, romaji, level}) {
    this.word = word;
    this.meaning = meaning;
    this.hiragana = hiragana;
    this.romaji = romaji;
    this.level = level;
  }
  factory Vocabulary.fromJson(Map<String, dynamic> json) =>
      _$VocabularyFromJson(json);
  Map<String, dynamic> toJson() => _$VocabularyToJson(this);
}
