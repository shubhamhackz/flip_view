import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flip view',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: HomePage(title: 'Flip View'),
      home: FlipView(),
    );
  }
}

class FlipView extends StatefulWidget {
  @override
  _FlipViewState createState() => _FlipViewState();
}

class _FlipViewState extends State<FlipView> {
  StreamController<Key> activeColumnController;
  List<Widget> _widgets;
  List<Key> _keys;

  @override
  void initState() {
    activeColumnController = StreamController();
    super.initState();
    _keys = [GlobalKey(), GlobalKey()];
    _widgets = [
      First(controller: activeColumnController, key: _keys[0]),
      Second(controller: activeColumnController, key: _keys[1]),
    ];
  }

  @override
  void dispose() {
    activeColumnController.close();
    super.dispose();
  }

  void _swap(int x, int y) {
    final w = _widgets[x];
    _widgets[x] = _widgets[y];
    _widgets[y] = w;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flip View'),
      ),
      body: SingleChildScrollView(
        child: StreamBuilder<Key>(
            // initialData: 0,
            stream: activeColumnController.stream,
            builder: (context, snapshot) {
              if (snapshot.data != null) {
                // if (snapshot.data == _keys[0]) {
                //   _swap(1, 0);
                // } else {
                //   _swap(0, 1);
                // }
                if (snapshot.data == _widgets[0].key) {
                  _swap(1, 0);
                }
              }
              print('Widgets : $_widgets');
              return Container(
                height: 800,
                color: Color(0xFF2e282a),
                child: Container(
                  width: 800,
                  child: Stack(
                    children: [..._widgets],
                    // children: [
                    //   First(controller: activeColumnController),
                    //   Second(controller: activeColumnController),
                    // ],

                    // Container(
                    //   width: 195,
                    //   child: Column(
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: [
                    //       SizedBox(
                    //         width: 400,
                    //       ),
                    // SimpleFoldingCell(
                    //   key: GlobalKey<SimpleFoldingCellState>(),
                    //   frontWidget: _buildFrontWidget('assets/irene.png'),
                    //   innerWidget: _buildInnerWidget('irene'),
                    //   cellSize: Size(MediaQuery.of(context).size.width / 2,
                    //       MediaQuery.of(context).size.width / 2),
                    //   padding: EdgeInsets.all(0),
                    //   animationDuration: Duration(milliseconds: 300),
                    //   borderRadius: 10,
                    //   onOpen: () {
                    //     print('cell opened : ');
                    //   },
                    //   onClose: () {
                    //     print('cell closed :');
                    //   },
                    // ),
                    //       SimpleFoldingCell(
                    //         key: GlobalKey<SimpleFoldingCellState>(),
                    //         frontWidget: _buildFrontWidget('assets/julia.png'),
                    //         innerWidget: _buildInnerWidget('julia'),
                    //         cellSize: Size(MediaQuery.of(context).size.width / 2,
                    //             MediaQuery.of(context).size.width / 2),
                    //         padding: EdgeInsets.all(0),
                    //         animationDuration: Duration(milliseconds: 300),
                    //         borderRadius: 10,
                    //         onOpen: () {
                    //           print('cell opened : ');
                    //         },
                    //         onClose: () {
                    //           print('cell closed : ');
                    //         },
                    //       ),
                    //       SimpleFoldingCell(
                    //         key: GlobalKey<SimpleFoldingCellState>(),
                    //         frontWidget: _buildFrontWidget('assets/paul.png'),
                    //         innerWidget: _buildInnerWidget('paul'),
                    //         cellSize: Size(MediaQuery.of(context).size.width / 2,
                    //             MediaQuery.of(context).size.width / 2),
                    //         padding: EdgeInsets.all(0),
                    //         animationDuration: Duration(milliseconds: 300),
                    //         borderRadius: 10,
                    //         onOpen: () {
                    //           print('cell opened : ');
                    //         },
                    //         onClose: () {
                    //           print('cell closed : ');
                    //         },
                    //       ),
                    //       SimpleFoldingCell(
                    //         key: GlobalKey<SimpleFoldingCellState>(),
                    //         frontWidget: _buildFrontWidget('assets/irene.png'),
                    //         innerWidget: _buildInnerWidget('irene'),
                    //         cellSize: Size(MediaQuery.of(context).size.width / 2,
                    //             MediaQuery.of(context).size.width / 2),
                    //         padding: EdgeInsets.all(0),
                    //         animationDuration: Duration(milliseconds: 300),
                    //         borderRadius: 10,
                    //         onOpen: () {
                    //           print('cell opened : ');
                    //         },
                    //         onClose: () {
                    //           print('cell closed : ');
                    //         },
                    //       )
                    //     ],
                    //   ),
                    // ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}

class Second extends StatelessWidget {
  const Second({
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
          cellSize: Size(MediaQuery.of(context).size.width / 2,
              MediaQuery.of(context).size.width / 2),
          padding: EdgeInsets.all(0),
          animationDuration: Duration(milliseconds: 300),
          // borderRadius: 10,
          onOpen: () {
            print('cell opened : ');
          },
          onClose: () {
            print('cell closed :');
          },
          controller: controller,
          unfoldDirection: SwipeDirection.left,
          parentKey: key,
        ),
        FlipTile(
          key: GlobalKey<FlipTileState>(),
          frontWidget: BuildFrontWidget(asset: 'assets/julia.png'),
          innerWidget: BuildInnerWidget(name: 'julia'),
          cellSize: Size(MediaQuery.of(context).size.width / 2,
              MediaQuery.of(context).size.width / 2),
          padding: EdgeInsets.all(0),
          animationDuration: Duration(milliseconds: 300),
          onOpen: () {
            print('cell opened : ');
          },
          onClose: () {
            print('cell closed : ');
          },
          controller: controller,
          unfoldDirection: SwipeDirection.left,
          parentKey: key,
        ),
        FlipTile(
          key: GlobalKey<FlipTileState>(),
          frontWidget: BuildFrontWidget(asset: 'assets/paul.png'),
          innerWidget: BuildInnerWidget(name: 'paul'),
          cellSize: Size(MediaQuery.of(context).size.width / 2,
              MediaQuery.of(context).size.width / 2),
          padding: EdgeInsets.all(0),
          animationDuration: Duration(milliseconds: 300),
          onOpen: () {
            print('cell opened : ');
          },
          onClose: () {
            print('cell closed : ');
          },
          controller: controller,
          unfoldDirection: SwipeDirection.left,
          parentKey: key,
        ),
        FlipTile(
          key: GlobalKey<FlipTileState>(),
          frontWidget: BuildFrontWidget(asset: 'assets/irene.png'),
          innerWidget: BuildInnerWidget(name: 'irene'),
          cellSize: Size(MediaQuery.of(context).size.width / 2,
              MediaQuery.of(context).size.width / 2),
          padding: EdgeInsets.all(0),
          animationDuration: Duration(milliseconds: 300),
          onOpen: () {
            print('cell opened : ');
          },
          onClose: () {
            print('cell closed : ');
          },
          controller: controller,
          unfoldDirection: SwipeDirection.left,
          parentKey: key,
        )
      ],
    );
  }
}

class BuildInnerWidget extends StatelessWidget {
  const BuildInnerWidget({
    Key key,
    @required this.name,
  }) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      width: 400,
      padding: EdgeInsets.only(top: 10),
      child: Stack(
        children: [
          Align(
              alignment: Alignment.center,
              child: Text('$name shubham soni goldy')),
        ],
      ),
      // child: Text(name),
      // child: Align(child: Text(name)),
    );
  }
}

class BuildFrontWidget extends StatelessWidget {
  const BuildFrontWidget({
    Key key,
    @required this.asset,
  }) : super(key: key);

  final String asset;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(asset),
    );
  }
}

class First extends StatelessWidget {
  const First({
    Key key,
    this.controller,
  }) : super(key: key);

  final StreamController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 400,
              ),
              FlipTile(
                key: GlobalKey<FlipTileState>(),
                frontWidget: BuildFrontWidget(asset: 'assets/daria.png'),
                innerWidget: BuildInnerWidget(name: 'daria'),
                cellSize: Size(MediaQuery.of(context).size.width / 2,
                    MediaQuery.of(context).size.width / 2),
                padding: EdgeInsets.all(0),
                animationDuration: Duration(milliseconds: 300),
                onOpen: () {
                  print('cell opened : ');
                },
                onClose: () {
                  print('cell closed :');
                },
                controller: controller,
                unfoldDirection: SwipeDirection.right,
                parentKey: key,
              ),
              FlipTile(
                key: GlobalKey<FlipTileState>(),
                frontWidget: BuildFrontWidget(asset: 'assets/anastasia.png'),
                innerWidget: BuildInnerWidget(name: 'anastasia'),
                cellSize: Size(MediaQuery.of(context).size.width / 2,
                    MediaQuery.of(context).size.width / 2),
                padding: EdgeInsets.all(0),
                animationDuration: Duration(milliseconds: 300),
                onOpen: () {
                  print('cell opened : ');
                },
                onClose: () {
                  print('cell closed : ');
                },
                controller: controller,
                unfoldDirection: SwipeDirection.right,
                parentKey: key,
              ),
              FlipTile(
                key: GlobalKey<FlipTileState>(),
                frontWidget: BuildFrontWidget(asset: 'assets/kate.png'),
                innerWidget: BuildInnerWidget(name: 'kate'),
                cellSize: Size(MediaQuery.of(context).size.width / 2,
                    MediaQuery.of(context).size.width / 2),
                padding: EdgeInsets.all(0),
                animationDuration: Duration(milliseconds: 300),
                onOpen: () {
                  print('cell opened : ');
                },
                onClose: () {
                  print('cell closed :');
                },
                controller: controller,
                unfoldDirection: SwipeDirection.right,
                parentKey: key,
              ),
              FlipTile(
                key: GlobalKey<FlipTileState>(),
                frontWidget: BuildFrontWidget(asset: 'assets/kirill.png'),
                innerWidget: BuildInnerWidget(name: 'kirill'),
                cellSize: Size(MediaQuery.of(context).size.width / 2,
                    MediaQuery.of(context).size.width / 2),
                padding: EdgeInsets.all(0),
                animationDuration: Duration(milliseconds: 300),
                onOpen: () {
                  print('cell opened : ');
                },
                onClose: () {
                  print('cell closed : ');
                },
                controller: controller,
                unfoldDirection: SwipeDirection.right,
                parentKey: key,
              )
            ],
          ),
        ),
      ],
    );
  }
}

