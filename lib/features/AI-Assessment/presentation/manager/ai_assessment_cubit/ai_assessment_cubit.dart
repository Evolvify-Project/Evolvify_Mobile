import 'dart:async';
import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:evolvify/features/AI-Assessment/data/repos/ai_assessment_repository.dart';
import 'ai_assessment_state.dart';

class AiAssessmentCubit extends Cubit<AiAssessmentState> {
  final AiAssessmentRepository _repository;

  AiAssessmentCubit(this._repository) : super(const Initial());

  Future<void> analyzeVideo({required File videoFile}) async {
    print('AiAssessmentCubit: Starting video analysis');
    emit(const Loading());

    try {
      print('AiAssessmentCubit: Calling repository analyzeUploadedVideo');
      final result = await _repository.analyzeUploadedVideo(
        videoFile: videoFile,
      );
      print('AiAssessmentCubit: Analysis completed successfully');
      print('AiAssessmentCubit: Result type: ${result.runtimeType}');
      print('AiAssessmentCubit: Result data: $result');
      emit(VideoAnalysisSuccess(result));
      print('AiAssessmentCubit: VideoAnalysisSuccess state emitted');
    } catch (error) {
      print('AiAssessmentCubit: Error during analysis: $error');
      print('AiAssessmentCubit: Error stack trace: ${StackTrace.current}');
      emit(Error(error.toString()));
    }
  }

  void startEmotionStream() {
    emit(const Streaming());

    try {
      final stream = _repository.connectToEmotionStream();

      // Add timeout to prevent hanging
      Timer(const Duration(seconds: 30), () {
        if (!isClosed && state is Streaming) {
          print('Emotion stream timeout - stopping stream');
          stopEmotionStream();
        }
      });

      stream.listen(
        (emotionData) {
          if (!isClosed) {
            emit(EmotionStreamSuccess(emotionData));
          }
        },
        onError: (error) {
          if (!isClosed) {
            print('Emotion stream error: $error');
            emit(Error(error.toString()));
          }
        },
        onDone: () {
          if (!isClosed) {
            print('Emotion stream completed');
            emit(const Initial());
          }
        },
      );
    } catch (error) {
      if (!isClosed) {
        print('Error starting emotion stream: $error');
        emit(Error(error.toString()));
      }
    }
  }

  void sendVideoFrame(String base64Frame) {
    if (state is Streaming) {
      _repository.sendVideoFrame(base64Frame);
    }
  }

  void stopEmotionStream() {
    _repository.disconnectFromEmotionStream();
    emit(const Initial());
  }

  void reset() {
    emit(const Initial());
  }
}
