import 'package:banana/features/products/domain/entities/product.dart';
import 'package:flutter/material.dart';

class DetailProduct extends StatelessWidget {
  const DetailProduct({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: product.images.length,
            itemBuilder: (context, index) {
              String photoUrl = product.images[index];
              return Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 8,
                ),
                child: FadeInImage.assetNetwork(
                  placeholder: 'assets/loading.gif',
                  fadeInDuration: const Duration(milliseconds: 2700),
                  image: photoUrl,
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 16),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 24),
              child: Text(
                product.description,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 24),
              child: Text(
                'Price: USD ${product.price.toStringAsFixed(2)}',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        Expanded(child: Container()),
        Container(
          margin: const EdgeInsets.only(top: 16, bottom: 24),
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: ElevatedButtonTheme(
            data: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                elevation: 3,
              ),
            ),
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Agregar al carrito'),
            ),
          ),
        )
      ],
    );
  }
}
