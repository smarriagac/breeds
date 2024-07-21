import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

import '../../../../../domain/models/breeds/breeds.dart';
import '../../../../global/extensions/build_context_ext.dart';
import '../../../../global/widgets/error_image_card.dart';
import '../../../home/utils/get_image_url.dart';

class DetailsCatHeader extends StatelessWidget {
  const DetailsCatHeader({
    super.key,
    required this.cat,
  });

  final Breeds cat;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: ValueKey(cat.referenceImageId),
      child: Stack(
        children: [
          AspectRatio(
            aspectRatio: 16 / 13,
            child: ExtendedImage.network(
              getImageUrl(cat.referenceImageId?.trim() ?? ''),
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
              loadStateChanged: (state) {
                final status = state.extendedImageLoadState;
                return {
                  LoadState.failed: const ErrorCatImage(),
                }[status];
              },
            ),
          ),
          Positioned(
            left: 0,
            bottom: 0,
            right: 0,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black45,
                    Colors.black,
                  ],
                ),
              ),
              padding: const EdgeInsets.all(15).copyWith(
                top: 25,
              ),
              child: Text(
                cat.name,
                style: context.textTheme.titleLarge!.copyWith(
                  color: const Color(0xffcde5ff),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