/// Folding Cell Widget
class FlipTile extends StatefulWidget {
  FlipTile({
    Key key,
    @required this.frontWidget,
    @required this.innerWidget,
    this.cellSize = const Size(100.0, 100.0),
    this.unfoldCell = false,
    this.skipAnimation = false,
    this.padding =
        const EdgeInsets.only(left: 20, right: 20, bottom: 5, top: 10),
    this.animationDuration = const Duration(milliseconds: 500),
    this.borderRadius = 0.0,
    this.onOpen,
    this.onClose,
    this.unfoldDirection,
    this.controller,
    this.parentKey,
  })  : assert(frontWidget != null),
        assert(innerWidget != null),
        assert(cellSize != null),
        assert(unfoldCell != null),
        assert(skipAnimation != null),
        assert(padding != null),
        assert(animationDuration != null),
        assert(borderRadius != null && borderRadius >= 0.0),
        super(key: key);

  final StreamController controller;
  final SwipeDirection unfoldDirection;
  final Key parentKey;
  // Front widget in folded cell
  final Widget frontWidget;

  /// Inner widget in unfolded cell
  final Widget innerWidget;

  /// Size of cell
  final Size cellSize;

  /// If true cell will be unfolded when created, if false cell will be folded when created
  final bool unfoldCell;

