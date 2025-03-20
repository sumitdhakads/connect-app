import 'dart:ui';

import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  Color? color;
  CustomDivider({super.key,this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 1,
      decoration: BoxDecoration(
        color: color ?? Color(0xFFE2E2E2),
      ),
    );
  }
}
