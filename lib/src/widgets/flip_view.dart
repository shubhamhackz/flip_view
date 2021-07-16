import 'dart:async';

import 'package:flip_view/src/config/device_config.dart';
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
    //initialize width and height
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Find Friends'),
        centerTitle: true,
        backgroundColor: const Color(0xFF1e252b),
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
            return Stack(
              children: [..._widgets],
            );
          },
        ),
      ),
    );
  }
}
