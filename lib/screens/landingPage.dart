import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_stadia_ui/assets_images.dart';
import 'package:google_stadia_ui/models/friends.dart';
import 'package:google_stadia_ui/models/last_played_game.dart';
import 'package:google_stadia_ui/screens/second_screen.dart';
import 'package:google_stadia_ui/styles/colors.dart';
import 'package:google_stadia_ui/styles/text_styles.dart';
import 'package:google_stadia_ui/widget_common/last_playedGameTile.dart';
import 'package:google_stadia_ui/widget_common/rounded_image.dart';
import 'package:google_stadia_ui/widget_common/widget_headingContent.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Transform.translate(
              child: Transform.rotate(
                child: SvgPicture.asset(
                  logo,
                  height: screenHeight * 0.4,
                  color: logoTintColor,
                ),
                angle: -0.1,
              ),
              offset: Offset(screenWidth * 0.4, 10)),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(height: 60),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      InkWell(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SecondaryScreen()),
                        ),
                        child: Icon(
                          Icons.menu,
                          color: primaryTextColor,
                          size: 30.0,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.search),
                        iconSize: 30.0,
                        color: primaryTextColor,
                        onPressed: () => print('search'),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Row(
                          children: <Widget>[
                            RoundedImage(
                                imagePath: player1,
                                ranking: 39,
                                showRanking: true,
                                isOnline: true),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.0),
                              child: RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                      text: "Hola!!", style: userNameTextStyle),
                                  TextSpan(text: '\n'),
                                  TextSpan(
                                      text: "Nikhil Rathore",
                                      style: userNameTextStyle),
                                ]),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 16.0, top: 16.0, bottom: 32.0),
                        child: Material(
                          elevation: 4.0,
                          borderRadius: BorderRadius.circular(12.0),
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: 16.0,
                                left: 16.0,
                                right: 16.0,
                                bottom: 32.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Text("HOURS PLAYED",
                                        style: hoursPlayedLabelTextStyle),
                                  ],
                                ),
                                SizedBox(height: 4.0),
                                Text("297 HOURS", style: hoursPlayedTextStyle),
                              ],
                            ),
                          ),
                        ),
                      ),
                      ContentHeading(heading: "Last played games"),
                      for (var i = 0; i < lastPlayedGames.length; i++)
                        LastPlayedGameTile(
                          lastPlayedGame: lastPlayedGames[i],
                          screenWidth: screenWidth,
                          gameProgress: lastPlayedGames[i].gameProgress,
                        ),
                      ContentHeading(heading: "Friends"),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Row(
                      children: <Widget>[
                        for (var i = 0; i < friends.length; i++)
                          RoundedImage(
                            imagePath: friends[i].imagePath,
                            isOnline: friends[i].isOnline,
                            name: friends[i].name,
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
