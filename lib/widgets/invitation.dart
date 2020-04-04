import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'circular_icon_button.dart';
import '../constants.dart';
import 'mutual_connections.dart';

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

// TODO: move hardcoded value to local/shared constants
// TODO: check widgets below that can be shared across and extract it into a reusable widgets
// TODO: add arguments to make this widget flexible
class Invitation extends StatelessWidget {
  final Function onCancel;
  final Function onAccept;

  Invitation({this.onCancel, this.onAccept});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: kRowContainerPadding,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                      'https://media-exp1.licdn.com/dms/image/C5103AQHnL59dt7LpKg/profile-displayphoto-shrink_100_100/0?e=1589414400&v=beta&t=tFlaud-szBMMeO70p8T43BI4fHpzjs0_PTbesrTEYaM'),
                ),
                SizedBox(
                  width: 16.0,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Martin Llaneza',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        'Software Consultant',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      MutualConnections(
                        connections: 19,
                        maxLines: 2,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 15.0,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CircularIconButton(
                side: cancelButtonBorder,
                icon: cancelButtonIcon,
                iconColor: cancelButtonIconColor,
                onPressed: onCancel,
              ),
              SizedBox(
                width: 5.0,
              ),
              CircularIconButton(
                side: acceptButtonBorder,
                icon: acceptButtonIcon,
                iconColor: acceptButtonIconColor,
                onPressed: onAccept,
              ),
            ],
          )
        ],
      ),
    );
  }
}
