import 'package:banana/features/products/data/model/dimension_model.dart';
import 'package:banana/features/products/domain/entities/dimension.dart';

Dimensions dimensionsDBtoEntity(DimensionsDB dimensionsDB) {
  return Dimensions(
    width: dimensionsDB.width,
    height: dimensionsDB.height,
    depth: dimensionsDB.depth,
  );
}
