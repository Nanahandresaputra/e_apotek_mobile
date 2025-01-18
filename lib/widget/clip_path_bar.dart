import 'package:flutter/material.dart';

class WaveClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double curveHeight = size.height / 1.45;
    var p = Path()
      ..lineTo(0, size.height)
      ..quadraticBezierTo(0, curveHeight, curveHeight, curveHeight)
      ..lineTo(size.width - curveHeight, curveHeight)
      ..quadraticBezierTo(size.width, curveHeight, size.width, size.height)
      ..lineTo(size.width, 0);

    return p;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class ClipPathBar extends StatelessWidget {
  final String? title;
  const ClipPathBar({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: WaveClip(),
      child: Container(
        height: 200,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(24),
        color: const Color(0xFF58BDBD),
        child: Text(
          '$title',
          style: const TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }
}
