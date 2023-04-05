import 'package:flutter/material.dart';
import '../../../constants.dart';

import 'dart:ui';
class PersonPic extends StatelessWidget {
  const PersonPic({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: Container(
        constraints: BoxConstraints(maxWidth: 639, maxHeight: 860),
        child: Image.asset("assets/images/person2.png"),
      ),
    );
  }
}
