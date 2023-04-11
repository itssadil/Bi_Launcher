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
    'https://sto213.akamai-video-content.com/tysxeiu6og76j6cdactdvtceolh5ctqsw2lymkiiybx6pxde2ybw65njuhfa/Brahmastra_Part_One_-_Shiva_(2022_Hindi_HD_Hotstar_-_720P.mkv.mp4',
    'https://s-delivery36.mxdcontent.net/d/j9x88vqlse1qgx/kxchh5azpknfh83lg7zjyijp8voww4?ab=0&r=https%3A%2F%2Fmixdrop.gl%2Ff%2Fj9x88vqlse1qgx',
    'https://s-delivery51.mxdcontent.net/d/4n1l90lqt63pm3/xsa3zi2y1c2cu997ennoiyvgbxgq?ab=0&r=https%3A%2F%2Fmixdrop.ch%2Ff%2F4n1l90lqt63pm3',
    'https://nioucmyycmwloavuppra.akamai-video-content.com/tysxfbrpww7oj6cdadbdjgsdevmtwgow5dluhu4wtmxvxryqrocunrvnx7la/Varisu_(2023)_Hindi_Dubbed_AMZN_720P_HDMOVIE2.mkv.mp4',
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
