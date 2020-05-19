// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vocabulary_jv.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Vocabulary _$VocabularyFromJson(Map<String, dynamic> json) {
  return Vocabulary(
    word: json['word'],
    meaning: json['meaning'],
    hiragana: json['hiragana'],
    romaji: json['romaji'],
    level: json['level'],
  );
}

Map<String, dynamic> _$VocabularyToJson(Vocabulary instance) =>
    <String, dynamic>{
      'word': instance.word,
      'meaning': instance.meaning,
      'hiragana': instance.hiragana,
      'romaji': instance.romaji,
      'level': instance.level,
    };
