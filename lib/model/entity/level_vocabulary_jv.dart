class LevelVocabulary {
  final int level;
  final String imgUrl;
  final String name;

  LevelVocabulary({this.level, this.imgUrl, this.name});
}

List<LevelVocabulary> lstLevel = <LevelVocabulary>[
  LevelVocabulary(
      level: 1, imgUrl: "assets/img/level1.jpg", name: "Vocabulary N5"),
  LevelVocabulary(
      level: 2, imgUrl: "assets/img/level2.jpg", name: "Vocabulary N4"),
  LevelVocabulary(
      level: 3, imgUrl: "assets/img/level3.jpg", name: "Vocabulary N3"),
  LevelVocabulary(
      level: 4, imgUrl: "assets/img/level4.jpg", name: "Vocabulary N2"),
  LevelVocabulary(
      level: 5, imgUrl: "assets/img/level5.jpg", name: "Vocabulary N1"),
];
