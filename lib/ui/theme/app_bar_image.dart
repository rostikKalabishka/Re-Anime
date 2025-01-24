import 'dart:math';

abstract class AppBarImage {
  static const List<String> appBarImageList = [
    'assets/gif/1.gif',
    'assets/gif/2.gif',
    'assets/gif/3.gif',
    'assets/gif/4.gif',
    'assets/gif/5.gif'
  ];

  static String randomAppBarImage() {
    var random = Random().nextInt(appBarImageList.length);
    return appBarImageList[random];
  }
}
