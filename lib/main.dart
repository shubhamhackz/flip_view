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
      home: FoldingCellSimpleDemo(),
    );
  }
}

class FoldingCellSimpleDemo extends StatelessWidget {
  final _foldingCellKey = GlobalKey<SimpleFoldingCellState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flip View'),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xFF2e282a),
          // alignment: Alignment.centerRight,
          // child: SimpleFoldingCell.create(
          //   key: _foldingCellKey,
          //   frontWidget: _buildFrontWidget(),
          //   innerWidget: _buildInnerWidget(),
          //   cellSize: Size(MediaQuery.of(context).size.width / 2,
          //       MediaQuery.of(context).size.width / 2),
          //   padding: EdgeInsets.all(0),
          //   animationDuration: Duration(milliseconds: 300),
          //   borderRadius: 10,
          //   onOpen: () => print('cell opened'),
          //   onClose: () => print('cell closed'),
          // ),
          // child: GridView.count(
          //   crossAxisCount: 2,
          //   children: List.generate(6, (index) {
          //     return GridTile(
          //       child: Container(
          //         width: MediaQuery.of(context).size.width,
          //         child: SimpleFoldingCell.create(
          //             key: GlobalKey<SimpleFoldingCellState>(),
          //             frontWidget: _buildFrontWidget(),
          //             innerWidget: _buildInnerWidget(),
          //             cellSize: Size(MediaQuery.of(context).size.width / 2,
          //                 MediaQuery.of(context).size.width / 2),
          //             padding: EdgeInsets.all(0),
          //             animationDuration: Duration(milliseconds: 300),
          //             borderRadius: 10,
          //             onOpen: () {
          //               print('cell opened : $index');
          //             },
          //             onClose: () {
          //               print('cell closed : $index');
          //             },
          //             index: index),
          //       ),
          //     );
          //   }),
          // ),
          child: Container(
            width: 800,
            child: Row(
              children: [
                // Container(
                //   width: 195,
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       SizedBox(
                //         width: 400,
                //       ),
                //       SimpleFoldingCell.create(
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
                //           print('cell closed :');
                //         },
                //       ),
                //       SimpleFoldingCell.create(
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
                //       SimpleFoldingCell.create(
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
                //       SimpleFoldingCell.create(
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
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // SizedBox(
                      //   width: 400,
                      // ),
                      SimpleFoldingCell.create(
                        key: GlobalKey<SimpleFoldingCellState>(),
                        frontWidget: _buildFrontWidget('assets/daria.png'),
                        innerWidget: _buildInnerWidget('daria'),
                        cellSize: Size(MediaQuery.of(context).size.width / 2,
                            MediaQuery.of(context).size.width / 2),
                        padding: EdgeInsets.all(0),
                        animationDuration: Duration(milliseconds: 300),
                        borderRadius: 10,
                        onOpen: () {
                          print('cell opened : ');
                        },
                        onClose: () {
                          print('cell closed :');
                        },
                      ),
                      SimpleFoldingCell.create(
                        key: GlobalKey<SimpleFoldingCellState>(),
                        frontWidget: _buildFrontWidget('assets/anastasia.png'),
                        innerWidget: _buildInnerWidget('anastasia'),
                        cellSize: Size(MediaQuery.of(context).size.width / 2,
                            MediaQuery.of(context).size.width / 2),
                        padding: EdgeInsets.all(0),
                        animationDuration: Duration(milliseconds: 300),
                        borderRadius: 10,
                        onOpen: () {
                          print('cell opened : ');
                        },
                        onClose: () {
                          print('cell closed : ');
                        },
                      ),
                      SimpleFoldingCell.create(
                        key: GlobalKey<SimpleFoldingCellState>(),
                        frontWidget: _buildFrontWidget('assets/kate.png'),
                        innerWidget: _buildInnerWidget('kate'),
                        cellSize: Size(MediaQuery.of(context).size.width / 2,
                            MediaQuery.of(context).size.width / 2),
                        padding: EdgeInsets.all(0),
                        animationDuration: Duration(milliseconds: 300),
                        borderRadius: 10,
                        onOpen: () {
                          print('cell opened : ');
                        },
                        onClose: () {
                          print('cell closed :');
                        },
                      ),
                      SimpleFoldingCell.create(
                        key: GlobalKey<SimpleFoldingCellState>(),
                        frontWidget: _buildFrontWidget('assets/kirill.png'),
                        innerWidget: _buildInnerWidget('kirill'),
                        cellSize: Size(MediaQuery.of(context).size.width / 2,
                            MediaQuery.of(context).size.width / 2),
                        padding: EdgeInsets.all(0),
                        animationDuration: Duration(milliseconds: 300),
                        borderRadius: 10,
                        onOpen: () {
                          print('cell opened : ');
                        },
                        onClose: () {
                          print('cell closed : ');
                        },
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      // SizedBox(
                      //   width: 400,
                      // ),
                      SimpleFoldingCell.create(
                        key: GlobalKey<SimpleFoldingCellState>(),
                        frontWidget: _buildFrontWidget('assets/irene.png'),
                        innerWidget: _buildInnerWidget('irene'),
                        cellSize: Size(MediaQuery.of(context).size.width / 2,
                            MediaQuery.of(context).size.width / 2),
                        padding: EdgeInsets.all(0),
                        animationDuration: Duration(milliseconds: 300),
                        borderRadius: 10,
                        onOpen: () {
                          print('cell opened : ');
                        },
                        onClose: () {
                          print('cell closed :');
                        },
                      ),
                      SimpleFoldingCell.create(
                        key: GlobalKey<SimpleFoldingCellState>(),
                        frontWidget: _buildFrontWidget('assets/julia.png'),
                        innerWidget: _buildInnerWidget('julia'),
                        cellSize: Size(MediaQuery.of(context).size.width / 2,
                            MediaQuery.of(context).size.width / 2),
                        padding: EdgeInsets.all(0),
                        animationDuration: Duration(milliseconds: 300),
                        borderRadius: 10,
                        onOpen: () {
                          print('cell opened : ');
                        },
                        onClose: () {
                          print('cell closed : ');
                        },
                      ),
                      SimpleFoldingCell.create(
                        key: GlobalKey<SimpleFoldingCellState>(),
                        frontWidget: _buildFrontWidget('assets/paul.png'),
                        innerWidget: _buildInnerWidget('paul'),
                        cellSize: Size(MediaQuery.of(context).size.width / 2,
                            MediaQuery.of(context).size.width / 2),
                        padding: EdgeInsets.all(0),
                        animationDuration: Duration(milliseconds: 300),
                        borderRadius: 10,
                        onOpen: () {
                          print('cell opened : ');
                        },
                        onClose: () {
                          print('cell closed : ');
                        },
                      ),
                      SimpleFoldingCell.create(
                        key: GlobalKey<SimpleFoldingCellState>(),
                        frontWidget: _buildFrontWidget('assets/irene.png'),
                        innerWidget: _buildInnerWidget('irene'),
                        cellSize: Size(MediaQuery.of(context).size.width / 2,
                            MediaQuery.of(context).size.width / 2),
                        padding: EdgeInsets.all(0),
                        animationDuration: Duration(milliseconds: 300),
                        borderRadius: 10,
                        onOpen: () {
                          print('cell opened : ');
                        },
                        onClose: () {
                          print('cell closed : ');
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFrontWidget(String asset) {
    return Container(
      child: Image.asset(asset),
    );
  }

  Widget _buildInnerWidget(String name) {
    return Container(
      color: Colors.yellow,
      padding: EdgeInsets.only(top: 10),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(name),
          ),
        ],
      ),
    );
  }

  // Widget _buildFrontWidget() {
  //   return Container(
  //     color: Color(0xFFffcd3c),
  //     alignment: Alignment.center,
  //     child: Stack(
  //       children: <Widget>[
  //         Align(
  //           alignment: Alignment.center,
  //           child: Text(
  //             "CARD TITLE",
  //             // style: GoogleFonts.aldrich(
  //             //   color: Color(0xFF2e282a),
  //             //   fontSize: 20.0,
  //             //   fontWeight: FontWeight.bold,
  //             // ),
  //           ),
  //         ),
  //         Positioned(
  //           right: 10,
  //           bottom: 10,
  //           child: TextButton(
  //             onPressed: () => _foldingCellKey?.currentState?.toggleFold(),
  //             child: Text(
  //               "OPEN",
  //             ),
  //             style: TextButton.styleFrom(
  //               backgroundColor: Colors.white,
  //               minimumSize: Size(80, 40),
  //             ),
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }

  // Widget _buildInnerWidget() {
  //   return Container(
  //     color: Colors.yellow,
  //     padding: EdgeInsets.only(top: 10),
  //     child: Stack(
  //       children: [
  //         Align(
  //           alignment: Alignment.centerLeft,
  //           child: Text(
  //             "CARD TITLE",
  //             // style: GoogleFonts.aldrich(
  //             //   color: Color(0xFF2e282a),
  //             //   fontSize: 22.0,
  //             //   fontWeight: FontWeight.bold,
  //             // ),
  //           ),
  //         ),
  //         Align(
  //           alignment: Alignment.center,
  //           child: Text(
  //             "CARD DETAIL",
  //             // style: GoogleFonts.aldrich(
  //             //   color: Color(0xFF2e282a),
  //             //   fontSize: 40.0,
  //             // ),
  //           ),
  //         ),
  //         Positioned(
  //           right: 10,
  //           bottom: 10,
  //           child: TextButton(
  //             onPressed: () => _foldingCellKey?.currentState?.toggleFold(),
  //             child: Text(
  //               "Close",
  //             ),
  //             style: TextButton.styleFrom(
  //               backgroundColor: Colors.white,
  //               minimumSize: Size(80, 40),
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}

/// Folding Cell Widget
class SimpleFoldingCell extends StatefulWidget {
  SimpleFoldingCell.create({
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
    this.unfolDirection,
  })  : assert(frontWidget != null),
        assert(innerWidget != null),
        assert(cellSize != null),
        assert(unfoldCell != null),
        assert(skipAnimation != null),
        assert(padding != null),
        assert(animationDuration != null),
        assert(borderRadius != null && borderRadius >= 0.0),
        super(key: key);
  final SwipeDirection unfolDirection;
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
  SimpleFoldingCellState createState() => SimpleFoldingCellState();
}

class SimpleFoldingCellState extends State<SimpleFoldingCell>
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
      behavior: HitTestBehavior.translucent,
      onHorizontalDragStart: (DragStartDetails details) {
        final screenSize = MediaQuery.of(context).size;

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
        int sensitivity = 2;
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

        if (swipeDirection == SwipeDirection.right) {
          //left
          _animationController.value = (_offsetValue +
              diff /
                  screenSize
                      .width); //-(_offsetValue + diff / screenSize.width);
        } else {
          _animationController.value = (_offsetValue - diff / screenSize.width);
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
                        alignment: Alignment.centerRight,
                        child: ClipRect(
                          child: Align(
                            widthFactor: 0.5,
                            alignment: Alignment.centerRight,
                            child: widget.innerWidget,
                          ),
                        ),
                      ),
                      // child: OverflowBox(
                      //   minWidth: cellWidth,
                      //   maxWidth: cellWidth * 2,
                      //   child: Align(
                      //     widthFactor: 0.5,
                      //     alignment: Alignment.centerRight,
                      //     child: widget.innerWidget,
                      //   ),
                      // ),
                    ),
                  ),
                  Transform(
                    alignment: Alignment.centerRight, //centerLeft
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..rotateY(-angle), //angle
                    child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationY(-pi), //pi
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
                            alignment: Alignment.centerLeft,
                            child: ClipRect(
                              child: Align(
                                widthFactor: 0.5,
                                alignment: Alignment.centerLeft,
                                child: widget.innerWidget,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Transform(
                    alignment: Alignment.centerRight, //centerLeft
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..rotateY(-angle), //angle
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
