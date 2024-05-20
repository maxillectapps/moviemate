import 'package:flutter/material.dart';

import '../../../../core/core.dart';

class Separator extends StatelessWidget {
  const Separator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16.0),
      height: 5,
      width: 30,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          gradient: const LinearGradient(
              colors: [AppColors.orangeDarkColor, AppColors.orangeLightColor])),
    );
  }
}
