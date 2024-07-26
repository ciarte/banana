import 'package:banana/features/products/data/model/productdb_model.dart';
import 'package:banana/features/products/domain/entities/category.dart';

Category categoryDBtoEntity(CategoryDB categoryDB) {
  switch (categoryDB) {
    case CategoryDB.BEAUTY:
      return Category.BEAUTY;
    case CategoryDB.FRAGRANCES:
      return Category.FRAGRANCES;
    case CategoryDB.FURNITURE:
      return Category.FURNITURE;
    case CategoryDB.GROCERIES:
      return Category.GROCERIES;
    default:
      throw Exception('Unknown CategoryDB');
  }
}
