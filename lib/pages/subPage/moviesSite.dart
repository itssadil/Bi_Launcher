import 'package:bi_launcher/providers/sectionControls.dart';
import 'package:bi_launcher/widgets/sectionTitle.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class MoviesSite extends StatelessWidget {
  const MoviesSite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('movieSite').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError ||
            snapshot.connectionState == ConnectionState.waiting ||
            snapshot == null) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        if (snapshot != null && snapshot.data != null) {
          print("aaaaaaaaaaaaaaaaaaaaaaa ${snapshot.data!.docs[0]["name"]}");
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
                        sitesMethod(size, snapshot.data!.docs, 0),
                        sitesMethod(size, snapshot.data!.docs, 1),
                        sitesMethod(size, snapshot.data!.docs, 2),
                        sitesMethod(size, snapshot.data!.docs, 3),
                        sitesMethod(size, snapshot.data!.docs, 4),
                      ],
                    )
                  ],
                ),
              );
            },
          );
        }

        return Container();
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
