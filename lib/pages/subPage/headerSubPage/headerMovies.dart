import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class HeaderMovies extends StatefulWidget {
  final int movieId;
  HeaderMovies({required this.movieId});

  @override
  _HeaderMoviesState createState() => _HeaderMoviesState();
}

class _HeaderMoviesState extends State<HeaderMovies> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  late ChewieController _chewieController;
  List movieLink = [
    'https://stopr004.sh-content.com/v/01/00248/z3p1bdzrpeyu_n/Pathaan_(2023)_Hindi_-_720P_HD.mkv.mp4?t=vcz6wMIVTYao9Vzu8I9OTfe8vVGb13Xr4RBl-dhnoFs&s=1681242801&e=129600&f=1242736&sp=400&i=0.0',
    'https://sugar-2.flsvr.com/d/3vihjdlxt6wfsllhqe422i4npg5r6hary5haz2jwqiqhpp7uyuoowfy7453daghhvijnjurx/Ala%20Vaikunthapurramuloo%20(2020)%20Hindi%20Dubbed%20[Original%20Audio]-720P.mkv',
    'https://sto009noview.sh-content.com/v/01/00315/r8pix1hmv8jk_n/Ice_Age_Continental_Drift_(2012)_Hindi_Dubbed_720P.mkv.mp4?t=f21TbcbaNxvgY5ys7V_m32TV6OLOidCvkHUurCWua_w&s=1681319425&e=129600&f=1575413&sp=400&i=0.0',
    'https://stopr005.sh-content.com/v/01/00229/ibdhmkn5mna4_h/Vaathi_(2023)_Hindi_Dubbed_HD_720P_HDMOVIE2.mkv.mp4?t=HurPHQwzfQldUvZRKEi4szF4hMH2zj4TB0D2GguXrB4&s=1681320660&e=129600&f=1145199&sp=400&i=0.0',
    'https://sugar-2.flsvr.com/d/3vij5xdxt6wfsllhru43mkmqphms2yqsjnh3d6obusvnadgnhufkofhwajnrlffeiqiivnkh/K.G.F%20Chapter%201%20(2018)%20Hindi%20Dubbed%20720P%20HDMOVIE5.mkv',
  ];

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(movieLink[widget.movieId]);
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    _chewieController = ChewieController(
      videoPlayerController: _controller,
      autoPlay: true,
      looping: true,
      autoInitialize: true,
      allowFullScreen: true,
      allowPlaybackSpeedChanging: true,
      showControls: true,
      aspectRatio: null,
      // customControls: _buildCustomControls(context, _chewieController),
      materialProgressColors: ChewieProgressColors(
        playedColor: Colors.red,
        handleColor: Colors.red,
        backgroundColor: Colors.grey,
        bufferedColor: Colors.white,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            FutureBuilder(
              future: _initializeVideoPlayerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Container(
                      color: Colors.black,
                      child: Chewie(
                        controller: _chewieController,
                      ));
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
            Positioned(
              top: 10,
              left: 10,
              child: CircleAvatar(
                backgroundColor: Colors.blue,
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.arrow_back_rounded, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
