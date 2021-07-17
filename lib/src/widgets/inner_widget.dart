import 'package:flip_view/src/config/device_config.dart';
import 'package:flutter/material.dart';

class InnerWidget extends StatelessWidget {
  const InnerWidget({
    Key key,
    @required this.name,
    @required this.tags,
    @required this.backgroundColor,
  }) : super(key: key);

  final String name;
  final List<String> tags;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      width: width,
      padding: EdgeInsets.symmetric(vertical: 14, horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 14),
            child: Text(
              name,
              style: TextStyle(
                color: Colors.white,
                fontSize: 36,
                fontWeight: FontWeight.w200,
              ),
            ),
          ),
          Wrap(
            runSpacing: 7.0,
            direction: Axis.horizontal,
            children: List.generate(
              tags.length,
              (index) => TagChip(
                tag: tags[index],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TagChip extends StatelessWidget {
  const TagChip({
    Key key,
    this.tag,
  }) : super(key: key);
  final String tag;

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Container(
        margin: EdgeInsets.only(right: width * 0.018),
        padding: EdgeInsets.symmetric(
          vertical: height * 0.003,
          horizontal: width * 0.05,
        ),
        alignment: Alignment.center,
        decoration: ShapeDecoration(
          color: const Color(0xFF2a3131),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(width * 0.05),
          ),
        ),
        child: Text(
          tag,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
  }
}
