import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

///I wasn't paid for my work so far till this point.

class FullscreenVideoPlayer extends StatefulWidget {
  final VideoPlayerController controller;
  final VoidCallback onExit;

  const FullscreenVideoPlayer({
    super.key,
    required this.controller,
    required this.onExit,
  });

  @override
  State<FullscreenVideoPlayer> createState() => _FullscreenVideoPlayerState();
}

class _FullscreenVideoPlayerState extends State<FullscreenVideoPlayer> {
  bool _showControls = true;
  Duration _position = Duration.zero;
  Duration _duration = Duration.zero;
  Timer? _hideControlsTimer;

  @override
  void initState() {
    super.initState();

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    // Listen to video controller changes
    widget.controller.addListener(_videoListener);
    _position = widget.controller.value.position;
    _duration = widget.controller.value.duration;

    // Start timer to hide controls
    _startHideControlsTimer();
  }

  @override
  void dispose() {
    widget.controller.removeListener(_videoListener);
    _hideControlsTimer?.cancel();

    // Restore portrait orientation and show system UI
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
    super.dispose();
  }

  void _videoListener() {
    if (mounted) {
      setState(() {
        _position = widget.controller.value.position;
        _duration = widget.controller.value.duration;
      });
    }
  }

  void _startHideControlsTimer() {
    _hideControlsTimer?.cancel();
    _hideControlsTimer = Timer(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          _showControls = false;
        });
      }
    });
  }

  void _showControlsTemporarily() {
    setState(() {
      _showControls = true;
    });
    _startHideControlsTimer();
  }

  void _togglePlayPause() {
    if (widget.controller.value.isPlaying) {
      widget.controller.pause();
    } else {
      widget.controller.play();
    }
    _showControlsTemporarily();
  }

  void _onSeek(double value) {
    final position = Duration(
      milliseconds: (value * _duration.inMilliseconds).round(),
    );
    widget.controller.seekTo(position);
    _showControlsTemporarily();
  }

  void _exitFullscreen() {
    widget.onExit();
    Navigator.of(context).pop();
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = duration.inHours;
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    if (hours > 0) {
      return '$hours:$minutes:$seconds';
    }
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: _showControlsTemporarily,
        child: Stack(
          children: [
            // Video player
            Center(
              child: AspectRatio(
                aspectRatio: widget.controller.value.aspectRatio,
                child: VideoPlayer(widget.controller),
              ),
            ),

            // Controls overlay
            AnimatedOpacity(
              opacity: _showControls ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 300),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.3),
                      Colors.transparent,
                      Colors.transparent,
                      Colors.black.withOpacity(0.7),
                    ],
                  ),
                ),
                child: Stack(
                  children: [
                    // Top controls
                    Positioned(
                      top: MediaQuery.of(context).padding.top + 10,
                      left: 20,
                      right: 20,
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: _exitFullscreen,
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                                size: 24,
                              ),
                            ),
                          ),
                          const Spacer(),
                          // Add more top controls here if needed (like settings, etc.)
                        ],
                      ),
                    ),

                    // Center play/pause button
                    Center(
                      child: GestureDetector(
                        onTap: _togglePlayPause,
                        child: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.6),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            widget.controller.value.isPlaying
                                ? Icons.pause
                                : Icons.play_arrow,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
                    ),

                    // Bottom controls
                    Positioned(
                      bottom: MediaQuery.of(context).padding.bottom + 20,
                      left: 20,
                      right: 20,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Progress bar
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              activeTrackColor: Colors.red,
                              inactiveTrackColor: Colors.white.withOpacity(0.3),
                              thumbColor: Colors.red,
                              thumbShape: const RoundSliderThumbShape(
                                enabledThumbRadius: 8,
                              ),
                              trackHeight: 4,
                              overlayShape: const RoundSliderOverlayShape(
                                overlayRadius: 16,
                              ),
                            ),
                            child: Slider(
                              value: _duration.inMilliseconds > 0
                                  ? _position.inMilliseconds /
                                        _duration.inMilliseconds
                                  : 0.0,
                              onChanged: _onSeek,
                            ),
                          ),

                          const SizedBox(height: 10),

                          // Time and controls row
                          Row(
                            children: [
                              // Current time
                              Text(
                                _formatDuration(_position),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),

                              const Spacer(),

                              // Rewind button
                              GestureDetector(
                                onTap: () {
                                  final newPosition =
                                      _position - const Duration(seconds: 10);
                                  widget.controller.seekTo(
                                    newPosition.isNegative
                                        ? Duration.zero
                                        : newPosition,
                                  );
                                  _showControlsTemporarily();
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  child: const Icon(
                                    Icons.replay_10,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                ),
                              ),

                              const SizedBox(width: 20),

                              // Fast forward button
                              GestureDetector(
                                onTap: () {
                                  final newPosition =
                                      _position + const Duration(seconds: 10);
                                  widget.controller.seekTo(
                                    newPosition > _duration
                                        ? _duration
                                        : newPosition,
                                  );
                                  _showControlsTemporarily();
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  child: const Icon(
                                    Icons.forward_10,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                ),
                              ),

                              const Spacer(),

                              // Total time
                              Text(
                                _formatDuration(_duration),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// // Extension method to add to your CustomVideoPlayer class
// extension CustomVideoPlayerExtension on _CustomVideoPlayerState {
//   void _enterFullscreen() {
//     Navigator.of(context).push(
//       PageRouteBuilder(
//         pageBuilder: (context, animation, secondaryAnimation) {
//           return FullscreenVideoPlayer(
//             controller: _controller,
//             onExit: () {
//               // Optional: Add any cleanup or state synchronization here
//             },
//           );
//         },
//         transitionDuration: const Duration(milliseconds: 300),
//         transitionsBuilder: (context, animation, secondaryAnimation, child) {
//           return FadeTransition(opacity: animation, child: child);
//         },
//       ),
//     );
//   }
// }
