import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:re_anime_app/features/anime_lists/bloc/anime_lists_bloc.dart';
import 'package:re_anime_app/ui/theme/app_bar_image.dart';

import '../../../ui/ui.dart';

@RoutePage()
class AnimeListsScreen extends StatefulWidget {
  const AnimeListsScreen({super.key});

  @override
  State<AnimeListsScreen> createState() => _AnimeListsScreenState();
}

class _AnimeListsScreenState extends State<AnimeListsScreen> {
  late final CarouselSliderController _carouselController;
  final Cubic customCurves = const Cubic(0.0, 0.0, 0.0, 0.0);
  late String imageAppBar;
  @override
  void initState() {
    _carouselController = CarouselSliderController();
    imageAppBar = AppBarImage.randomAppBarImage();
    //context.read<AnimeListsBloc>().add(LoadAnimeListEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return BlocBuilder<AnimeListsBloc, AnimeListsState>(
      builder: (context, state) {
        if (state is AnimeListsLoaded) {
          return Scaffold(
            body: RefreshIndicator.adaptive(
              onRefresh: () async {},
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    stretch: true,
                    expandedHeight: 250,
                    flexibleSpace: FlexibleSpaceBar(
                      stretchModes: [StretchMode.blurBackground],
                      background: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.asset(
                            imageAppBar,
                            fit: BoxFit.cover,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  theme.brightness == Brightness.dark
                                      ? Colors.black87
                                      : Colors.white,
                                  Colors.transparent,
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                      child: BaseContainerWidget(
                        containerColor: theme.scaffoldBackgroundColor,
                        padding:
                            const EdgeInsets.only(top: 8, right: 8, left: 8),
                        child: Text(
                          'Currently airing',
                          style: theme.textTheme.headlineMedium,
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: CarouselSlider.builder(
                      carouselController: _carouselController,
                      itemCount: state.seasonNowAnimeList.length,
                      itemBuilder: (context, int index, realIndex) {
                        return AnimeCardWidget(
                          anime: state.seasonNowAnimeList[index],
                        );
                      },
                      options: CarouselOptions(
                        viewportFraction: 0.6,
                        aspectRatio: 1.2,
                        enlargeCenterPage: true,
                        autoPlay: true,
                        autoPlayAnimationDuration: const Duration(seconds: 5),
                        autoPlayCurve: customCurves,
                        scrollPhysics: const BouncingScrollPhysics(),
                        pauseAutoPlayOnTouch: false,
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: BaseContainerWidget(
                      containerColor: Colors.transparent,
                      padding: const EdgeInsets.only(top: 8, right: 8, left: 8),
                      child: Text(
                        'Coming soon',
                        style: theme.textTheme.headlineMedium,
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height / 4,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.upComingAnimeList.length,
                        itemBuilder: (context, index) {
                          return AspectRatio(
                            aspectRatio: 3 / 4,
                            child: AnimeCardWidget(
                              anime: state.upComingAnimeList[index],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: BaseContainerWidget(
                      containerColor: Colors.transparent,
                      padding: const EdgeInsets.only(top: 8, right: 8, left: 8),
                      child: Text(
                        'Popular',
                        style: theme.textTheme.headlineMedium,
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height / 4,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.popularAnimeList.length,
                        itemBuilder: (context, index) {
                          return AspectRatio(
                            aspectRatio: 3 / 4,
                            child: AnimeCardWidget(
                              anime: state.popularAnimeList[index],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: BaseContainerWidget(
                      containerColor: Colors.transparent,
                      padding: const EdgeInsets.only(top: 8, right: 8, left: 8),
                      child: Text(
                        'Top movie',
                        style: theme.textTheme.headlineMedium,
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height / 4,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.movieAnimeList.length,
                        itemBuilder: (context, index) {
                          return AspectRatio(
                            aspectRatio: 3 / 4,
                            child: AnimeCardWidget(
                              anime: state.movieAnimeList[index],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else if (state is AnimeListsFailure) {
          return Scaffold(
            body: Center(
              child: Text(state.error.toString()),
            ),
          );
        }
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator.adaptive(),
          ),
        );
      },
    );
  }
}
