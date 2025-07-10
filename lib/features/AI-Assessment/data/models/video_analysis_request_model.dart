class VideoAnalysisRequestModel {
  final String videoPath;
  final int? frameSkip;
  final int? maxFrames;
  final String? analysisType; // 'presentation', 'interview', etc.

  VideoAnalysisRequestModel({
    required this.videoPath,
    this.frameSkip,
    this.maxFrames,
    this.analysisType,
  });

  Map<String, dynamic> toJson() {
    return {
      'video_path': videoPath,
      'frame_skip': frameSkip,
      'max_frames': maxFrames,
      'analysis_type': analysisType,
    };
  }

  factory VideoAnalysisRequestModel.fromJson(Map<String, dynamic> json) {
    return VideoAnalysisRequestModel(
      videoPath: json['video_path'] as String,
      frameSkip: json['frame_skip'] as int?,
      maxFrames: json['max_frames'] as int?,
      analysisType: json['analysis_type'] as String?,
    );
  }
}
