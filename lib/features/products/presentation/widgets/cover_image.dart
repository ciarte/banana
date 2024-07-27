import 'package:flutter/material.dart';
import 'package:banana/core/core.dart';

class CoverImage extends StatelessWidget {
  const CoverImage({
    super.key,
    required this.imageUrl,
    required this.infoText,
  });

  final String imageUrl;
  final String infoText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(color: AppPallete.borderColor, blurRadius: 10),
        ],
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                } else {
                  return const SizedBox(
                    height: 120,
                    width: 120,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              },
              errorBuilder: (context, error, stackTrace) {
                return const SizedBox(
                  height: 180,
                  width: 120,
                  child: Center(
                    child: Icon(Icons.error, size: 50),
                  ),
                );
              },
              height: 120,
              width: 120,
              imageUrl,
              filterQuality: FilterQuality.medium,
              fit: BoxFit.contain,
            ),
          ),
          Text(infoText)
        ],
      ),
    );
  }
}
