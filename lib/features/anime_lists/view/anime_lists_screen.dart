import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:re_anime_app/ui/theme/app_bar_image.dart';

import '../../../ui/ui.dart';

class AnimeListsScreen extends StatefulWidget {
  const AnimeListsScreen({super.key});

  @override
  State<AnimeListsScreen> createState() => _AnimeListsScreenState();
}

class _AnimeListsScreenState extends State<AnimeListsScreen> {
  final CarouselController _carouselController = CarouselController();
  final Cubic customCurves = const Cubic(0.0, 0.0, 0.0, 0.0);
  late String imageAppBar;
  @override
  void initState() {
    imageAppBar = AppBarImage.randomAppBarImage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Scaffold(
      body: RefreshIndicator.adaptive(
        onRefresh: () async {},
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              stretch: true,
              expandedHeight: 200,
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
              child: BaseContainerWidget(
                containerColor: Colors.transparent,
                padding: const EdgeInsets.only(top: 8, right: 8, left: 8),
                child: Text(
                  'Popular anime',
                  style: theme.textTheme.headlineMedium,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: CarouselSlider.builder(
                itemCount: 10,
                itemBuilder: (context, int index, realIndex) {
                  return AnimeCardWidget();
                },
                options: CarouselOptions(
                  viewportFraction: 0.6,
                  aspectRatio: 1,
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
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(
                    20,
                    (index) => SizedBox(
                      width: _size.width / 3,
                      child: AnimeCardWidget(),
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: BaseContainerWidget(
                containerColor: Colors.transparent,
                padding: const EdgeInsets.only(top: 8, right: 8, left: 8),
                child: Text(
                  'Most Ranked',
                  style: theme.textTheme.headlineMedium,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(
                    20,
                    (index) => SizedBox(
                      width: _size.width / 3,
                      child: AnimeCardWidget(),
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: BaseContainerWidget(
                containerColor: Colors.transparent,
                padding: const EdgeInsets.only(top: 8, right: 8, left: 8),
                child: Text(
                  'Movie',
                  style: theme.textTheme.headlineMedium,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(
                    20,
                    (index) => SizedBox(
                      width: _size.width / 3,
                      child: AnimeCardWidget(),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
