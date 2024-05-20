import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_mate/config/helpers/widget_helper.dart';
import 'package:movie_mate/features/shows/data/data.dart' hide Image;
import 'package:readmore/readmore.dart';

import '../../../../../core/core.dart';
import '../../widgets/widgets.dart';

class ShowDetails extends StatelessWidget {
  static const String routeName = '/show_details';

  static Route route({required TvShow tvShow}) {
    return MaterialPageRoute<void>(
        builder: (_) => ShowDetails(
              tvShow: tvShow,
            ));
  }

  final TvShow tvShow;

  const ShowDetails({super.key, required this.tvShow});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Top Banners Starts Here
          SizedBox(
            height: getScreenSize(context).height * 0.33,
            child: Stack(
              children: [
                AspectRatio(
                  aspectRatio: 1.5,
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: tvShow.show?.image?.original ?? '',
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
                Align(
                  alignment: Alignment.center,
                  child: Image.asset('assets/images/play_detail.png'),
                ),
                Positioned(
                    top: 32,
                    left: 24,
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        )))
              ],
            ),
          ),
          //Top Banners Ends Here

          //Show Details Starts Here
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.horizontalPadding,
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                tvShow.show?.name ?? '',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              verticalSpacing(12),
              Row(
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.timer_rounded,
                        size: 14,
                        color: AppColors.greyTextColor,
                      ),
                      horizontalSpacing(5),
                      Text(
                        '${tvShow.show?.runtime.toString()} minutes' ??
                            '0 minutes',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: AppColors.greyTextColor),
                      ),
                    ],
                  ),
                  horizontalSpacing(30),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        size: 14,
                        color: AppColors.greyTextColor,
                      ),
                      horizontalSpacing(5),
                      Text(
                        '${tvShow.show?.rating?.average.toString()} (IMDb)' ??
                            '0.0 (IMDb)',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: AppColors.greyTextColor,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
              const PremiereAndGenreWidget(),
              Text(
                'Summary',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              verticalSpacing(12),
              MultilineText(text: tvShow.show?.summary ?? '', trimLines: 5),
            ]),
          )
        ],
      ),
    );
  }
}
