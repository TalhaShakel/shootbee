import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

class ShortsVideoPlayScreens extends StatelessWidget {
  const ShortsVideoPlayScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Video
          // VideoPlayerWidget(videoUrl: 'your_video_url.mp4'),
          Image.asset(
            "assets/ImageGirl.png",
            fit: BoxFit.cover,
          ),

          // Overlay buttons
          Positioned(
            // top: 0,
            bottom: 100,
            right: 10,
            child: Column(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.favorite,
                    color: Vx.white,
                    size: 40,
                  ),
                  onPressed: () {
                    // Code for handling the like button click event
                    // Add your logic here
                    print('Like button clicked');
                  },
                ),
                20.heightBox,
                IconButton(
                  icon: Icon(
                    Icons.comment,
                    color: Vx.white,
                    size: 40,
                  ),
                  onPressed: () {
                    // Code for handling the comment button click event
                    // Add your logic here
                    print('Comment button clicked');
                  },
                ),
                20.heightBox,
                IconButton(
                  icon: Icon(
                    Icons.share,
                    color: Vx.yellow100,
                    size: 40,
                  ),
                  onPressed: () {
                    // Code for handling the share button click event
                    // Add your logic here
                    print('Share button clicked');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
