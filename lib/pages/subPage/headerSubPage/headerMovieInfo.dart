import 'package:bi_launcher/providers/sectionControls.dart';
import 'package:bi_launcher/widgets/waitingForInfo.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Widget HeaderMovieInfo({
  required Size size,
  required int Function(Map<String, dynamic> movieInfo) getReleaseYear,
  required String Function(Map<String, dynamic> movieInfo) getMovieLength,
  required double Function(Map<String, dynamic> movieInfo) getRating,
  required String Function(Map<String, dynamic> movieInfo) getCast,
  required String Function(Map<String, dynamic> movieInfo) getGenres,
  List<Map<String, dynamic>>? moviesDetails,
  required HeaderMoviesCtrl isHeaderMovie,
  required String link1,
  required String link2,
  required String link3,
  required String link4,
  required String link5,
}) {
  late Uri url;
  return Visibility(
    visible: isHeaderMovie.isHeaderMovie,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        height: size.height * 0.35,
        child: moviesDetails == null
            ? WaitingForInfo(
                size: size,
              )
            : ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: moviesDetails.length,
                itemBuilder: (context, index) {
                  final movieInfo = moviesDetails[index];
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    height: size.height * 0.35,
                    width: size.width * 0.45,
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
                    child: Column(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                Image.network(
                                  'https://image.tmdb.org/t/p/original/${movieInfo['poster_path']}',
                                  height: size.height * 0.35 / 2,
                                  width: size.height * 0.35 / 2,
                                  fit: BoxFit.fill,
                                ),
                                SizedBox(width: 10),
                                SizedBox(
                                  width: size.width * 0.32,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${movieInfo['title']} (${getReleaseYear(movieInfo)})",
                                        style: TextStyle(
                                          overflow: TextOverflow.ellipsis,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        "${getGenres(movieInfo)}",
                                        style: TextStyle(
                                          overflow: TextOverflow.ellipsis,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.teal,
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        "⭐ ${getRating(movieInfo)}/10 ▪ ${getMovieLength(movieInfo)}",
                                        style: TextStyle(
                                          overflow: TextOverflow.ellipsis,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.teal,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "${getCast(movieInfo)}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.teal,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.blue,
                                    radius: 30,
                                    child: IconButton(
                                      onPressed: () async {
                                        switch (index) {
                                          case 0:
                                            {
                                              url = Uri.parse(link1);
                                              break;
                                            }
                                          case 1:
                                            {
                                              url = Uri.parse(link2);
                                              break;
                                            }
                                          case 2:
                                            {
                                              url = Uri.parse(link3);
                                              break;
                                            }
                                          case 3:
                                            {
                                              url = Uri.parse(link4);
                                              break;
                                            }
                                          default:
                                            {
                                              url = Uri.parse(link5);
                                              break;
                                            }
                                        }
                                        if (await canLaunchUrl(url)) {
                                          await launchUrl(url,
                                              mode: LaunchMode
                                                  .externalApplication);
                                        }
                                      },
                                      icon: Icon(
                                        Icons.play_arrow,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
      ),
    ),
  );
}
