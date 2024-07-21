import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

import '../../../../../domain/models/breeds/breeds.dart';
import '../../../../global/extensions/build_context_ext.dart';
import '../../../../global/widgets/error_image_card.dart';
import '../../utils/get_image_url.dart';

class CardCat extends StatelessWidget {
  const CardCat({
    super.key,
    required this.cats,
  });

  final Breeds cats;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          children: [
            Positioned.fill(
              child: Hero(
                tag: ValueKey(cats.referenceImageId),
                child: ExtendedImage.network(
                  getImageUrl(cats.referenceImageId?.trim() ?? ''),
                  fit: BoxFit.cover,
                  headers: const {'Access-Control-Allow-Origin': '*'},
                  handleLoadingProgress: true,
                  loadStateChanged: (state) {
                    final status = state.extendedImageLoadState;
                    return {
                      LoadState.failed: const ErrorCatImage(),
                    }[status];
                  },
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(15).copyWith(bottom: 10),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    end: Alignment.topCenter,
                    begin: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black45,
                      Colors.black,
                    ],
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      cats.name,
                      style: context.textTheme.titleLarge!.copyWith(
                        color: const Color(0xffcde5ff),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          'Mas',
                          style: context.textTheme.labelMedium!.copyWith(
                            color: const Color(0xffcde5ff),
                          ),
                        ),
                        const Icon(
                          Icons.arrow_right_rounded,
                          size: 45,
                          color: Colors.white,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              top: 80,
              child: Container(
                padding: const EdgeInsets.all(15).copyWith(bottom: 10),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    end: Alignment.bottomCenter,
                    begin: Alignment.topCenter,
                    stops: [
                      0.2,
                      0.8,
                      1,
                    ],
                    colors: [
                      Colors.transparent,
                      Colors.black45,
                      Colors.black,
                    ],
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      cats.origin,
                      style: context.textTheme.labelLarge!.copyWith(
                        color: const Color(0xffcde5ff),
                      ),
                    ),
                    Column(
                      // crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'intelligence',
                          style: context.textTheme.labelSmall!.copyWith(
                            color: const Color(0xffcde5ff),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            SizedBox(
                              width: 40,
                              height: 40,
                              child: CircularProgressIndicator(
                                value: (cats.intelligence / 5).clamp(0.0, 1.0),
                                // color: context.color.secondaryContainer,
                              ),
                            ),
                            Text(
                              cats.intelligence.toStringAsFixed(1),
                              style: context.textTheme.titleSmall!.copyWith(
                                color: const Color(0xffcde5ff),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
