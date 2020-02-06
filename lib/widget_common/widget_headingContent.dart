import 'package:flutter/material.dart';
import '../styles/text_styles.dart';

class ContentHeading extends StatelessWidget {
  final String heading;

  const ContentHeading({Key key, @required this.heading}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      child: Text(
        heading,
        style: headingOneTextStyle,
      ),
    );
  }
}
