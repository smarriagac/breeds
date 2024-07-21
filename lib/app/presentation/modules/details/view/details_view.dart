import 'package:flutter/material.dart';

import '../../../../domain/models/breeds/breeds.dart';
import 'widgets/details_cat_body.dart';
import 'widgets/details_cat_header.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cat = ModalRoute.of(context)!.settings.arguments as Breeds;
    // final Breeds breeds;

    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Color(0xffcde5ff)),
      ),
      body: Column(
        children: [
          DetailsCatHeader(cat: cat),
          DetailCatBody(cat: cat),
        ],
      ),
    );
  }
}
