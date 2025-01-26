import 'package:flutter/material.dart';
import 'package:re_anime_app/ui/ui.dart';
import 'package:re_anime_app/ui/widgets/user_score.dart';

class SearchCardWidget extends StatelessWidget {
  const SearchCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BaseContainerWidget(
      padding: EdgeInsets.all(0),
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset('assets/images/test_image.jpg'),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: BaseContainerWidget(
                  containerColor: Colors.black54,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16)),
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '2017',
                        style: theme.textTheme.bodyLarge
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          // Icon(
                          //   Icons.star,
                          //   color: Colors.yellowAccent,
                          // ),
                          SizedBox(
                            width: 32,
                            height: 32,
                            child: UserScore(
                              percent: 8.2,
                              fillColors: Colors.transparent,
                              lineColor: Colors.green,
                              freeColor: Colors.red,
                              lineWidth: 1,
                              child: const Text(
                                '%',
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                          SizedBox(width: 4), // Отступ между звездой и текстом
                          Text(
                            '8.2',
                            style: theme.textTheme.bodyLarge
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(width: 10),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                spacing: 16,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Name anime sddfsdfds sdfsdf fdsfdssdf dsffdsfsd sdfdsdsfsddsf dfssddfs',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.titleMedium,
                  ),
                  SizedBox(height: 4),
                  Text(
                    'FF dsadaysdyas8dyiasdia8sdtasdasdfdsdfsdfsdf sd sdfsdfsdfsdfdfsd dfsdsfdfs fdsdfssdfdsfdsf dsffsdsdf sdfsfdfsd fdssdffds fsdsdfsfsfsdf fsdfsdfs dfssdfdfssdf  sfdfssd dfsfds ',
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.titleSmall,
                    maxLines: 10,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
