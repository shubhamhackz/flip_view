import 'package:flutter/material.dart';

class BuildFrontWidget extends StatelessWidget {
  const BuildFrontWidget({
    Key key,
    @required this.asset,
  }) : super(key: key);

  final String asset;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: EdgeInsets.all(1.5),
      child: Image.asset(asset),
    );
  }
}
