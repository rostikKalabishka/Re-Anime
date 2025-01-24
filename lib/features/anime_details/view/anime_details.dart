import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AnimeDetailsScreen extends StatelessWidget {
  const AnimeDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/test_image.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          CustomScrollView(
            slivers: [
              SliverAppBar(
                title: Text('Cowboy beb bob'),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsetsDirectional.symmetric(
                      horizontal: 16, vertical: 16),
                  child: Column(
                    spacing: 16,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          'assets/images/test_image.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text(
                        "Cowboy beb bob",
                        style: theme.textTheme.headlineSmall,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Description",
                          style: theme.textTheme.headlineSmall,
                        ),
                      ),
                      Text(
                        "Description sdfsdf fdsfdsfds fdssfd dfssddsf dfssdfsfd dfsfdssdfdfs fdssfddsf fdssdfdfs dfsdsfdsf dfssdfdfdfs dsfsdffds sdffsdfds dfdfsdfs ",
                        style: theme.textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
