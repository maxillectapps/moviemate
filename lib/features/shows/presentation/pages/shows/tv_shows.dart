import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:movie_mate/config/helpers/widget_helper.dart';
import 'package:movie_mate/features/shows/presentation/widgets/widgets.dart';

import '../../../../../core/core.dart';
import '../../blocs/shows/shows_bloc.dart';

class TvShows extends StatefulWidget {
  static const String routeName = '/tv_shows';

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const TvShows());
  }

  const TvShows({super.key});

  @override
  State<TvShows> createState() => _TvShowsState();
}

class _TvShowsState extends State<TvShows> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/home.png',
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/play.png'),
            label: 'Shows',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/profile.png'),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.orangeLightColor,
        onTap: _onItemTapped,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.horizontalPadding,
            vertical: AppConstants.verticalPadding),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          verticalSpacing(32.0),
          Text('Find Movies, Tv series,\nand more',
              style: getTextTheme(context).displayLarge!.copyWith(height: 1.5)),
          //Orange Separator between the gridview and heading text
          const Separator(),
          //Gridview and Bloc implementation starts
          BlocBuilder<ShowsBloc, ShowsState>(
            builder: (context, state) {
              if (state is ShowsLoaded) {
                return Expanded(
                  child: MasonryGridView.count(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    mainAxisSpacing: 12.0,
                    crossAxisSpacing: 8.0,
                    itemBuilder: (context, index) {
                      return TvShowCard(
                        tvShow: state.shows![index],
                      );
                    },
                    itemCount: 10,
                  ),
                );
              } else if (state is ShowsLoading) {
                return const Center(
                  child: CupertinoActivityIndicator(),
                );
              }
              return Container();
            },
          )
        ]),
      ),
    );
  }
}
