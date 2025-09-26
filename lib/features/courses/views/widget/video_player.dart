import 'package:dartcoder/features/courses/views/widget/full_screen_video.dart';
import 'package:dartcoder/shared/assets.dart';
import 'package:dartcoder/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:video_player/video_player.dart';

class CustomVideoPlayer extends StatefulWidget {
  final String videoUrl;

  const CustomVideoPlayer({super.key, required this.videoUrl});

  @override
  State<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  late VideoPlayerController _controller;
  bool _isPlaying = false;
  bool _showControls = true;
  Duration _position = Duration.zero;
  Duration _duration = Duration.zero;

  @override
  void initState() {
    super.initState();
    _initializeVideoPlayer();
  }

  void _initializeVideoPlayer() async {
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));
    await _controller.initialize();

    _controller.addListener(() {
      setState(() {
        _position = _controller.value.position;
        _duration = _controller.value.duration;
      });
    });

    setState(() {});
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _togglePlayPause() {
    setState(() {
      if (_controller.value.isPlaying) {
        _controller.pause();
        _isPlaying = false;
      } else {
        _controller.play();
        _isPlaying = true;
      }
    });
  }

  void _onSeek(double value) {
    final position = Duration(
      milliseconds: (value * _duration.inMilliseconds).round(),
    );
    _controller.seekTo(position);
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final videoWidth = screenWidth * 0.9;
    final videoHeight = videoWidth / 1.7777777777777777;
    return SizedBox(
      width: videoWidth,
      height: videoHeight,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: AnimatedCrossFade(
            crossFadeState: _controller.value.isInitialized
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 500),
            firstChild: Shimmer(
              duration: const Duration(seconds: 2),
              interval: const Duration(seconds: 0),
              color: Colors.white,
              colorOpacity: 0.5,
              enabled: true,
              direction: const ShimmerDirection.fromLTRB(),
              child: Container(
                width: videoWidth,
                height: videoHeight,
                decoration: BoxDecoration(
                  color: AppColors.appBlue.withValues(alpha: .3),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            secondChild: GestureDetector(
              onTap: () {
                setState(() {
                  _showControls = !_showControls;
                });
              },
              child: SizedBox(
                width: videoWidth,
                height: videoHeight,
                child: Stack(
                  children: [
                    // Video player
                    VideoPlayer(_controller),
                    if (_showControls)
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.transparent,
                              Colors.transparent,
                              AppColors.black.withValues(alpha: 0.5),
                            ],
                          ),
                        ),
                      ),

                    if (_showControls)
                      Align(
                        alignment: Alignment.center,
                        child: GestureDetector(
                          onTap: _togglePlayPause,
                          child: Container(
                            margin: EdgeInsets.only(bottom: 10.h),
                            width: 40.h,
                            height: 40.h,
                            decoration: BoxDecoration(
                              color: AppColors.black.withValues(alpha: 0.5),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              _isPlaying ? Icons.pause : Icons.play_arrow,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                        ),
                      ),

                    if (_showControls)
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: 16.w,
                            right: 16.w,
                            bottom: 10.h,
                          ),
                          child: Row(
                            children: [
                              // Speaker icon

                              Assets.svgs.volumeUp.svg(
                                width: 12.w,
                                height: 12.h,
                                color: Colors.white,
                              ),
                              SizedBox(width: 10.w),
                              // Progress slider
                              Expanded(
                                child: SliderTheme(
                                  data: SliderTheme.of(context).copyWith(
                                    activeTrackColor: AppColors.appBlue,
                                    inactiveTrackColor:
                                        AppColors.grey.withValues(alpha: 0.3),
                                    thumbColor: Colors.white,
                                    thumbShape: const RoundSliderThumbShape(
                                      enabledThumbRadius: 6,
                                    ),
                                    trackHeight: 4,
                                  ),
                                  child: Slider(
                                    value: _duration.inMilliseconds > 0
                                        ? _position.inMilliseconds /
                                            _duration.inMilliseconds
                                        : 0.0,
                                    onChanged: _onSeek,
                                  ),
                                ),
                              ),

                              SizedBox(width: 10.w),
                              Text(
                                _formatDuration(_position),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.sp,
                                    ),
                              ),
                              SizedBox(width: 4.w),

                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    PageRouteBuilder(
                                      pageBuilder: (
                                        context,
                                        animation,
                                        secondaryAnimation,
                                      ) {
                                        return FullscreenVideoPlayer(
                                          controller: _controller,
                                          onExit: () {
                                            // Optional: Add any cleanup or state synchronization here
                                            setState(() {
                                              // Refresh the UI when returning from fullscreen
                                            });
                                          },
                                        );
                                      },
                                      transitionDuration: const Duration(
                                        milliseconds: 300,
                                      ),
                                      transitionsBuilder: (
                                        context,
                                        animation,
                                        secondaryAnimation,
                                        child,
                                      ) {
                                        return FadeTransition(
                                          opacity: animation,
                                          child: child,
                                        );
                                      },
                                    ),
                                  );
                                },
                                child: const Icon(
                                  Icons.fullscreen,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
