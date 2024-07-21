import '../modules/profile/view/profile_view.dart';
import '../modules/details/view/details_view.dart';
import '../modules/splash/view/splash_view.dart';
import 'package:flutter/widgets.dart' show BuildContext, Widget;

import '../modules/home/view/home_view.dart';
import '../modules/offline/view/offline_view.dart';
import 'routes.dart';

Map<String, Widget Function(BuildContext)> get appRoutes {
  return {
    Routes.HOME: (_) => const HomeView(),
    Routes.OFFLINE: (_) => const OfflineView(),
    Routes.SPLASH: (_) => const SplashView(),
    Routes.DETAILS: (_) => const DetailsView(),
    Routes.PROFILE: (_) => const ProfileView(),
  };
}
