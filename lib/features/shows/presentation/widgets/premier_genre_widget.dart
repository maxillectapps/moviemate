import 'package:flutter/material.dart';
import 'package:movie_mate/config/helpers/widget_helper.dart';

import '../../../../core/core.dart';

class PremiereAndGenreWidget extends StatelessWidget {
  const PremiereAndGenreWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: Colors.transparent,
      borderOnForeground: true,
      child: Padding(
        padding:
            const EdgeInsets.symmetric(vertical: AppConstants.verticalPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Premiered',
                  style: getTextTheme(context).headlineMedium!.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                ),
                verticalSpacing(8),
                Text(
                  'Sept 9, 1967',
                  style: getTextTheme(context).bodyLarge!.copyWith(
                      fontWeight: FontWeight.w400,
                      color: AppColors.greyTextColor),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Genre',
                  style: getTextTheme(context).headlineMedium!.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                ),
                verticalSpacing(8),
                Row(
                  children: [
                    const GenreChip(label: 'Action'),
                    horizontalSpacing(8),
                    const GenreChip(label: 'Sci-Fi'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class GenreChip extends StatelessWidget {
  final String label;

  const GenreChip({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(colors: [
            Colors.white.withOpacity(0.25),
            Colors.white.withOpacity(0.5),
          ])),
      child: Text(
        label,
        style: getTextTheme(context).bodyLarge!.copyWith(),
      ),
    );
  }
}
