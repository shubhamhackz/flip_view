import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class FlipTile extends StatefulWidget {
  FlipTile({
    Key key,
    @required this.frontWidget,
    @required this.innerWidget,
    this.tileSize = const Size(100.0, 100.0),
    this.animationDuration = const Duration(milliseconds: 500),
    this.borderRadius = 0.0,
    this.unfoldDirection,
    this.stackController,
    this.parentKey,
  })  : assert(frontWidget != null),
        assert(innerWidget != null),
        assert(tileSize != null),
        assert(animationDuration != null),
        assert(borderRadius != null && borderRadius >= 0.0),
        super(key: key);

  final StreamController stackController;
  final SwipeDirection unfoldDirection;
  final Key parentKey;
  // Front widget in folded cell
  final Widget frontWidget;

  /// Inner widget in unfolded cell
  final Widget innerWidget;

  /// Size of cell
  final Size tileSize;

  /// Animation duration
  final Duration animationDuration;

  /// Rounded border radius
  final double borderRadius;

  @override
  FlipTileState createState() => FlipTileState();
}

class FlipTileState extends State<FlipTile>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  double _offsetValue;
  Offset _freshPosition;
  Offset _startPosition;
  bool _mounted = false;
  SwipeDirection swipeDirection;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: widget.animationDuration);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onHorizontalDragStart: (DragStartDetails details) async {
        final screenSize = MediaQuery.of(context).size;

        widget.stackController.add(widget.parentKey);

        final offset = screenSize.width;

        if (details.globalPosition.dx > offset ||
            details.globalPosition.dx < screenSize.width - offset) {
          _mounted = false;
          return;
        }

        _mounted = true;
        _startPosition = details.globalPosition;
        _offsetValue = _animationController.value;
      },
      onHorizontalDragUpdate: (DragUpdateDetails details) {
        if (!_mounted) {
          return;
        }

        // Note: Sensitivity is integer used when you don't want to mess up vertical drag
        int sensitivity = 1;
        if (details.delta.dx > sensitivity) {
          // Right Swipe
          swipeDirection = SwipeDirection.right;
        } else if (details.delta.dx < -sensitivity) {
          //Left Swipe
          swipeDirection = SwipeDirection.left;
        }

        final screenSize = MediaQuery.of(context).size;

        _freshPosition = details.globalPosition;

        final diff = (_freshPosition - _startPosition).dx;

        if (widget.unfoldDirection == SwipeDirection.left) {
          if (swipeDirection == SwipeDirection.left) {
            //left
            _animationController.value = -(_offsetValue +
                diff /
                    screenSize
                        .width); //-(_offsetValue + diff / screenSize.width);
          } else {
            _animationController.value =
                (_offsetValue - diff / screenSize.width);
          }
        } else {
          if (swipeDirection == SwipeDirection.right) {
            //left
            _animationController.value =
                (_offsetValue + diff / screenSize.width);
          } else {
            _animationController.value =
                (_offsetValue + diff / screenSize.width);
          }
        }
      },
      onHorizontalDragEnd: (DragEndDetails details) {
        if (!_mounted) return;

        _mounted = false;
        _startPosition = null;

        /// If this is a right swipe
        if (swipeDirection == SwipeDirection.left) {
          // right
          /// And if the _animationController's value is greater than or equal to 0.35
          /// then it means that the user had swiped enough to show the drawer
          if (_animationController.value >= 0.35) {
            _animationController.forward();
          }

          /// Otherwise hide the drawer as user hasn't swiped properly
          else {
            _animationController.reverse();
          }
        }

        /// Else If this is a left swipe
        else {
          /// And if the _animationController's value is less than or equal to 0.7
          /// then it means that the user had swiped enough to hide the drawer
          if (_animationController.value <= 0.45) {
            _animationController.reverse();
          }

          /// Otherwise show the drawer as user hasn't swiped properly
          else {
            _animationController.forward();
          }
        }
      },
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          final angle = _animationController.value * pi;
          final cellWidth = widget.tileSize?.width;
          final cellHeight = widget.tileSize?.height;

          return Container(
            alignment: widget.unfoldDirection == SwipeDirection.left
                ? Alignment.centerRight
                : Alignment.centerLeft, //centerRight
            color: Colors.transparent,
            width: cellWidth + (cellWidth * _animationController.value),
            height: cellHeight,
            child: Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(widget.borderRadius),
                    topRight: Radius.circular(widget.borderRadius),
                  ),
                  child: Container(
                    width: cellWidth,
                    height: cellHeight,
                    alignment: Alignment.center,
                    child: OverflowBox(
                      minWidth: cellWidth,
                      maxWidth: cellWidth * 2,
                      alignment: widget.unfoldDirection == SwipeDirection.left
                          ? Alignment.centerLeft
                          : Alignment.centerRight,
                      child: ClipRect(
                        child: Align(
                          widthFactor: 0.5,
                          alignment:
                              widget.unfoldDirection == SwipeDirection.left
                                  ? Alignment.centerRight
                                  : Alignment.centerLeft,
                          child: widget.innerWidget,
                        ),
                      ),
                    ),
                  ),
                ),
                Transform(
                  alignment: widget.unfoldDirection == SwipeDirection.left
                      ? Alignment.centerLeft
                      : Alignment.centerRight, //centerLeft
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..rotateY(widget.unfoldDirection == SwipeDirection.left
                        ? angle
                        : -angle), //angle
                  child: Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationY(
                        widget.unfoldDirection == SwipeDirection.left
                            ? pi
                            : -pi), //pi
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(widget.borderRadius),
                        // bottomRight: Radius.circular(widget.borderRadius),
                      ),
                      child: Container(
                        width: cellWidth,
                        height: cellHeight,
                        child: OverflowBox(
                          minWidth: cellWidth,
                          maxWidth: cellWidth * 2,
                          alignment:
                              widget.unfoldDirection == SwipeDirection.left
                                  ? Alignment.centerLeft
                                  : Alignment.centerRight,
                          child: ClipRect(
                            child: Align(
                              // widthFactor: 0.5,
                              alignment:
                                  widget.unfoldDirection == SwipeDirection.left
                                      ? Alignment.centerRight
                                      : Alignment.centerLeft,
                              child: widget.innerWidget,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Transform(
                  alignment: widget.unfoldDirection == SwipeDirection.left
                      ? Alignment.centerLeft
                      : Alignment.centerRight, //centerLeft
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..rotateY(widget.unfoldDirection == SwipeDirection.left
                        ? angle
                        : -angle), //angle
                  child: Opacity(
                    opacity: angle >= 1.5708 ? 0.0 : 1.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          // topLeft: Radius.circular(widget.borderRadius),
                          // topRight: Radius.circular(widget.borderRadius),
                          ),
                      child: Container(
                        width: angle >= 1.5708 ? 0.0 : cellWidth,
                        height: angle >= 1.5708 ? 0.0 : cellHeight,
                        child: widget.frontWidget,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

enum SwipeDirection {
  left,
  right,
}
