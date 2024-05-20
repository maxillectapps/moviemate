import 'package:flutter/material.dart';
import 'package:movie_mate/config/helpers/widget_helper.dart';
import 'package:readmore/readmore.dart';

import '../../../../core/core.dart';

class MultilineText extends StatelessWidget {
  final String text;
  final int trimLines;

  const MultilineText({super.key, required this.text, this.trimLines = 4});

  @override
  Widget build(BuildContext context) {
    return ReadMoreText(
      text,
      preDataTextStyle: getTextTheme(context)
          .bodyMedium!
          .copyWith(color: AppColors.greyTextColor),
      style: const TextStyle(
          fontFamily: 'Lato',
          fontSize: 12,
          color: AppColors.greyTextColor,
          height: 1.5,
          decoration: TextDecoration.none,
          fontWeight: FontWeight.w400),
      trimLines: trimLines,
      trimMode: TrimMode.Length,
      trimCollapsedText: 'Read more',
      trimExpandedText: 'Read less',
      moreStyle: getTextTheme(context)
          .headlineSmall!
          .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
      lessStyle: getTextTheme(context)
          .headlineSmall!
          .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
    );
  }
}
