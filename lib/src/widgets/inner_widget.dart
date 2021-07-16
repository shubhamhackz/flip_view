import 'package:flutter/material.dart';

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
            child: Column(
              children: [
                Text(name),
                Wrap(
                  runSpacing: 5.0,
                  direction: Axis.horizontal,
                  children: [
                    Container(
                      width: 80,
                      height: 20,
                      color: Colors.black,
                      alignment: Alignment.center,
                      child: Text(
                        'Artist',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Container(
                      width: 80,
                      height: 20,
                      color: Colors.black,
                      alignment: Alignment.center,
                      child: Text(
                        'Litrature',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Container(
                      width: 80,
                      height: 20,
                      color: Colors.black,
                      alignment: Alignment.center,
                      child: Text(
                        'Chill Music',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Container(
                      width: 80,
                      height: 20,
                      color: Colors.black,
                      alignment: Alignment.center,
                      child: Text(
                        'Artist',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Container(
                      width: 80,
                      height: 20,
                      color: Colors.black,
                      alignment: Alignment.center,
                      child: Text(
                        'Artist',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
