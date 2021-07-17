import 'dart:async';

import 'package:flip_view/src/config/device_config.dart';
import 'package:flip_view/src/flip_tile/flip_tile.dart';
import 'package:flip_view/src/widgets/front_widget.dart';
import 'package:flip_view/src/widgets/inner_widget.dart';
import 'package:flutter/material.dart';

class FirstColumn extends StatelessWidget {
  const FirstColumn({
    Key key,
    this.controller,
  }) : super(key: key);

  final StreamController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: width,
        ),
        FlipTile(
          key: GlobalKey<FlipTileState>(),
          frontWidget: BuildFrontWidget(asset: 'assets/daria.png'),
          innerWidget: InnerWidget(
            name: 'DARIA',
            tags: ['Artist', 'Litrature', 'Chill Music', 'Art', 'Dance'],
            backgroundColor: Color(0xFF4af2a1),
          ),
          tileSize: Size(width / 2, width / 2),
          animationDuration: Duration(milliseconds: 300),
          stackController: controller,
          unfoldDirection: SwipeDirection.right,
          parentKey: key,
        ),
        FlipTile(
          key: GlobalKey<FlipTileState>(),
          frontWidget: BuildFrontWidget(asset: 'assets/anastasia.png'),
          innerWidget: InnerWidget(
            name: 'ANASTASIA',
            tags: ['Vegetarian', 'Pet', 'Books', 'Art', 'Dance'],
            backgroundColor: Color(0xFF5cc9f5),
          ),
          tileSize: Size(width / 2, width / 2),
          animationDuration: Duration(milliseconds: 300),
          stackController: controller,
          unfoldDirection: SwipeDirection.right,
          parentKey: key,
        ),
        FlipTile(
          key: GlobalKey<FlipTileState>(),
          frontWidget: BuildFrontWidget(asset: 'assets/kate.png'),
          innerWidget: InnerWidget(
            name: 'KATE',
            tags: ['Cycling', 'Rock Band Drummer', 'Pop Music', 'Art', 'Dance'],
            backgroundColor: Color(0xFFffa26b),
          ),
          tileSize: Size(width / 2, width / 2),
          animationDuration: Duration(milliseconds: 300),
          stackController: controller,
          unfoldDirection: SwipeDirection.right,
          parentKey: key,
        ),
        FlipTile(
          key: GlobalKey<FlipTileState>(),
          frontWidget: BuildFrontWidget(asset: 'assets/kirill.png'),
          innerWidget: InnerWidget(
            name: 'KIRILL',
            tags: ['Swimming', 'Coding', 'Pop Music', 'Pet', 'Books'],
            backgroundColor: Color(0xFFfe6d72),
          ),
          tileSize: Size(width / 2, width / 2),
          animationDuration: Duration(milliseconds: 300),
          stackController: controller,
          unfoldDirection: SwipeDirection.right,
          parentKey: key,
        )
      ],
    );
  }
}
