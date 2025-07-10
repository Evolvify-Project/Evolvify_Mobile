class RealtimeEmotionModel {
  final String emotion;
  final double confidence;
  final double stress;
  final double anxiety;
  final double mentalConfidence;
  final DateTime timestamp;

  RealtimeEmotionModel({
    required this.emotion,
    required this.confidence,
    required this.stress,
    required this.anxiety,
    required this.mentalConfidence,
    required this.timestamp,
  });

  factory RealtimeEmotionModel.fromJson(Map<String, dynamic> json) {
    return RealtimeEmotionModel(
      emotion: json['emotion'] as String,
      confidence: (json['confidence'] as num).toDouble(),
      stress: (json['stress'] as num).toDouble(),
      anxiety: (json['anxiety'] as num).toDouble(),
      mentalConfidence: (json['mental_confidence'] as num).toDouble(),
      timestamp: DateTime.parse(json['timestamp'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'emotion': emotion,
      'confidence': confidence,
      'stress': stress,
      'anxiety': anxiety,
      'mental_confidence': mentalConfidence,
      'timestamp': timestamp.toIso8601String(),
    };
  }
}
