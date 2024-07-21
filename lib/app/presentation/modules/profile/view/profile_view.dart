import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../global/controllers/theme_control.dart';
import '../../../global/extensions/build_context_ext.dart';

class ProfileView extends ConsumerWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              SwitchListTile(
                title: const Text('Dark Mode'),
                value: context.darkMode,
                onChanged: ref.read(themeProvider.notifier).onChange,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
