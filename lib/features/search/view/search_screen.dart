// ignore_for_file: public_member_api_docs, sort_constructors_first
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
                          onChangeTextFiled(text, context);
                        },
                        controller: searchController,
                        icon: Icon(Icons.search),
                        hintText: 'Search',
                        suffixIcon: IconButton(
                          onPressed: _clearTextFiled,
                          icon: Icon(Icons.clear),
                        ),
                      )),
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
                child: state.animeList.isNotEmpty
                    ? ListView.builder(
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
                          } else if (state.loadNextPage) {
                            return const Padding(
                              padding: EdgeInsets.symmetric(vertical: 32),
                              child: Center(
                                  child: CircularProgressIndicator.adaptive()),
                            );
                          }
                        },
                      )
                    : DefaultTextWidget(
                        text: 'There is no response to your request',
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
            return DefaultTextWidget(
              text: 'Looking for something? Type it in the search bar!',
            );
          }),
        ),
      ),
    );
  }

  void onChangeTextFiled(String text, BuildContext context) {
    final trimmedText = text.trim();

    if (trimmedText.isEmpty) {
      context.read<SearchAnimeBloc>().add(SearchAnimeClearEvent());
    } else {
      context
          .read<SearchAnimeBloc>()
          .add(SearchAnimeQueryEvent(query: trimmedText));
    }
  }

  void _clearTextFiled() {
    if (searchController.text.isEmpty) return;
    searchController.clear();

    context.read<SearchAnimeBloc>().add(SearchAnimeClearEvent());
  }
}
