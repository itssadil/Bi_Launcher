import 'package:bi_launcher/providers/sectionControls.dart';
import 'package:bi_launcher/widgets/sectionTitle.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class MoviesSite extends StatelessWidget {
  const MoviesSite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List moviesLink = [
      {
        "name": "Goku.to",
        "link": "https://goku.sx/home",
      },
      {
        "name": "Movies Flix",
        "link": "https://www.hindimoviestv.com/",
      },
      {
        "name": "Zee5",
        "link": "https://zee5.vin/",
      },
      {
        "name": "mFlix",
        "link": "https://www.youtube.com/@RGEntertainmentIndia/videos",
      },
      {
        "name": "Goldmines",
        "link": "https://www.youtube.com/@GrandMasterMoviesOfficial/videos",
      },
    ];
    Size size = MediaQuery.of(context).size;
    return Consumer<SiteCtrl>(
      builder: (context, isSite, child) {
        return Visibility(
          visible: isSite.isSite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionTitle(title: "Movies Site"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  sitesMethod(size, moviesLink, 0),
                  sitesMethod(size, moviesLink, 1),
                  sitesMethod(size, moviesLink, 2),
                  sitesMethod(size, moviesLink, 3),
                  sitesMethod(size, moviesLink, 4),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  Widget sitesMethod(size, moviesLink, i) {
    Uri url = Uri.parse(moviesLink[i]["link"]);
    return InkWell(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        width: size.width * 0.18,
        color: Colors.black38,
        padding: EdgeInsets.all(18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.change_circle_outlined),
            SizedBox(width: 10),
            Text(
              moviesLink[i]["name"],
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
      onTap: () async {
        if (await canLaunchUrl(url)) {
          await launchUrl(url, mode: LaunchMode.externalApplication);
        }
      },
    );
  }
}
