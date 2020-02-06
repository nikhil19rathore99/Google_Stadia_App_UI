import 'package:flutter/material.dart';
import 'package:google_stadia_ui/models/last_played_game.dart';
import 'package:google_stadia_ui/styles/text_styles.dart';
import 'package:google_stadia_ui/widget_common/gameProgressBar.dart';

class LastPlayedGameTile extends StatelessWidget {
  final LastPlayedGame lastPlayedGame;
  final double screenWidth;
  final double gameProgress;

  const LastPlayedGameTile(
      {Key key, this.lastPlayedGame, this.screenWidth, this.gameProgress})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Row(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      child: Image.asset(
                        lastPlayedGame.imagePath,
                        height: 60.0,
                        width: 45.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 0,
                      left: 8.0,
                      right: 8.0,
                      bottom: 0.0,
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white54),
                        child: Icon(
                          Icons.play_arrow,
                          color: Colors.red,
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: lastPlayedGame.name,
                            style: headingTwoTextStyle),
                        TextSpan(text: '\n'),
                        TextSpan(
                            text: "${lastPlayedGame.hoursPlayed} hours played",
                            style: bodyTextStyle),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: GameProgressBar(
                screenWidth: screenWidth, gameProgress: gameProgress),
          ),
        ],
      ),
    );
  }
}
