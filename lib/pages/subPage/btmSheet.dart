import 'package:bi_launcher/widgets/allApps.dart';
import 'package:flutter/material.dart';

class BtmSheet extends StatelessWidget {
  const BtmSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: -5,
      top: MediaQuery.of(context).size.height * 0.35,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(50, 55),
          backgroundColor: Colors.black45,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Icon(Icons.apps),
        onPressed: () {
          showModalBottomSheet(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            context: context,
            builder: (context) {
              return Stack(
                children: [
                  SingleChildScrollView(
                    padding: EdgeInsets.only(top: 55),
                    child: AllApps(
                      appschildAspectRatio: 1.0,
                      isClr: false,
                      appsCrossAxisCount: 8,
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 10,
                    child: CircleAvatar(
                      backgroundColor: Colors.indigo,
                      radius: 25,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_rounded,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              );
            },
          );
        },
      ),
    );
  }
}
