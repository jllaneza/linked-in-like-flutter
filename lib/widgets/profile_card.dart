import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants.dart';
import 'mutual_connections.dart';

const coverPhotoTopPosition = 0.0;
const coverPhotoLeftPosition = 0.0;
const coverPhotoRightPosition = 0.0;
const coverPhotoHeight = 62.0;

const cancelButtonTopPosition = 5.0;
const cancelButtonRightPosition = 5.0;
const cancelButtonDiameter = 25.0;
const cancelButtonSvgAsset = 'assets/cancel.svg';
const cancelButtonColor = Colors.white;
final cancelButtonFillColor = kColorGrey;
const cancelButtonConstraints = BoxConstraints.tightFor(
  width: cancelButtonDiameter,
  height: cancelButtonDiameter,
);
const cancelButtonShape = CircleBorder(
  side: BorderSide.none,
);

class ProfileCard extends StatelessWidget {
  final Function onConnect;
  final Function onClose;
  final Widget coverPhotoChild;

  ProfileCard({this.onConnect, this.onClose, this.coverPhotoChild});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 182.0,
      height: 284.0,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            _CoverPhoto(coverPhotoChild: coverPhotoChild),
            _CancelButton(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Container(
                    width: 104.0,
                    height: 104.0,
                    decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      // The border you want
                      border: new Border.all(
                        width: 2.0,
                        color: Colors.white,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 5.0,
                        ),
                      ],
                    ),
                    child: ClipOval(
                      child: Image.network(
                        'https://media-exp1.licdn.com/dms/image/C5103AQHnL59dt7LpKg/profile-displayphoto-shrink_100_100/0?e=1589414400&v=beta&t=tFlaud-szBMMeO70p8T43BI4fHpzjs0_PTbesrTEYaM',
                      ),
                    ),
                  ),
                  Text(
                    'Jose Martin Llaneza',
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      height: 1.5,
                    ),
                  ),
                  Text(
                    'Software Consultant at Zenika',
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    style: TextStyle(fontSize: 14, height: 1.429),
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  MutualConnections(
                    connections: 2000,
                    maxLines: 2,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: OutlineButton(
                      child: Text(
                        'Connect',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                          height: 1.5,
                          color: kColorBlue,
                        ),
                      ),
                      borderSide: BorderSide(
                        color: kColorBlue,
                        width: 1.0,
                        style: BorderStyle.solid,
                      ),
                      onPressed: onConnect,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _CoverPhoto extends StatelessWidget {
  const _CoverPhoto({
    @required this.coverPhotoChild,
  });

  final Widget coverPhotoChild;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: coverPhotoTopPosition,
      left: coverPhotoLeftPosition,
      right: coverPhotoRightPosition,
      child: coverPhotoChild,
      height: coverPhotoHeight,
    );
  }
}

class _CancelButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: cancelButtonTopPosition,
      right: cancelButtonRightPosition,
      child: RawMaterialButton(
        child: SvgPicture.asset(
          cancelButtonSvgAsset,
          color: cancelButtonColor,
        ),
        shape: cancelButtonShape,
        constraints: cancelButtonConstraints,
        fillColor: cancelButtonFillColor,
      ),
      height: cancelButtonDiameter,
      width: cancelButtonDiameter,
    );
  }
}
