class Character {
  final int userId;
  final String characterName;
  final String charClass;
  final int level;
  final String background;
  final String race;
  final String alignment;
  final int experiencePoint;
  final int currentHitPoint;
  final int maxHitPoint;
  final int armorClass;
  final double speed;

  Character({
    required this.userId,
    required this.characterName,
    required this.charClass,
    required this.level,
    required this.background,
    required this.race,
    required this.alignment,
    required this.experiencePoint,
    required this.currentHitPoint,
    required this.maxHitPoint,
    required this.armorClass,
    required this.speed,
  });
}
