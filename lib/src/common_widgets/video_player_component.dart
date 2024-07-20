import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({super.key});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
      // 'lib/assets/176829-856044873_small.mp4'
        'assets/videos/218153_small.mp4'
      // Uri.parse(
      //     // 'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
      //     'lib/assets/218153_small.mp4'),
    );
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Stack(
            children: <Widget>[
              Center(
                child: AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Wrap(
                  children: [
                    VideoProgressIndicator(
                      _controller,
                      allowScrubbing: true,
                      colors: const VideoProgressColors(
                        playedColor: Colors.red,
                        bufferedColor: Colors.grey,
                        backgroundColor: Colors.transparent,
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                    ),
                    SizedBox(
                      height: 200,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          RawMaterialButton(
                            onPressed: () {},
                            shape: const CircleBorder(),
                            fillColor: Colors.grey[500],
                            elevation: 0,
                            child: const Padding(
                              padding: EdgeInsets.all(
                                12.0,
                              ),
                              child: Icon(
                                Icons.forward_10_rounded,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 200,
                            child: RawMaterialButton(
                              onPressed: () {
                                setState(() {
                                  if (_controller.value.isPlaying) {
                                    _controller.pause();
                                  } else {
                                    _controller.play();
                                  }
                                });
                              },
                              shape: const CircleBorder(),
                              fillColor: Colors.grey[500],
                              elevation: 0,
                              child: Padding(
                                padding: const EdgeInsets.all(
                                  12.0,
                                ),
                                child: Icon(
                                  _controller.value.isPlaying
                                      ? Icons.pause
                                      : Icons.play_arrow,
                                ),
                              ),
                            ),
                          ),
                          RawMaterialButton(
                            onPressed: () {},
                            shape: const CircleBorder(),
                            fillColor: Colors.grey[500],
                            elevation: 0,
                            child: const Padding(
                              padding: EdgeInsets.all(
                                12.0,
                              ),
                              child: Icon(
                                Icons.forward_10_rounded,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}