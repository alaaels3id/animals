import 'package:flutter/material.dart';

class CharacterCardBackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    const double curveDistance = 40;

    path.moveTo(0, size.height * 0.4);
    path.lineTo(0, size.height - curveDistance);
    path.quadraticBezierTo(1, size.height - 1, 0 + curveDistance, size.height);
    path.lineTo(size.width - curveDistance, size.height);
    path.quadraticBezierTo(
      size.width + 1,
      size.height - 1,
      size.width,
      size.height - curveDistance,
    );
    path.lineTo(size.width, 0 + curveDistance);
    path.quadraticBezierTo(
      size.width - 1,
      0,
      size.width - curveDistance - 5,
      0 + curveDistance / 3,
    );
    path.lineTo(curveDistance, size.height * 0.29);
    path.quadraticBezierTo(1, (size.height * 0.30) + 10, 0, size.height * 0.4);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
