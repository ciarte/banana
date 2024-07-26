import 'package:banana/features/products/data/model/productdb_model.dart';
import 'package:banana/features/products/domain/entities/product.dart';
import 'package:banana/features/products/domain/mappers/category_mapper.dart';
import 'package:banana/features/products/domain/mappers/dimension_mapper.dart';

class ProductMapper {
  static Product productDBtoEntity(ProductDB productDb) => Product(
      id: productDb.id,
      title: productDb.title,
      category: categoryDBtoEntity(productDb.category),
      thumbnail: productDb.thumbnail,
      brand: productDb.brand,
      description: productDb.description,
      dimensions: dimensionsDBtoEntity(productDb.dimensions),
      discountPercentage: productDb.discountPercentage,
      images: productDb.images,
      price: productDb.price,
      rating: productDb.rating,
      tags: productDb.tags,
      shippingInformation: productDb.shippingInformation,
      sku: productDb.sku,
      warrantyInformation: productDb.warrantyInformation,
      weight: productDb.weight,
      stock: productDb.stock);
}
