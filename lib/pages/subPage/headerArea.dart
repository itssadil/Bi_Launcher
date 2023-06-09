import 'dart:convert';

import 'package:bi_launcher/pages/subPage/headerSubPage/headerMovieInfo.dart';
import 'package:bi_launcher/providers/sectionControls.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class HeaderArea extends StatefulWidget {
  const HeaderArea({Key? key}) : super(key: key);

  @override
  State<HeaderArea> createState() => _HeaderAreaState();
}

class _HeaderAreaState extends State<HeaderArea> {
  late Future<List> _movies;
  List<int> movieIds = [];

  Future<List> fetchMovies() async {
    var result = await FirebaseFirestore.instance.collection('bimovies').get();
    if (result.docs.isEmpty) {
      return [];
    }
    var moviesList = [];
    for (var doc in result.docs) {
      moviesList.add(doc.data());
      movieIds.add(doc["mid"]);
    }
    return moviesList;
  }

  @override
  void initState() {
    super.initState();
    _movies = fetchMovies();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // future: FirebaseFirestore.instance.collection('bmovies').get(),
      future: _movies,
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasError ||
            snapshot.connectionState == ConnectionState.waiting ||
            snapshot == null) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        if (snapshot != null && snapshot.data != null) {
          return HeaderAreaII(movieIds, snapshot.data!);
        }

        return Container();
      },
    );
  }
}

/*===========================================================================
                           Fetch Data From Firestore 
===========================================================================*/

class HeaderAreaII extends StatefulWidget {
  List<int> movieIds;
  List moviesLink;
  HeaderAreaII(this.movieIds, this.moviesLink);

  @override
  State<HeaderAreaII> createState() => _HeaderAreaIIState();
}

class _HeaderAreaIIState extends State<HeaderAreaII> {
  List<Map<String, dynamic>>? _moviesInfo;

  @override
  void initState() {
    super.initState();
    _getMoviesInfo();
  }

  Future<void> _getMoviesInfo() async {
    final String apiKey = 'b76a2dbf8c9342e2d6eb6b2c2e8c8a60';
    // final List<int> movieIds = [
    //   864692,
    //   496331,
    //   57800,
    //   585268,
    //   20453
    // ]; // The TMDB IDs of the movies
    final String url =
        'https://api.themoviedb.org/3/movie/{movieId}?api_key=$apiKey&append_to_response=credits';

    final moviesInfo = <Map<String, dynamic>>[];
    for (final movieId in widget.movieIds) {
      final response = await http
          .get(Uri.parse(url.replaceFirst('{movieId}', movieId.toString())));
      if (response.statusCode == 200) {
        moviesInfo.add(json.decode(response.body));
      } else {
        throw Exception('Failed to load movie information');
      }
    }

    setState(() {
      _moviesInfo = moviesInfo;
    });
  }

  String _getGenres(Map<String, dynamic> movieInfo) {
    List<dynamic> genres = movieInfo['genres'];
    return genres.map((genre) => genre['name']).join(', ');
  }

  String _getCast(Map<String, dynamic> movieInfo) {
    List<dynamic> cast = movieInfo['credits']['cast'];
    return cast.take(3).map((person) => person['name']).join(', ');
  }

  int _getReleaseYear(Map<String, dynamic> movieInfo) {
    String releaseDate = movieInfo['release_date'];
    return int.parse(releaseDate.split('-')[0]);
  }

  double _getRating(Map<String, dynamic> movieInfo) {
    double rating = movieInfo['vote_average'];
    return (rating * 10).roundToDouble() / 10;
  }

  String _getMovieLength(Map<String, dynamic> movieInfo) {
    int totalMinutes = movieInfo['runtime'];
    int hours = totalMinutes ~/ 60;
    int minutes = totalMinutes % 60;
    return '$hours hr $minutes min';
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<HeaderMoviesCtrl>(
      builder: (context, isHeaderMovie, child) {
        return Column(
          children: [
            /*===============================================================
                                    HEADER MOVIE INFO
            ================================================================*/

            HeaderMovieInfo(
              isHeaderMovie: isHeaderMovie,
              size: size,
              getReleaseYear: _getReleaseYear,
              getMovieLength: _getMovieLength,
              getRating: _getRating,
              getCast: _getCast,
              getGenres: _getGenres,
              moviesDetails: _moviesInfo,
              // link1: "https://goku.sx/movie/watch-pathaan-94630",
              // link2: "https://goku.sx/movie/watch-brahmastra-41699",
              // link3:
              //     "https://goku.sx/movie/watch-ice-age-continental-drift-19231",
              // link4: "https://goku.sx/movie/watch-war-41589",
              // link5: "https://goku.sx/movie/watch-3-idiots-69690",
              link1: widget.moviesLink[0]["url"],
              link2: widget.moviesLink[1]["url"],
              link3: widget.moviesLink[2]["url"],
              link4: widget.moviesLink[3]["url"],
              link5: widget.moviesLink[4]["url"],
            ),
          ],
        );
      },
    );
  }
}
