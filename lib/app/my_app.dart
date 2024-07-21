import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'presentation/global/controllers/theme_control.dart';
import 'presentation/global/theme/theme.dart';
import 'presentation/routes/app_routes.dart';
import 'presentation/routes/routes.dart';

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final thememode = ref.watch(themeProvider);
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: MaterialApp(
        title: 'Cat Breeds',
        routes: appRoutes,
        initialRoute: Routes.SPLASH,
        debugShowCheckedModeBanner: false,
        theme: getTheme(thememode),
      ),
    );
  }
}
