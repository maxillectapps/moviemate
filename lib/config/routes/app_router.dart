import 'package:flutter/material.dart';
import 'package:movie_mate/features/shows/presentation/pages/pages.dart';

import '../../features/shows/data/data.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case TvShows.routeName:
        return TvShows.route();
      case ShowDetails.routeName:
        return ShowDetails.route(tvShow: settings.arguments as TvShow);
      default:
        return defaultRoute();
    }
  }

  static Route defaultRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(title: const Text('Movie Mate')),
              body: const Center(child: Text('Undefined Route')),
            ));
  }
}
