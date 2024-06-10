import 'package:cinemapedia/presentation/providers/movies/movies_providers.dart';
import 'package:cinemapedia/presentation/providers/movies/movies_slideshow_provider.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomBottomNavigation(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();

    ref.read(nowPlayinMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final nowPlayingMovies = ref.watch(nowPlayinMoviesProvider);
    final slideShowsMovie = ref.watch(movieSlideshowProvider);
    final popularMovies = ref.watch(popularMoviesProvider);

    return CustomScrollView(slivers: [
      const SliverAppBar(
        floating: true,
        flexibleSpace: FlexibleSpaceBar(
          title: CustomAppbar(),
        ),
      ),
      SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
        return Column(
          children: [
            // const CustomAppbar(),

            MovieSlideshow(movies: slideShowsMovie),

            MovieHorizontalListView(
              movies: nowPlayingMovies,
              title: 'En cines',
              // subTitle: 'Viernes 07',
              loadNextPage: () {
                ref.read(nowPlayinMoviesProvider.notifier).loadNextPage();
              },
            ),

            MovieHorizontalListView(
              movies: nowPlayingMovies,
              title: 'Próximamente',
              subTitle: 'En este mes',
              loadNextPage: () {
                ref.read(nowPlayinMoviesProvider.notifier).loadNextPage();
              },
            ),

            MovieHorizontalListView(
              movies: popularMovies,
              title: 'Populares',
              // subTitle: 'En este mes',
              loadNextPage: () {
                ref.read(popularMoviesProvider.notifier).loadNextPage();
              },
            ),

            MovieHorizontalListView(
              movies: nowPlayingMovies,
              title: 'Mejor Calificadas',
              subTitle: 'Desde siempre',
              loadNextPage: () {
                ref.read(nowPlayinMoviesProvider.notifier).loadNextPage();
              },
            ),

            const SizedBox(
              height: 10,
            )

            // Expanded(
            //   child: ListView.builder(
            //     itemCount: nowPlayingMovies.length,
            //     itemBuilder: (context, index) {
            //       final movie = nowPlayingMovies[index];
            //       return ListTile(
            //         title: Text(movie.title),
            //       );
            //     },
            //   ),
            // )
          ],
        );
      }, childCount: 1))
    ]);
  }
}
