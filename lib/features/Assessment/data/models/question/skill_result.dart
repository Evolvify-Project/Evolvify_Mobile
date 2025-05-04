class SkillResult {
  final String skill;
  final String level;

  SkillResult({required this.skill, required this.level});

  factory SkillResult.fromJson(Map<String, dynamic> json) {
    return SkillResult(skill: json["skill"] ?? '', level: json["level"] ?? '');
  }
}
