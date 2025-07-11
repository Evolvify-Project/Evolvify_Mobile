import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:evolvify/core/utils/constant.dart';
import 'package:evolvify/features/AI-Assessment/presentation/manager/ai_assessment_cubit/ai_assessment_cubit.dart';
import 'package:evolvify/features/AI-Assessment/presentation/manager/ai_assessment_cubit/ai_assessment_state.dart';
import 'package:evolvify/features/AI-Assessment/data/models/video_analysis_response_model.dart';
import 'package:evolvify/features/AI-Assessment/data/models/emotion_analysis_response_model.dart';

class AnalysisResultsView extends StatefulWidget {
  final VideoAnalysisResponseModel videoAnalysisResult;
  const AnalysisResultsView({super.key, required this.videoAnalysisResult});

  @override
  State<AnalysisResultsView> createState() => _AnalysisResultsViewState();
}

class _AnalysisResultsViewState extends State<AnalysisResultsView> {
  Map<String, double> _summaryStats = {};
  List<Map<String, dynamic>> _emotionData = [];
  String _primaryEmotion = 'Neutral';

  @override
  void initState() {
    super.initState();
    _processAnalysisResult();
  }

  void _processAnalysisResult() {
    // Process the analysis result similar to how the JSX file does
    final result = widget.videoAnalysisResult;

    // Calculate summary stats from the response
    final confidence =
        (result.mentalHealth['confidence'] as num?)?.toDouble() ?? 0.0;
    final anxiety = (result.mentalHealth['anxiety'] as num?)?.toDouble() ?? 0.0;
    final stress = (result.mentalHealth['stress'] as num?)?.toDouble() ?? 0.0;

    _summaryStats = {
      'confidence': confidence,
      'anxiety': anxiety,
      'stress': stress,
      'peakStress': result.peakStress,
      'emotionalStability': 100 - (stress + anxiety) / 2,
    };

    // Process frame data for the chart (similar to JSX interpolation)
    _emotionData = [];
    for (int i = 0; i < result.frameData.length; i++) {
      final frame = result.frameData[i];
      final time = (i / result.frameData.length) * result.videoDuration;

      _emotionData.add({
        'time': time,
        'stress': (frame['stress'] as num?)?.toDouble() ?? 0.0,
        'anxiety': (frame['anxiety'] as num?)?.toDouble() ?? 0.0,
        'confidence': (frame['confidence'] as num?)?.toDouble() ?? 0.0,
      });
    }

    // Calculate primary emotion from emotions data
    if (result.emotions.isNotEmpty) {
      String mostCommonEmotion = 'Neutral';
      int maxCount = 0;

      for (final entry in result.emotions.entries) {
        if (entry.value.length > maxCount) {
          maxCount = entry.value.length;
          mostCommonEmotion = entry.key;
        }
      }

      _primaryEmotion = mostCommonEmotion;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Analysis Results'),
        backgroundColor: AppColors.kPrimaryColor,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildMetricsSection(),
            const SizedBox(height: 24),
            _buildEmotionalTrendsChart(),
            const SizedBox(height: 24),
            _buildKeyInsights(),
            const SizedBox(height: 24),
            _buildDetailedResults(),
          ],
        ),
      ),
    );
  }

  Widget _buildMetricsSection() {
    return Column(
      children: [
        // Summary cards - responsive layout
        LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 600) {
              // Wide screen - horizontal layout
              return Row(
                children: [
                  Expanded(
                    child: _buildMetricCard(
                      'Confidence',
                      _summaryStats['confidence'] ?? 0.0,
                      Colors.green,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildMetricCard(
                      'Anxiety',
                      _summaryStats['anxiety'] ?? 0.0,
                      Colors.purple,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildMetricCard(
                      'Stress',
                      _summaryStats['stress'] ?? 0.0,
                      Colors.red,
                    ),
                  ),
                ],
              );
            } else {
              // Narrow screen - vertical layout
              return Column(
                children: [
                  _buildMetricCard(
                    'Confidence',
                    _summaryStats['confidence'] ?? 0.0,
                    Colors.green,
                  ),
                  const SizedBox(height: 12),
                  _buildMetricCard(
                    'Anxiety',
                    _summaryStats['anxiety'] ?? 0.0,
                    Colors.purple,
                  ),
                  const SizedBox(height: 12),
                  _buildMetricCard(
                    'Stress',
                    _summaryStats['stress'] ?? 0.0,
                    Colors.red,
                  ),
                ],
              );
            }
          },
        ),
        const SizedBox(height: 16),
        // Emotional state and metrics - responsive layout
        LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 500) {
              // Wide screen - horizontal layout
              return Row(
                children: [
                  Expanded(
                    child: _buildInfoCard(
                      'Emotional State',
                      Icons.face,
                      Colors.yellow,
                      [
                        'Primary Emotion: $_primaryEmotion',
                        'Confidence: ${(_summaryStats['confidence'] ?? 0.0).toStringAsFixed(1)}%',
                        'Emotional Stability: ${(_summaryStats['emotionalStability'] ?? 0.0).toStringAsFixed(1)}%',
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildInfoCard('Metrics', Icons.mic, Colors.green, [
                      'Stress: ${(_summaryStats['stress'] ?? 0.0).toStringAsFixed(1)}%',
                      'Anxiety: ${(_summaryStats['anxiety'] ?? 0.0).toStringAsFixed(1)}%',
                      'Peak Stress: ${(_summaryStats['peakStress'] ?? 0.0).toStringAsFixed(1)}%',
                    ]),
                  ),
                ],
              );
            } else {
              // Narrow screen - vertical layout
              return Column(
                children: [
                  _buildInfoCard('Emotional State', Icons.face, Colors.yellow, [
                    'Primary Emotion: $_primaryEmotion',
                    'Confidence: ${(_summaryStats['confidence'] ?? 0.0).toStringAsFixed(1)}%',
                    'Emotional Stability: ${(_summaryStats['emotionalStability'] ?? 0.0).toStringAsFixed(1)}%',
                  ]),
                  const SizedBox(height: 12),
                  _buildInfoCard('Metrics', Icons.mic, Colors.green, [
                    'Stress: ${(_summaryStats['stress'] ?? 0.0).toStringAsFixed(1)}%',
                    'Anxiety: ${(_summaryStats['anxiety'] ?? 0.0).toStringAsFixed(1)}%',
                    'Peak Stress: ${(_summaryStats['peakStress'] ?? 0.0).toStringAsFixed(1)}%',
                  ]),
                ],
              );
            }
          },
        ),
      ],
    );
  }

  Widget _buildMetricCard(String title, double value, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            '${value.toStringAsFixed(1)}%',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(
    String title,
    IconData icon,
    Color iconColor,
    List<String> items,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: iconColor),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ...items.map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Text(
                item,
                style: TextStyle(color: Colors.grey.shade700, fontSize: 14),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmotionalTrendsChart() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Emotional Trends',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 250, // Reduced height to prevent overflow
            child: LineChart(
              LineChartData(
                gridData: FlGridData(show: true),
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 40,
                      getTitlesWidget: (value, meta) {
                        return Text(
                          value.toInt().toString(),
                          style: const TextStyle(fontSize: 10),
                        );
                      },
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 30,
                      getTitlesWidget: (value, meta) {
                        return Text(
                          '${value.toInt()}s',
                          style: const TextStyle(fontSize: 10),
                        );
                      },
                    ),
                  ),
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),
                borderData: FlBorderData(show: true),
                lineBarsData: [
                  LineChartBarData(
                    spots:
                        _emotionData
                            .map((data) => FlSpot(data['time'], data['stress']))
                            .toList(),
                    isCurved: true,
                    color: Colors.red,
                    barWidth: 2,
                    dotData: FlDotData(show: false),
                  ),
                  LineChartBarData(
                    spots:
                        _emotionData
                            .map(
                              (data) => FlSpot(data['time'], data['anxiety']),
                            )
                            .toList(),
                    isCurved: true,
                    color: Colors.purple,
                    barWidth: 2,
                    dotData: FlDotData(show: false),
                  ),
                  LineChartBarData(
                    spots:
                        _emotionData
                            .map(
                              (data) =>
                                  FlSpot(data['time'], data['confidence']),
                            )
                            .toList(),
                    isCurved: true,
                    color: Colors.green,
                    barWidth: 2,
                    dotData: FlDotData(show: false),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildKeyInsights() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Key Insights',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          _buildInsightItem('Primary Emotion: $_primaryEmotion', Colors.indigo),
          _buildInsightItem(
            'Peak Stress Level: ${(_summaryStats['peakStress'] ?? 0.0).toStringAsFixed(1)}%',
            Colors.red,
          ),
          _buildInsightItem(
            'Emotional Stability: ${(_summaryStats['emotionalStability'] ?? 0.0).toStringAsFixed(1)}%',
            Colors.green,
          ),
        ],
      ),
    );
  }

  Widget _buildInsightItem(String text, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 8,
            height: 8,
            margin: const EdgeInsets.only(top: 6),
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 16),
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailedResults() {
    return Column(
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
                ...widget.videoAnalysisResult.emotions.entries.map(
                  (entry) => Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Text(
                      '${entry.key}: ${entry.value.map((v) => v.toStringAsFixed(2)).join(", ")}',
                      style: const TextStyle(fontSize: 14),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
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
                ...widget.videoAnalysisResult.mentalHealth.entries.map(
                  (entry) => Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Text(
                      '${entry.key}: ${entry.value}',
                      style: const TextStyle(fontSize: 14),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        if (widget.videoAnalysisResult.voiceAnalysis != null) ...[
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
                  ...widget.videoAnalysisResult.voiceAnalysis!.entries.map(
                    (entry) => Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Text(
                        '${entry.key}: ${entry.value}',
                        style: const TextStyle(fontSize: 14),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
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
                  'Summary',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.kPrimaryColor,
                  ),
                ),
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Text(
                    'Peak Stress: ${widget.videoAnalysisResult.peakStress}',
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Text(
                    'Video Duration: ${widget.videoAnalysisResult.videoDuration} seconds',
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Text(
                    'Total Frames Analyzed: ${widget.videoAnalysisResult.frameData.length}',
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
