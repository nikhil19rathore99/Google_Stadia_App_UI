import 'package:flutter/material.dart';
import 'package:google_stadia_ui/styles/colors.dart';
import 'package:google_stadia_ui/styles/text_styles.dart';
import 'package:vector_math/vector_math_64.dart' as math;

class RoundedImage extends StatelessWidget {
  final isOnline;
  final bool showRanking;
  final int ranking;
  final String imagePath;
  final String name;
  final imageSize = 80.0;

  const RoundedImage({Key key, this.isOnline = false, this.showRanking = false, this.ranking, @required this.imagePath, this.name = ""})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          height: imageSize + 8,
          child: Stack(
            children: <Widget>[
              CustomPaint(
                painter: RoundedImageBorder(isOnline: isOnline),
                child: Container(
                  width: imageSize,
                  height: imageSize,
                  child: ClipOval(
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              if (showRanking)
                Positioned(
                  bottom: 0.0,
                  right: 0.0,
                  child: ClipOval(
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(gradient: appGradient),
                      child: Center(
                        child: Text(
                          ranking.toString(),
                          style: rankTextStyle,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
        if (name != null) Text(name, style: bodyTextStyle,)
      ],
    );
  }
}

class RoundedImageBorder extends CustomPainter {
  final bool isOnline;

  RoundedImageBorder({this.isOnline});

  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width / 2, size.height / 2);

    Paint borderPaint = Paint()
      ..strokeCap = StrokeCap.butt
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0;

    if (isOnline) {
      borderPaint.shader = appGradient.createShader(Rect.fromCircle(center: center, radius: size.width / 2));
    } else {
      borderPaint.color = tertiaryTextColor;
    }

    canvas.drawArc(Rect.fromCircle(center: center, radius: size.width / 2), math.radians(-90), math.radians(360), false, borderPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}