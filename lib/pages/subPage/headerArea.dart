import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class HeaderArea extends StatefulWidget {
  const HeaderArea({Key? key}) : super(key: key);

  @override
  State<HeaderArea> createState() => _HeaderAreaState();
}

class _HeaderAreaState extends State<HeaderArea> {
  // late YoutubePlayerController _controller;
  //
  // @override
  // void initState() {
  //   super.initState();
  //   _controller = YoutubePlayerController(
  //     initialVideoId: '6UeLU0uWGbU',
  //     flags: YoutubePlayerFlags(
  //       autoPlay: false,
  //       mute: false,
  //       controlsVisibleAtStart: true,
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.none,
        child: Row(
          children: [
            // Container(
            //   margin: EdgeInsets.symmetric(horizontal: 5),
            //   height: size.height * 0.35,
            //   width: size.width * 0.6,
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.all(Radius.circular(5)),
            //     boxShadow: [
            //       BoxShadow(
            //         color: Colors.red.withOpacity(0.2),
            //         spreadRadius: 1,
            //         blurRadius: 7,
            //         offset: Offset(0, 3), // changes position of shadow
            //       ),
            //     ],
            //     color: Color(0xFF18122B),
            //   ),
            //   child: YoutubePlayer(
            //     controller: _controller,
            //     showVideoProgressIndicator: true,
            //     progressIndicatorColor: Colors.red,
            //   ),
            // ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              height: size.height * 0.35,
              width: size.width * 0.6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.red.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                color: Color(0xFF18122B),
              ),
              child: RiveAnimation.asset(
                "assets/rive/app_loading.riv",
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              height: size.height * 0.35,
              width: size.width * 0.6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.red.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                color: Color(0xFF18122B),
              ),
              child: RiveAnimation.asset(
                "assets/rive/app_loading.riv",
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              height: size.height * 0.35,
              width: size.width * 0.6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.red.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                color: Color(0xFF18122B),
              ),
              child: RiveAnimation.asset(
                "assets/rive/app_loading.riv",
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              height: size.height * 0.35,
              width: size.width * 0.6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.red.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                color: Color(0xFF18122B),
              ),
              child: RiveAnimation.asset(
                "assets/rive/app_loading.riv",
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
