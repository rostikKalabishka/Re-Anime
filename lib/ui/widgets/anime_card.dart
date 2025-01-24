import 'package:flutter/material.dart';
import 'package:re_anime_app/ui/ui.dart';

class AnimeCardWidget extends StatelessWidget {
  const AnimeCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BaseContainerWidget(
      containerColor: Colors.transparent,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              'assets/images/test_image.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: BaseContainerWidget(
                  containerColor: Colors.black87,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '2017',
                        style: theme.textTheme.bodyLarge
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      Row(children: [
                        Icon(
                          Icons.star,
                          color: AppColors.primaryColors,
                        ),
                        Text(
                          '8.2',
                          style: theme.textTheme.bodyLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ])
                    ],
                  ))),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: BaseContainerWidget(
              borderRadius: BorderRadius.circular(0),
              containerColor: Colors.black54,
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                    'boba sdfdsf dsfsdf dsfdsf dfsdsf dsffds sdffds fsdfds sdfsdf dfsdsf',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodyLarge
                        ?.copyWith(fontWeight: FontWeight.bold)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
