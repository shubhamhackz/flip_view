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
          innerWidget: BuildInnerWidget(name: 'daria'),
          tileSize: Size(width / 2, width / 2),
          animationDuration: Duration(milliseconds: 300),
          stackController: controller,
          unfoldDirection: SwipeDirection.right,
          parentKey: key,
        ),
        FlipTile(
          key: GlobalKey<FlipTileState>(),
          frontWidget: BuildFrontWidget(asset: 'assets/anastasia.png'),
          innerWidget: BuildInnerWidget(name: 'anastasia'),
          tileSize: Size(width / 2, width / 2),
          animationDuration: Duration(milliseconds: 300),
          stackController: controller,
          unfoldDirection: SwipeDirection.right,
          parentKey: key,
        ),
        FlipTile(
          key: GlobalKey<FlipTileState>(),
          frontWidget: BuildFrontWidget(asset: 'assets/kate.png'),
          innerWidget: BuildInnerWidget(name: 'kate'),
          tileSize: Size(width / 2, width / 2),
          animationDuration: Duration(milliseconds: 300),
          stackController: controller,
          unfoldDirection: SwipeDirection.right,
          parentKey: key,
        ),
        FlipTile(
          key: GlobalKey<FlipTileState>(),
          frontWidget: BuildFrontWidget(asset: 'assets/kirill.png'),
          innerWidget: BuildInnerWidget(name: 'kirill'),
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
