import 'dart:async';

import 'package:flutter/material.dart';

import 'columns/first_column.dart';
import 'columns/second_column.dart';

class FlipView extends StatefulWidget {
  @override
  _FlipViewState createState() => _FlipViewState();
}

class _FlipViewState extends State<FlipView> {
  StreamController<Key> stackController;
  List<Widget> _widgets;
  List<Key> _keys;

  @override
  void initState() {
    stackController = StreamController.broadcast();
    super.initState();
    _keys = [GlobalKey(), GlobalKey()];
    _widgets = [
      FirstColumn(controller: stackController, key: _keys[0]),
      SecondColumn(controller: stackController, key: _keys[1]),
    ];
  }

  @override
  void dispose() {
    stackController.close();
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
            stream: stackController.stream,
            builder: (context, snapshot) {
              if (snapshot.data != null) {
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
                  ),
                ),
              );
            }),
      ),
    );
  }
}
