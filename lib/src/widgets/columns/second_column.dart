import 'dart:async';

import 'package:flip_view/src/flip_tile/flip_tile.dart';
import 'package:flip_view/src/widgets/front_widget.dart';
import 'package:flutter/material.dart';

import '../inner_widget.dart';

class SecondColumn extends StatelessWidget {
  const SecondColumn({
    Key key,
    this.controller,
  }) : super(key: key);

  final StreamController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(
          width: 400,
        ),
        FlipTile(
          key: GlobalKey<FlipTileState>(),
          frontWidget: BuildFrontWidget(asset: 'assets/irene.png'),
          innerWidget: BuildInnerWidget(name: 'irene'),
          tileSize: Size(MediaQuery.of(context).size.width / 2,
              MediaQuery.of(context).size.width / 2),

          animationDuration: Duration(milliseconds: 300),
          // borderRadius: 10,

          stackController: controller,
          unfoldDirection: SwipeDirection.left,
          parentKey: key,
        ),
        FlipTile(
          key: GlobalKey<FlipTileState>(),
          frontWidget: BuildFrontWidget(asset: 'assets/julia.png'),
          innerWidget: BuildInnerWidget(name: 'julia'),
          tileSize: Size(MediaQuery.of(context).size.width / 2,
              MediaQuery.of(context).size.width / 2),
          animationDuration: Duration(milliseconds: 300),
          stackController: controller,
          unfoldDirection: SwipeDirection.left,
          parentKey: key,
        ),
        FlipTile(
          key: GlobalKey<FlipTileState>(),
          frontWidget: BuildFrontWidget(asset: 'assets/paul.png'),
          innerWidget: BuildInnerWidget(name: 'paul'),
          tileSize: Size(MediaQuery.of(context).size.width / 2,
              MediaQuery.of(context).size.width / 2),
          animationDuration: Duration(milliseconds: 300),
          stackController: controller,
          unfoldDirection: SwipeDirection.left,
          parentKey: key,
        ),
        FlipTile(
          key: GlobalKey<FlipTileState>(),
          frontWidget: BuildFrontWidget(asset: 'assets/irene.png'),
          innerWidget: BuildInnerWidget(name: 'irene'),
          tileSize: Size(MediaQuery.of(context).size.width / 2,
              MediaQuery.of(context).size.width / 2),
          animationDuration: Duration(milliseconds: 300),
          stackController: controller,
          unfoldDirection: SwipeDirection.left,
          parentKey: key,
        )
      ],
    );
  }
}
