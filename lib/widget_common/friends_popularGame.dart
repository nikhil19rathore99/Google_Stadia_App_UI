import 'package:flutter/material.dart';
import 'package:google_stadia_ui/styles/text_styles.dart';

class FriendPopularGames extends StatelessWidget {
  final String imgPath;

  const FriendPopularGames({Key key, @required this.imgPath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: Image.asset(imgPath)),
          ),
          Positioned(
            bottom: 10,
            left: 20,
            right: 20,
            child: InkWell(
              onTap: null,
              child: Material(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                elevation: 4,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Text(
                    "Play",
                    textAlign: TextAlign.center,
                    style: playWhiteTextStyle,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
