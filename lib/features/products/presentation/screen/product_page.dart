import 'package:banana/core/widgets/custom_app_bar.dart';
import 'package:banana/features/products/domain/entities/product.dart';
import 'package:banana/features/products/presentation/screen/screens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:banana/features/products/presentation/provider/product_provider.dart';
import 'package:banana/features/products/presentation/viewmodel/product_viewmodel.dart';
import 'package:banana/features/products/presentation/widgets/product_card.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      print('Scroll Position: ${_scrollController.position.pixels}');
      print('Scroll Position: ${_scrollController.position.pixels + 400}');
      print('Scroll Position: ${_scrollController.position.maxScrollExtent}');
      print(
          'Scroll func: ${_scrollController.position.pixels + 400 >= _scrollController.position.maxScrollExtent}');

      if ((_scrollController.position.pixels + 400) >=
          _scrollController.position.maxScrollExtent) {
        _loadNextPage();
      }
    });
  }

  void _loadNextPage() {
    final provider = Provider.of<ProductProvider>(context, listen: false);
    if (!provider.isFetching) {
      print(provider.isFetching);
      provider.refresh();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const CustomAppBar(),
      ),
      body: Consumer<ProductProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return Column(
            children: [
              provider.getFilteredProducts().isEmpty
                  ? Center(
                      child: Text(
                          'No se encontraron resultados para "${provider.searchText}"'))
                  : Expanded(
                      child: ListView.builder(
                        controller: _scrollController,
                        itemCount: provider.products.length,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          Product product = provider.products[index];
                          return ProductCard(
                            product: product,
                            formatPrice: ProductViewmodel.formatPrice,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductDetailPage(
                                      id: product.id.toString()),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
            ],
          );
        },
      ),
    );
  }
}
