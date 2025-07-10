// lib/features/AI-Assessment/data/models/emotion_analysis_response_model.dart
class EmotionAnalysisResponseModel {
  final String emotion;
  final double confidence;
  final MentalHealthModel mentalHealth;
  final TrendDataModel trendData;

  EmotionAnalysisResponseModel({
    required this.emotion,
    required this.confidence,
    required this.mentalHealth,
    required this.trendData,
  });

  factory EmotionAnalysisResponseModel.fromJson(Map<String, dynamic> json) {
    return EmotionAnalysisResponseModel(
      emotion: json['emotion'] as String,
      confidence: (json['confidence'] as num).toDouble(),
      mentalHealth: MentalHealthModel.fromJson(
          json['mental_health'] as Map<String, dynamic>),
      trendData: TrendDataModel.fromJson(
          json['trend_data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'emotion': emotion,
      'confidence': confidence,
      'mental_health': mentalHealth.toJson(),
      'trend_data': trendData.toJson(),
    };
  }
}

class MentalHealthModel {
  final double? stress; // Made nullable as per example (confidence is there, but not stress/anxiety)
  final double? anxiety; // Made nullable
  final double? confidence; // Assuming 'confidence' in mental_health is the third score

  MentalHealthModel({
    this.stress,
    this.anxiety,
    this.confidence,
  });

  factory MentalHealthModel.fromJson(Map<String, dynamic> json) {
    return MentalHealthModel(
      stress: (json['stress'] as num?)?.toDouble(),
      anxiety: (json['anxiety'] as num?)?.toDouble(),
      confidence: (json['confidence'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'stress': stress,
      'anxiety': anxiety,
      'confidence': confidence,
    };
  }
}

class TrendDataModel {
  // Define properties based on the actual structure of trend_data
  // For example, if it's a list of historical stress, anxiety, confidence values:
  final List<double> stressHistory;
  final List<double> anxietyHistory;
  final List<double> confidenceHistory;

  TrendDataModel({
    required this.stressHistory,
    required this.anxietyHistory,
    required this.confidenceHistory,
  });

  factory TrendDataModel.fromJson(Map<String, dynamic> json) {
    // Assuming trend_data contains lists for 'stress', 'anxiety', 'confidence'
    return TrendDataModel(
      stressHistory: List<double>.from(
          (json['stress_history'] as List<dynamic>?)?.map((e) =>
              (e as num).toDouble()) ?? []),
      anxietyHistory: List<double>.from(
          (json['anxiety_history'] as List<dynamic>?)?.map((e) =>
              (e as num).toDouble()) ?? []),
      confidenceHistory: List<double>.from(
          (json['confidence_history'] as List<dynamic>?)?.map((e) =>
              (e as num).toDouble()) ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'stress_history': stressHistory,
      'anxiety_history': anxietyHistory,
      'confidence_history': confidenceHistory,
    };
  }
}