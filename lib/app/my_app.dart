import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'presentation/global/controllers/theme_control.dart';
import 'presentation/global/theme/theme.dart';
import 'presentation/routes/app_routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.initialRoute,
    this.appRoutesA,
  });
  final String initialRoute;
  final Map<String, WidgetBuilder>? appRoutesA;

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = context.watch();
    return GestureDetector(
      onTap: () =>
          FocusManager.instance.primaryFocus?.unfocus(), // coverage:ignore-line
      child: MaterialApp(
        title: 'Cats',
        routes: appRoutesA ?? appRoutes,
        initialRoute: initialRoute,
        debugShowCheckedModeBanner: false,
        theme: getTheme(themeController.darkMode),
      ),
    );
  }
}
