import 'package:re_anime_app/ui/ui.dart';

class OnboardingModel {
  final String description;
  final String title;
  final String image;

  const OnboardingModel(
      {required this.description, required this.title, required this.image});

  static List<OnboardingModel> onboardingList = [
    OnboardingModel(
      title: 'Welcome!',
      description:
          'Discover all the features of our app and make the most of it.',
      image: AppConst.imageOne,
    ),
    OnboardingModel(
      title: 'Seamless Experience',
      description:
          'Our interface is designed for your convenience – fast, simple, and intuitive.',
      image: AppConst.imageTwo,
    ),
    OnboardingModel(
      title: 'Let’s Get Started!',
      description:
          'Create your profile and start using all the features right away.',
      image: AppConst.imageThree,
    ),
  ];
}
