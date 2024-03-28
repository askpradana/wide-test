import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SingleMenuIcon extends StatelessWidget {
  const SingleMenuIcon({
    super.key,
    required this.text,
    required this.image,
    required this.color,
  });

  final String text;
  final String image;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: color,
              width: 2,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: SvgPicture.asset(
              "assets/images/icon/$image",
              semanticsLabel: 'background image',
            ),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: 60,
          child: Text(
            text,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