  /// If true cell will fold and unfold without animation, if false cell folding and unfolding will be animated
  final bool skipAnimation;

  /// Padding around cell
  final EdgeInsetsGeometry padding;

  /// Animation duration
  final Duration animationDuration;

  /// Rounded border radius
  final double borderRadius;

  /// Called when cell fold animations completes
  final VoidCallback onOpen;

  /// Called when cell unfold animations completes
  final VoidCallback onClose;

  @override
  FlipTileState createState() => FlipTileState();
}

class FlipTileState extends State<FlipTile>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = false;
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
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        if (widget.onOpen != null) widget.onOpen();
      } else if (status == AnimationStatus.dismissed) {
        if (widget.onClose != null) widget.onClose();
      }
    });

    if (widget.unfoldCell == true) {
      _animationController.value = 1;
      _isExpanded = true;
    }
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
      onHorizontalDragStart: (DragStartDetails details) {
        final screenSize = MediaQuery.of(context).size;
        // widget.controller.add(1);
        widget.controller.add(widget.parentKey);

        // final offset = screenSize.width * (1.0 - widget.cellSize?.width);
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
                (_offsetValue - diff / screenSize.width);
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
          final cellWidth = widget.cellSize?.width;
          final cellHeight = widget.cellSize?.height;

          return Padding(
            padding: widget.padding,
            child: Container(
              alignment: Alignment.centerRight,
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
                                alignment: widget.unfoldDirection ==
                                        SwipeDirection.left
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
            ),
          );
        },
      ),
    );
  }

  void toggleFold() {
    if (_isExpanded) {
      if (widget.skipAnimation == true) {
        _animationController.value = 0;
      } else {
        _animationController.forward();
      }
    } else {
      if (widget.skipAnimation == true) {
        _animationController.value = 1;
      } else {
        _animationController.reverse();
      }
    }
    _isExpanded = !_isExpanded;
  }
}

enum SwipeDirection {
  left,
  right,
}

class Go extends StatefulWidget {
  Go({Key key}) : super(key: key);

  @override
  _GoState createState() => _GoState();
}

class _GoState extends State<Go> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: null,
    );
  }
}
