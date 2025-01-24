import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:re_anime_app/features/search/widgets/widgets.dart';
import 'package:re_anime_app/ui/ui.dart';

@RoutePage()
class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final searchController = TextEditingController();

  Future<void> _onRefresh() async {}

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
                title: Text('Search'),
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(80),
                  child: BaseContainerWidget(
                    containerColor: Colors.transparent,
                    child: BaseTextFieldWidget(
                      controller: searchController,
                      icon: Icon(Icons.search),
                      hintText: 'Search',
                    ),
                  ),
                ),
              ),
            ];
          },
          body: RefreshIndicator.adaptive(
            onRefresh: _onRefresh,
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: 10,
              itemBuilder: (context, index) {
                return InkWell(
                  borderRadius: BorderRadius.circular(16),
                  child: SearchCardWidget(),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
