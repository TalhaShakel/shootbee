import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shootbee/Viwes/Utils/AppColors.dart';
import 'package:video_player/video_player.dart';
import 'dart:io';

class VideoPlayerScreen extends StatefulWidget {
  final XFile video;

  const VideoPlayerScreen({Key? key, required this.video}) : super(key: key);

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.file(File(widget.video.path));
    _initializeVideoPlayerFuture = _controller.initialize().then((_) {
      setState(() {});
    });
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder(
            future: _initializeVideoPlayerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return GestureDetector(
                  onTap: _togglePlayPause,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    ),
                  ),
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.done,
          color: MyColor.bgColor,
        ),
        backgroundColor: MyColor.darkPink,
      ),
    );
  }
}



// class VideoPlayerScreen extends StatelessWidget {
//   XFile video;
//   VideoPlayerScreen({super.key, required this.video});

//   final VideoPlayControllers controller = Get.put(VideoPlayControllers());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Video Player'),
//       ),
//       body: GetBuilder<VideoPlayControllers>(
//         builder: (_) {
//           if (controller.videoSelected) {
//             return FutureBuilder(
//               future: controller.initializeVideoPlayerFuture,
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.done) {
//                   return AspectRatio(
//                     aspectRatio: controller.controller!.value.aspectRatio,
//                     child: VideoPlayer(controller.controller!),
//                   );
//                 } else {
//                   return CircularProgressIndicator();
//                 }
//               },
//             );
//           } else {
//             return Center(child: Text('No video selected'));
//           }
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: controller.playVideo,
//         child: Icon(Icons.play_arrow),
//       ),
//     );
//   }
// }
