import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:re_anime_app/blocs/settings_cubit/settings_cubit.dart';
import 'package:re_anime_app/router/router.dart';
import 'package:re_anime_app/ui/ui.dart';
import '../model/onboarding_model.dart';

@RoutePage()
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late final PageController _pageController;
  int _currentIndex = 0;
  final List<OnboardingModel> arr = OnboardingModel.onboardingList;
  double _formOpacity = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _formOpacity = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: AnimatedOpacity(
          opacity: _formOpacity,
          duration: Duration(milliseconds: 1000),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: arr.length,
                  onPageChanged: (index) {
                    setState(() => _currentIndex = index);
                  },
                  itemBuilder: (context, index) {
                    return BaseContainerWidget(
                      containerColor: Colors.transparent,
                      margin:
                          EdgeInsets.symmetric(vertical: 32, horizontal: 32),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          LottieBuilder.asset(
                            arr[index].image,
                            height: 300,
                          ),
                          SizedBox(height: 20),
                          Text(
                            arr[index].title,
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          Text(
                            arr[index].description,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                          SizedBox(height: 50),
                          index == arr.length - 1
                              ? Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 8),
                                  child: BaseButtonWidget(
                                    onPressed: () {
                                      context
                                          .read<SettingsCubit>()
                                          .setOnboardingShown();
                                      AutoRouter.of(context).pushAndPopUntil(
                                          RegistrationRoute(),
                                          predicate: (route) => false);
                                    },
                                    child: Text(
                                      'Get Started',
                                      style: theme.textTheme.titleMedium,
                                    ),
                                  ),
                                )
                              : SizedBox.shrink()
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(arr.length, (index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    width: _currentIndex == index ? 12 : 8,
                    height: _currentIndex == index ? 12 : 8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentIndex == index
                          ? AppColors.primaryColors
                          : Colors.grey,
                    ),
                  );
                }),
              ),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
