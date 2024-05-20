import 'package:flutter/material.dart';
import 'package:movie_mate/features/shows/presentation/blocs/shows/shows_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_mate/features/shows/presentation/pages/pages.dart';

import 'config/config.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ShowsBloc>(
      create: (context) => ShowsBloc()..add(const GetShowsEvent()),
      child: MaterialApp(
        title: 'Movie Mate',
        debugShowCheckedModeBanner: false,
        theme: appThemeData[AppTheme.DARK],
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: TvShows.routeName,
      ),
    );
  }
}
