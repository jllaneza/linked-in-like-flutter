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
                'https://www.rd.com/wp-content/uploads/2017/09/01-shutterstock_476340928-Irina-Bg-1024x683.jpg'),
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
                      'Name',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'Date',
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
