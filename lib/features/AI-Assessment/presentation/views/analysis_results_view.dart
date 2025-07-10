import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:evolvify/core/utils/constant.dart';
import 'package:evolvify/features/AI-Assessment/presentation/manager/ai_assessment_cubit/ai_assessment_cubit.dart';
import 'package:evolvify/features/AI-Assessment/presentation/manager/ai_assessment_cubit/ai_assessment_state.dart';
import 'package:evolvify/features/AI-Assessment/data/models/video_analysis_response_model.dart';
import 'package:evolvify/features/AI-Assessment/data/models/emotion_analysis_response_model.dart';

class AnalysisResultsView extends StatelessWidget {
  final VideoAnalysisResponseModel videoAnalysisResult;
  const AnalysisResultsView({super.key, required this.videoAnalysisResult});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Analysis Results'),
        backgroundColor: AppColors.kPrimaryColor,
        foregroundColor: Colors.white,
      ),
      body: _buildResults(context),
    );
  }

  Widget _buildResults(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Emotions',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.kPrimaryColor,
                    ),
                  ),
                  const SizedBox(height: 12),
                  ...videoAnalysisResult.emotions.entries.map(
                    (entry) => Text(
                      '${entry.key}: ${entry.value.map((v) => v.toStringAsFixed != null ? v.toStringAsFixed(2) : v.toString()).join(", ")}',
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Mental Health',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.kPrimaryColor,
                    ),
                  ),
                  const SizedBox(height: 12),
                  ...videoAnalysisResult.mentalHealth.entries.map(
                    (entry) => Text('${entry.key}: ${entry.value}'),
                  ),
                ],
              ),
            ),
          ),
          if (videoAnalysisResult.voiceAnalysis != null) ...[
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Voice Analysis',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.kPrimaryColor,
                      ),
                    ),
                    const SizedBox(height: 12),
                    ...videoAnalysisResult.voiceAnalysis!.entries.map(
                      (entry) => Text('${entry.key}: ${entry.value}'),
                    ),
                  ],
                ),
              ),
            ),
          ],
          const SizedBox(height: 16),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Frame Data',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.kPrimaryColor,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text('Total Frames: ${videoAnalysisResult.frameData.length}'),
                  // Optionally show a few frame data points
                  ...videoAnalysisResult.frameData
                      .take(5)
                      .map((frame) => Text(frame.toString())),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Summary',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.kPrimaryColor,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text('Peak Stress: ${videoAnalysisResult.peakStress}'),
                  Text(
                    'Video Duration: ${videoAnalysisResult.videoDuration} seconds',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
