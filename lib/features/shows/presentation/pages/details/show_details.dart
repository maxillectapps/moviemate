import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:movie_mate/features/shows/data/data.dart';

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
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            AspectRatio(
              aspectRatio: 16 / 9,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  imageUrl: 'https://example.com/spiderman.jpg',
                  fit: BoxFit.cover,
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Spider-Man',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Row(
              children: <Widget>[
                Icon(Icons.timer, size: 16),
                SizedBox(width: 4),
                Text('30 minutes'),
                SizedBox(width: 16),
                Icon(Icons.star, size: 16),
                SizedBox(width: 4),
                Text('6.7 (IMDb)'),
              ],
            ),
            const SizedBox(height: 16),
            const Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Premiered',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('Sept 9, 1967'),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Genre',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('Action, Sci-Fi'),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'Summary',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'First airing on the ABC television network in 1967, the series revolves around the scientific-minded teenager Peter Parker who, after being bitten by a radioactive spider, develops amazing strength and spider-like powers. He decides to become a crime-fighting, costumed superhero; all the while dealing with his personal problems and the insecurities resulting from being a teenager.',
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 8),
            InkWell(
              onTap: () {
                // Implement navigation to a detailed page or action
              },
              child: const Text(
                'Read more..',
                style: TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
