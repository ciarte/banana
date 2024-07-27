import 'package:banana/core/theme/app_pallete.dart';
import 'package:banana/core/widgets/custom_filled_button.dart';
import 'package:banana/core/widgets/textCreatedBy.dart';
import 'package:banana/features/products/domain/entities/product.dart';
import 'package:banana/features/products/presentation/viewmodel/product_viewmodel.dart';
import 'package:flutter/material.dart';

class DetailProduct extends StatelessWidget {
  const DetailProduct({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Padding(
          padding:
              const EdgeInsets.only(top: 0, left: 20, right: 20, bottom: 40),
          child: SizedBox(
              height: double.infinity,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Expanded(child: SizedBox()),
                    Container(
                      width: double.infinity,
                      color: Colors.white,
                      padding: const EdgeInsets.only(
                          left: 25, right: 25, bottom: 10),
                      height: MediaQuery.of(context).size.height / 1.5,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 50),
                              child: Column(
                                children: [
                                  Text(product.title,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 22,
                                          overflow: TextOverflow.ellipsis)),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  TextCreatedBy(product: product.brand),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 5),
                                    child: Container(
                                      height: 120,
                                      constraints: const BoxConstraints(
                                        maxHeight: 80,
                                      ),
                                      child: Text(
                                        product.description,
                                        maxLines: 4,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  TextCreatedBy(product: product.brand),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(right: 30.0),
                                      child: Text(
                                        'Final: USD ${ProductViewmodel.applyDiscount(product.price, product.discountPercentage)}',
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  Container(
                                      margin: const EdgeInsets.only(
                                          top: 16, bottom: 10),
                                      width: double.infinity,
                                      height: 45,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 30),
                                      child: CustomFilledButton(
                                        text: 'Add to cart',
                                        buttonColor:
                                            AppPallete.focusBorderColor,
                                        onPressed: () {},
                                      )),
                                ],
                              ),
                            ),
                          ]),
                    ),
                  ]))),
      Positioned(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 300,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: product.images.length,
            itemBuilder: (context, index) {
              String photoUrl = product.images[index];
              return FadeInImage.assetNetwork(
                placeholder: 'assets/images/banana_back.jpg',
                fadeInDuration: const Duration(milliseconds: 2000),
                image: photoUrl,
                fit: BoxFit.cover,
                imageErrorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.error, size: 50);
                },
              );
            },
          ),
        ),
      ),
    ]);
  }
}
