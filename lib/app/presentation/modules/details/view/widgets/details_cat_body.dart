import 'package:flutter/material.dart';

import '../../../../../domain/models/breeds/breeds.dart';
import '../../../../global/extensions/build_context_ext.dart';

class DetailCatBody extends StatelessWidget {
  const DetailCatBody({
    super.key,
    required this.cat,
  });

  final Breeds cat;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scrollbar(
        thickness: 5,
        thumbVisibility: true,
        trackVisibility: true,
        scrollbarOrientation: ScrollbarOrientation.right,
        child: ListView(
          padding: const EdgeInsets.all(20),
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cat.description,
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 10),
            ItemsDescription(
              title: 'Life expectancy (Years)',
              description: cat.lifeSpan,
            ),
            const SizedBox(height: 10),
            ItemsDescription(
              title: 'Origin',
              description: cat.origin,
            ),
            const SizedBox(height: 10),
            ItemsDescription(
              title: 'Intelligence',
              description: cat.intelligence.toString(),
            ),
            const SizedBox(height: 10),
            ItemsDescription(
              title: 'Alt. Names',
              description: cat.altNames!.isEmpty ? 'N/A' : cat.altNames!,
            ),
            const SizedBox(height: 10),
            ItemsDescription(
              title: 'Temperament',
              description: cat.temperament,
            ),
            const SizedBox(height: 10),
            ItemsDescription(
              title: 'Adaptability',
              description: cat.adaptability.toString(),
            ),
            const SizedBox(height: 10),
            ItemsDescription(
              title: 'More datas',
              description: cat.wikipediaUrl.toString(),
            ),
            const SizedBox(height: 10),
            ItemsDescription(
              title: 'Grooming',
              description: cat.grooming.toString(),
            ),
            const SizedBox(height: 10),
            ItemsDescription(
              title: 'Hypoallergenic',
              description: cat.hypoallergenic.toString(),
            ),
            const SizedBox(height: 10),
            ItemsDescription(
              title: 'Natural',
              description: cat.natural.toString(),
            ),
            const SizedBox(height: 10),
            ItemsDescription(
              title: 'Suppressed Tail',
              description: cat.suppressedTail.toString(),
            ),
            const SizedBox(height: 10),
            ItemsDescription(
              title: 'Energy Level',
              description: cat.energyLevel.toString(),
            ),
            const SizedBox(height: 10),
            ItemsDescription(
              title: 'Adaptability',
              description: cat.adaptability.toString(),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemsDescription extends StatelessWidget {
  const ItemsDescription({
    super.key,
    this.title = 'Title',
    this.description = 'Description',
  });
  final String title;
  final String description;
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: '$title: ',
        children: [
          TextSpan(
            text: description,
            style: context.textTheme.bodyMedium!.copyWith(
              fontSize: 16,
            ),
          ),
        ],
      ),
      style: context.textTheme.titleMedium!.copyWith(fontSize: 18),
    );
  }
}
