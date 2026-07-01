import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogoWidget extends StatelessWidget {
  final double size;
  const LogoWidget({this.size = 120, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/icon_helm.svg',
      width: size,
      height: size,
      fit: BoxFit.contain,
    );
  }
}
