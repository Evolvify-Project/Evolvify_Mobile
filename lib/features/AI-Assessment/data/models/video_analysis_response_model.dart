// lib/features/AI-Assessment/data/models/video_analysis_response_model.dart
class VideoAnalysisResponseModel {
  final Map<String, List<dynamic>> emotions;
  final Map<String, dynamic> mentalHealth;
  final Map<String, dynamic>? voiceAnalysis;
  final List<Map<String, dynamic>> frameData;
  final double peakStress;
  final double videoDuration;

  VideoAnalysisResponseModel({
    required this.emotions,
    required this.mentalHealth,
    required this.voiceAnalysis,
    required this.frameData,
    required this.peakStress,
    required this.videoDuration,
  });

  factory VideoAnalysisResponseModel.fromJson(Map<String, dynamic> json) {
    return VideoAnalysisResponseModel(
      emotions: Map<String, List<dynamic>>.from(
        (json['emotions'] as Map<String, dynamic>).map(
          (k, v) => MapEntry(k, List<dynamic>.from(v)),
        ),
      ),
      mentalHealth: Map<String, dynamic>.from(json['mental_health'] ?? {}),
      voiceAnalysis:
          json['voice_analysis'] != null
              ? Map<String, dynamic>.from(json['voice_analysis'])
              : null,
      frameData: List<Map<String, dynamic>>.from(
        (json['frame_data'] as List<dynamic>? ?? []).map(
          (e) => Map<String, dynamic>.from(e),
        ),
      ),
      peakStress: (json['peak_stress'] as num?)?.toDouble() ?? 0.0,
      videoDuration: (json['video_duration'] as num?)?.toDouble() ?? 0.0,
    );
  }
}

class EmotionSummaryModel {
  final String mostCommonEmotion;
  final Map<String, int> emotionCounts;
  final Map<String, double> averageConfidenceScores;

  EmotionSummaryModel({
    required this.mostCommonEmotion,
    required this.emotionCounts,
    required this.averageConfidenceScores,
  });

  factory EmotionSummaryModel.fromJson(Map<String, dynamic> json) {
    return EmotionSummaryModel(
      mostCommonEmotion: json['Most Common Emotion'] as String,
      emotionCounts: Map<String, int>.from(
        (json['Emotion Counts'] as Map<String, dynamic>).map(
          (k, v) => MapEntry(k, v as int),
        ),
      ),
      averageConfidenceScores: Map<String, double>.from(
        (json['Average Confidence Scores'] as Map<String, dynamic>).map(
          (k, v) => MapEntry(k, (v as num).toDouble()),
        ),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Most Common Emotion': mostCommonEmotion,
      'Emotion Counts': emotionCounts,
      'Average Confidence Scores': averageConfidenceScores,
    };
  }
}

class MentalHealthScoresModel {
  final double depression;
  final double stress;
  final double anxiety;

  MentalHealthScoresModel({
    required this.depression,
    required this.stress,
    required this.anxiety,
  });

  factory MentalHealthScoresModel.fromJson(Map<String, dynamic> json) {
    return MentalHealthScoresModel(
      depression: (json['depression'] as num).toDouble(),
      stress: (json['stress'] as num).toDouble(),
      anxiety: (json['anxiety'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {'depression': depression, 'stress': stress, 'anxiety': anxiety};
  }
}
