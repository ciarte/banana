import 'package:flutter/material.dart';
import 'package:banana/core/core.dart';
import 'package:banana/features/products/domain/entities/product.dart';
import 'package:banana/features/products/presentation/widgets/widgets.dart';

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
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextCreatedBy(product: product.brand),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  ProductDescription(
                                      description: product.description,
                                      title: product.title),
                                  ProductTags(productTags: product.tags),
                                  ProductTotalPrice(
                                    price: product.price,
                                    discountPercentage:
                                        product.discountPercentage,
                                  ),
                                  ProductRating(productRating: product.rating),
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
          child: ProductImages(images: product.images),
        ),
      ),
    ]);
  }
}
