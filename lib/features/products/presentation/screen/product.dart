import 'package:banana/features/products/domain/entities/product.dart';
import 'package:banana/features/products/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:banana/features/products/utils/product_utils.dart';
import 'product_detail_page.dart';

class Products extends StatefulWidget {
  const Products({Key? key}) : super(key: key);

  @override
  ProductState createState() => ProductState();
}

class ProductState extends State<Products> {
  List<Product> _products = [];
  bool _isLoading = false;
  String _searchText = '';
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    _fetchProducts();
  }

  Future<void> _fetchProducts() async {
    setState(() {
      _isLoading = true;
    });

    List<Product> products = await ProductUtils.fetchProducts();
    setState(() {
      _products = products;
      _isLoading = false;
    });
  }

  List<Product> getFilteredProducts() {
    return ProductUtils.getFilteredProducts(_products, _searchText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Flutter Challenge 2023',
          textAlign: TextAlign.center,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              focusNode: _searchFocus,
              onTap: () {
                _searchFocus.requestFocus();
              },
              onChanged: (value) {
                setState(() {
                  _searchText = value;
                });
              },
              decoration: const InputDecoration(
                hintText: 'Buscar productos',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          _isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : getFilteredProducts().isEmpty
                  ? Center(
                      child: Text(
                          'No se encontraron resultados para "$_searchText"'),
                    )
                  : Expanded(
                      child: ListView.builder(
                        itemCount: getFilteredProducts().length,
                        itemBuilder: (context, index) {
                          Product product = getFilteredProducts()[index];
                          return ProductCard(
                            product: product,
                            formatPrice: ProductUtils.formatPrice,
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
      ),
    );
  }
}
