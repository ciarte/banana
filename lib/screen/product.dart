import 'package:banana/model/product_model.dart';
import 'package:banana/service/api_services.dart';
import 'package:flutter/material.dart';

class Products extends StatefulWidget {
  const Products({Key? key}) : super(key: key);

  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Products> {
  List<Product> _products = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchProducts();
  }

  Future<void> _fetchProducts() async {
    setState(() {
      _isLoading = true;
    });

    try {
      List<Product> products = await ApiService.fetchProductList();
      setState(() {
        _products = products;
        _isLoading = false;
      });
    } catch (e) {
      print('Error: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _products.length,
              itemBuilder: (context, index) {
                Product product = _products[index];
                return Container(
                  height: 120,
                  child: Card(
                    child: ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(product.title,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                          Text('USD: ${product.price.toStringAsFixed(2)}'),
                        ],
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(product.brand),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(product.description, style: TextStyle()),
                        ],
                      ),
                      onTap: () {},
                    ),
                  ),
                );
              },
            ),
    );
  }
}
