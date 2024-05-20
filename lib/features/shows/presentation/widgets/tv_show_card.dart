import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_mate/config/helpers/widget_helper.dart';
import 'package:movie_mate/features/shows/data/data.dart';

import '../../../../core/core.dart';
import '../pages/pages.dart';

class TvShowCard extends StatefulWidget {
  final TvShow tvShow;

  const TvShowCard({super.key, required this.tvShow});

  @override
  State<TvShowCard> createState() => _TvShowCardState();
}

class _TvShowCardState extends State<TvShowCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          ShowDetails.routeName,
          arguments: widget.tvShow,
        );
      },
      child: IntrinsicHeight(
        child: Card(
          color: Colors.transparent,
          child: Column(children: [
            //Image Widget Starts
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(20.0)),
              child: CachedNetworkImage(
                imageUrl: widget.tvShow.show?.image?.medium ?? '',
                placeholder: (context, url) {
                  return const Center(
                    child: CupertinoActivityIndicator(),
                  );
                },
                errorWidget: (context, url, error) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 50),
                    child: Icon(
                      Icons.image,
                      size: 50,
                    ),
                  );
                },
              ),
            ),
            //Image Widget Ends

            //Text Widget Starts
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Row(
                children: [
                  Flexible(
                    fit: FlexFit.tight,
                    child: Text(
                      widget.tvShow.show?.name ?? '',
                      maxLines: 1,
                      style: getTextTheme(context).headlineMedium,
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    child: Text(
                      '(${widget.tvShow.show?.premiered?.year.toString() ?? 'N/A'})',
                      style: getTextTheme(context)
                          .headlineMedium!
                          .copyWith(color: AppColors.greyTextColor),
                    ),
                  ),
                ],
              ),
            ),
            //Text
          ]),
        ),
      ),
    );
  }
}
