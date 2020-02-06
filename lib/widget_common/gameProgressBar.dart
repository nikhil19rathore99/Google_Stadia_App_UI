import 'package:flutter/material.dart';
import 'package:google_stadia_ui/styles/colors.dart';

class GameProgressBar extends StatefulWidget {
  final double gameProgress, screenWidth;

  const GameProgressBar({Key key, this.gameProgress, this.screenWidth})
      : super(key: key);

  @override
  _GameProgressBarState createState() => _GameProgressBarState();
}

class _GameProgressBarState extends State<GameProgressBar>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> progressAnimation;
  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 1500));
    progressAnimation = Tween<double>(
            begin: 0, end: widget.screenWidth * 0.33 * widget.gameProgress)
        .animate(controller);
    controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = widget.screenWidth * 0.33;

    return AnimatedBuilder(
      animation: progressAnimation,
      builder: (context, widget) {
        return Stack(
          children: <Widget>[
            Container(
              width: width,
              height: 10.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                border: Border.all(color: tertiaryTextColor, width: 1),
              ),
            ),
            Container(
              width: progressAnimation.value,
              height: 10.0,
              decoration: BoxDecoration(
                gradient: appGradient,
                borderRadius: BorderRadius.all(Radius.circular(4)),
              ),
            ),
          ],
        );
      },
    );
  }
}
