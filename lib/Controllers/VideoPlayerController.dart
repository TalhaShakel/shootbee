import 'package:get/get.dart';
import 'package:shootbee/Viwes/Utils/Service&Function.dart';
import 'package:video_player/video_player.dart' as v;

class VideoPlayControllers extends GetxController {
  v.VideoPlayerController? controller;
  Future<void>? initializeVideoPlayerFuture;
  bool videoSelected = false;

  Future<void> playVideo() async {
    final pickedFile = await selectVideo();
    if (pickedFile != null) {
      controller?.dispose();

      controller = v.VideoPlayerController.file(pickedFile);
      initializeVideoPlayerFuture = controller!.initialize();
      videoSelected = true;
      update();
    }
  }

  @override
  void onClose() {
    controller?.dispose();
    super.onClose();
  }
}
