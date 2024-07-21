import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../routes/routes.dart';
import '../controller/home_controller.dart';
import 'widgets/list_card_cat.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController beers = context.watch();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Row(
          children: [
            Image.asset(
              'assets/logo.png',
              height: 40,
              width: 40,
            ),
            const SizedBox(width: 20),
            const Text('Cat Breeds'),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(
              context,
              Routes.PROFILE,
            ),
            icon: const Icon(
              Icons.person,
            ),
          ),
        ],
      ),
      body: AnimatedSwitcher(
        duration: const Duration(seconds: 2),
        transitionBuilder: (child, animation) => FadeTransition(
          opacity: animation,
          child: child,
        ),
        child: beers.state.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          failed: () => const Center(child: Icon(Icons.close)),
          loaded: (homepageState) => ListCardCats(
            homeState: homepageState,
          ),
        ),
      ),
    );
  }
}
