
import 'package:evolvify/core/utils/app_images.dart';
import 'package:flutter/material.dart';

class Recording extends StatelessWidget {
  const Recording({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset(
            Assets.imagesSimulation,
    
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 12,
          left: 12,
          child: Column(
            children: [
              CircleAvatar(
                backgroundColor: Colors.black54,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.mic, color: Colors.white),
                ),
              ),
              SizedBox(height: 8),
              CircleAvatar(
                backgroundColor: Colors.black54,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.video_camera_front,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
              SizedBox(height: 8),
              CircleAvatar(
                backgroundColor: Colors.black54,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.pause, color: Colors.white),
                ),
              ),
              SizedBox(height: 8),
              CircleAvatar(
                backgroundColor: Colors.black54,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.stop, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
        // موجة الصوت
        const Positioned(
          bottom: 12,
          left: 16,
          right: 16,
          child: AudioWaveformPlaceholder(),
        ),
      ],
    );
  }
}
class AudioWaveformPlaceholder extends StatelessWidget {
  const AudioWaveformPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
