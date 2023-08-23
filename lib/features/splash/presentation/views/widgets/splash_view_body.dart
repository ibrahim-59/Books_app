import 'package:clean/core/utils/app_router.dart';
import 'package:clean/core/utils/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingText;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );
    slidingText = Tween<Offset>(begin: const Offset(0, 2), end: Offset.zero)
        .animate(animationController);

    navigateToHomePage();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(AssetsManager.logo),
        const SizedBox(
          height: 4,
        ),
        AnimatedBuilder(
            animation: slidingText,
            builder: (context, _) {
              return SlideTransition(
                position: slidingText,
                child: const Text(
                  'Read Free Books',
                  textAlign: TextAlign.center,
                ),
              );
            })
      ],
    );
  }

  void navigateToHomePage() {
    Future.delayed(const Duration(seconds: 2), () {
      // Get.to(() => const HomeView(),
      //     transition: Transition.fade, duration: kTransactionDuration);
      GoRouter.of(context).push(AppRouter.kHomeView);
    });
  }
}
