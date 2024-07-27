import 'package:flutter/material.dart';

class ProductImages extends StatelessWidget {
  const ProductImages({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: images.length,
      itemBuilder: (context, index) {
        String photoUrl = images[index];
        return FadeInImage.assetNetwork(
          placeholder: 'assets/images/banana_loading.gif',
          fadeInDuration: const Duration(milliseconds: 1000),
          image: photoUrl,
          fit: BoxFit.cover,
          imageErrorBuilder: (context, error, stackTrace) {
            return const Icon(Icons.error, size: 50);
          },
        );
      },
    );
  }
}
