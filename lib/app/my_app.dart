import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'presentation/global/controllers/theme_control.dart';
import 'presentation/global/theme/theme.dart';
import 'presentation/routes/app_routes.dart';
import 'presentation/routes/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = context.watch();
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: MaterialApp(
        title: 'Cats',
        routes: appRoutes,
        initialRoute: Routes.SPLASH,
        debugShowCheckedModeBanner: false,
        theme: getTheme(themeController.darkMode),
      ),
    );
  }
}
