import 'package:flutter/material.dart';
import 'constants.dart';

const _containerHeight = 75.0;
const _avatarRadius = 30.0;

class Message extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: kRowContainerPadding,
      height: _containerHeight,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CircleAvatar(
            radius: _avatarRadius,
            backgroundImage: NetworkImage(
                'https://media-exp1.licdn.com/dms/image/C5103AQHnL59dt7LpKg/profile-displayphoto-shrink_100_100/0?e=1589414400&v=beta&t=tFlaud-szBMMeO70p8T43BI4fHpzjs0_PTbesrTEYaM'),
          ),
          SizedBox(
            width: 16.0,
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'John Doe',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'Mar 11',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 12.0,
                          color: kColorGrey,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 6.0,
                ),
                Text(
                  'lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: kColorGrey,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
