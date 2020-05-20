import 'dart:math';

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
  String getPronounciationText() {
    return hasHiragana() ? this.hiragana : this.word;
  }

  bool hasHiragana() {
    return this.hiragana.length > 0;
  }

  factory Vocabulary.fromJson(Map<String, dynamic> json) =>
      _$VocabularyFromJson(json);
  Map<String, dynamic> toJson() => _$VocabularyToJson(this);
}
