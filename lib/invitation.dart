import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'circular_icon_button.dart';
import 'constants.dart';

const iconButtonBorderWidth = 1.0;
final cancelButtonBorder = BorderSide(
  width: iconButtonBorderWidth,
  color: kColorGrey,
);
final cancelButtonIconColor = kColorGrey;
final cancelButtonIcon = LineIcons.close;
final acceptButtonBorder = BorderSide(
  width: iconButtonBorderWidth,
  color: kColorBlue,
);
final acceptButtonIconColor = kColorBlue;
final acceptButtonIcon = LineIcons.check;

class Invitation extends StatelessWidget {
  final Function onCancel;
  final Function onAccept;

  Invitation({this.onCancel, this.onAccept});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: kRowContainerPadding,
      height: 100.0,
      child: Row(
        children: <Widget>[
          CircularIconButton(
            side: cancelButtonBorder,
            icon: cancelButtonIcon,
            iconColor: cancelButtonIconColor,
            onPressed: onCancel,
          ),
          CircularIconButton(
            side: acceptButtonBorder,
            icon: acceptButtonIcon,
            iconColor: acceptButtonIconColor,
            onPressed: onAccept,
          ),
        ],
      ),
    );
  }
}
