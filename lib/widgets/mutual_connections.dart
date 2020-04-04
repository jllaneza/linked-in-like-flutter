import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants.dart';

final textStyle = TextStyle(
  fontSize: 12,
  height: 1.334,
  color: kColorGrey,
);
final svgColor = kColorGrey;
final svgAsset = 'assets/member-insights.svg';

class MutualConnections extends StatelessWidget {
  final int connections;
  final int maxLines;

  MutualConnections({
    this.connections,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SvgPicture.asset(
          svgAsset,
          color: svgColor,
        ),
        SizedBox(
          width: 5.0,
        ),
        Expanded(
          flex: 2,
          child: Text(
            '$connections mutual connections',
            overflow: TextOverflow.ellipsis,
            maxLines: maxLines,
            style: textStyle,
          ),
        ),
      ],
    );
  }
}
