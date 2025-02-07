import 'package:flutter/material.dart';

import '../../../../inject_repositories.dart';
import '../../../global/extensions/build_context_ext.dart';
import '../../../routes/routes.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _init();
    });
  }

  Future<void> _init() async {
    final routeName = await () async {
      final connectivityRepository = Repositories.connectivity;
      final hasInternet = connectivityRepository.hasInternet;
      if (!hasInternet) {
        return Routes.OFFLINE;
      }
      return Routes.HOME;
    }();

    if (mounted) {
      Navigator.pushReplacementNamed(context, routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        key: UniqueKey(),
        duration: const Duration(seconds: 2),
        switchInCurve: Curves.elasticInOut,
        transitionBuilder: (child, animation) {
          return ScaleTransition(
            scale: animation,
            child: child,
          );
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 150,
                height: 150,
                child: Image.asset('assets/logo.png'),
              ),
              const SizedBox(height: 20),
              Text(
                'Cat Breeds',
                style: context.textTheme.titleLarge!.copyWith(fontSize: 48),
              )
            ],
          ),
        ),
      ),
    );
  }
}
