import 'package:equatable/equatable.dart';
import 'package:evolvify/features/AI-Assessment/data/models/emotion_analysis_response_model.dart';
import 'package:evolvify/features/AI-Assessment/data/models/video_analysis_response_model.dart';

abstract class AiAssessmentState extends Equatable {
  const AiAssessmentState();

  @override
  List<Object?> get props => [];
}

class Initial extends AiAssessmentState {
  const Initial();
}

class Loading extends AiAssessmentState {
  const Loading();
}

class Streaming extends AiAssessmentState {
  const Streaming();
}

class VideoAnalysisSuccess extends AiAssessmentState {
  final VideoAnalysisResponseModel result;

  const VideoAnalysisSuccess(this.result);

  @override
  List<Object?> get props => [result];
}

class EmotionStreamSuccess extends AiAssessmentState {
  final EmotionAnalysisResponseModel emotionData;

  const EmotionStreamSuccess(this.emotionData);

  @override
  List<Object?> get props => [emotionData];
}

class Error extends AiAssessmentState {
  final String message;

  const Error(this.message);

  @override
  List<Object?> get props => [message];
}
