import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:re_anime_app/features/search/bloc/search_anime_bloc.dart';
import 'package:re_anime_app/features/search/widgets/widgets.dart';
import 'package:re_anime_app/router/router.dart';
import 'package:re_anime_app/ui/ui.dart';

@RoutePage()
class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  Future<void> _onRefresh(BuildContext context) async {
    final text = searchController.text.trim();
    if (text.isNotEmpty) {
      context.read<SearchAnimeBloc>().add(SearchAnimeQueryEvent(query: text));
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent ==
          _scrollController.offset) {
        context.read<SearchAnimeBloc>().add(SearchAnimeLoadNextPageEvent());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(32),
                    bottomRight: Radius.circular(32),
                  ),
                ),
                pinned: true,
                backgroundColor: theme.cardColor,
                title: Text(
                  'Search',
                  style: theme.textTheme.headlineSmall,
                ),
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(80),
                  child: BaseContainerWidget(
                    containerColor: Colors.transparent,
                    child: BaseTextFieldWidget(
                      onChanged: (text) {
                        if (text.isNotEmpty) {
                          context
                              .read<SearchAnimeBloc>()
                              .add(SearchAnimeQueryEvent(query: text));
                        }
                      },
                      controller: searchController,
                      icon: Icon(Icons.search),
                      hintText: 'Search',
                      suffixIcon: IconButton(
                          onPressed: () {
                            searchController.clear();
                          },
                          icon: Icon(Icons.clear)),
                    ),
                  ),
                ),
              ),
            ];
          },
          body: BlocBuilder<SearchAnimeBloc, SearchAnimeState>(
              builder: (context, state) {
            if (state is SearchAnimeLoaded) {
              return RefreshIndicator.adaptive(
                onRefresh: () async {
                  _onRefresh(context);
                },
                child: ListView.builder(
                  controller: _scrollController,
                  padding: EdgeInsets.zero,
                  itemCount: state.animeList.length + 1,
                  itemBuilder: (context, index) {
                    if (index < state.animeList.length) {
                      return InkWell(
                        borderRadius: BorderRadius.circular(16),
                        child: GestureDetector(
                          onTap: () {
                            AutoRouter.of(context).push(AnimeDetailsRoute(
                                id: state.animeList[index].malId));
                          },
                          child: SearchCardWidget(
                            anime: state.animeList[index],
                          ),
                        ),
                      );
                    } else {
                      return const Padding(
                        padding: EdgeInsets.symmetric(vertical: 32),
                        child:
                            Center(child: CircularProgressIndicator.adaptive()),
                      );
                    }
                  },
                ),
              );
            } else if (state is SearchAnimeFailure) {
              return Center(
                child: Text(state.error.toString()),
              );
            } else if (state is SearchAnimeLoading) {
              return Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }
            return Center(
              child: Text(
                'Looking for something? Type it in the search bar!',
                textAlign: TextAlign.center,
                style: theme.textTheme.titleMedium,
              ),
            );
          }),
        ),
      ),
    );
  }
}
