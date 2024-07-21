import 'package:flutter/material.dart';

class OfflineView extends StatelessWidget {
  const OfflineView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/error_conection.png'),
      ),
    );
  }
}
