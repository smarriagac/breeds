import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'app/my_app.dart';
import 'app/reposiories.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injectDependencies();
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}
