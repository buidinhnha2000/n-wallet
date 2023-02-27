import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../common/assets/app_assets.dart';
import '../../common/extensions/extensions.dart';
import '../../l10n/l10n.dart';
import '../../theme/app_color.dart';
import '../../theme/color_schemes.dart';
import 'bloc/onboarding_bloc.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryGreen,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: () {
                  final currentSkipPage = context
                      .read<OnBoardingBloc>()
                      .pageController
                      .page
                      ?.toInt();

                  context.read<OnBoardingBloc>().pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.ease);
                },
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                ),
                child: Text(
                  context.l10n.text_skip,
                  style: context.textTheme.titleMedium?.copyWith(
                      fontSize: 17,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      backgroundColor: Colors.transparent),
                ),
              ),
            ),
            Expanded(
              child: BlocBuilder<OnBoardingBloc, OnBoardingState>(
                builder: (context, state) {
                  return PageView.builder(
                    controller: context.read<OnBoardingBloc>().pageController,
                    itemCount: onBoardData.length,
                    onPageChanged: (pageIndex) =>
                        context.read<OnBoardingBloc>().add(
                              PageIndexChanged(pageIndex),
                            ),
                    itemBuilder: (context, index) => OnBoardingContent(
                      image: onBoardData[index].image,
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(
                    onBoardData.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: 4),
                      child: BlocBuilder<OnBoardingBloc, OnBoardingState>(
                        builder: (context, state) {
                          return DotIndicator(
                            isActive: index == state.page,
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 250.0,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32.0),
                      topRight: Radius.circular(32.0))),
              child: BlocBuilder<OnBoardingBloc, OnBoardingState>(
                builder: (context, state) {
                  return Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            onBoardData[state.page].title,
                            textAlign: TextAlign.center,
                            style: context.textTheme.titleLarge?.copyWith(
                              fontSize: 26,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Text(
                          onBoardData[state.page].desc,
                          textAlign: TextAlign.center,
                          style: context.textTheme.bodyText1
                              ?.copyWith(fontSize: 18, color: Colors.black26),
                        ),
                        const Spacer(),
                        ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.buttonNeonGreen,
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                            ),
                            child: Text(
                              context.l10n.text_next,
                              style: context.textTheme.bodyText1?.copyWith(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700),
                            ))
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    Key? key,
    this.isActive = false,
  }) : super(key: key);
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: isActive ? 12 : 4,
      width: 4,
      decoration: BoxDecoration(
          color: isActive
              ? lightColorScheme.primary
              : lightColorScheme.primary.withOpacity(0.4),
          borderRadius: const BorderRadius.all(Radius.circular(12))),
    );
  }
}

class OnBoardingContent extends StatelessWidget {
  OnBoardingContent({Key? key, required this.image}) : super(key: key);
  String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(image),
      ],
    );
  }
}

final List<OnBoarding> onBoardData = [
  OnBoarding(
      title: 'Fastest Payment',
      desc:
          'QR code scanning technology makes your payment process more faster',
      image: AppAssets.imageQRScan),
  OnBoarding(
      title: 'Safest Platform',
      desc: 'Multiple verification and face ID makes your account more safely',
      image: AppAssets.imageFaceID),
  OnBoarding(
      title: 'Pay Anything',
      desc: 'Supports many types of payments and pay without being complicated',
      image: AppAssets.imageShoppingItems)
];

class OnBoarding {
  final String title;
  final String desc;
  final String image;

  OnBoarding({required this.title, required this.desc, required this.image});
}
