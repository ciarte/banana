import 'package:banana/features/products/data/model/dimension_model.dart';
import 'package:banana/features/products/data/model/meta_model.dart';
import 'package:banana/features/products/data/model/review_model.dart';

class BananaProducts {
  final List<ProductDB> products;
  final int total;
  final int skip;
  final int limit;

  BananaProducts({
    required this.products,
    required this.total,
    required this.skip,
    required this.limit,
  });

  BananaProducts copyWith({
    List<ProductDB>? products,
    int? total,
    int? skip,
    int? limit,
  }) =>
      BananaProducts(
        products: products ?? this.products,
        total: total ?? this.total,
        skip: skip ?? this.skip,
        limit: limit ?? this.limit,
      );

  factory BananaProducts.fromJson(Map<String, dynamic> json) => BananaProducts(
        products: List<ProductDB>.from(
            json["products"].map((x) => ProductDB.fromJson(x))),
        total: json["total"],
        skip: json["skip"],
        limit: json["limit"],
      );

  Map<String, dynamic> toJson() => {
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
        "total": total,
        "skip": skip,
        "limit": limit,
      };
}

class ProductDB {
  final int id;
  final String title;
  final String description;
  final CategoryDB category;
  final double price;
  final double discountPercentage;
  final double rating;
  final int stock;
  final List<String> tags;
  final String brand;
  final String sku;
  final int weight;
  final DimensionsDB dimensions;
  final String warrantyInformation;
  final String shippingInformation;
  final AvailabilityStatus availabilityStatus;
  final List<ReviewDB> reviews;
  final ReturnPolicy returnPolicy;
  final int minimumOrderQuantity;
  final MetaDB meta;
  final List<String> images;
  final String thumbnail;

  ProductDB({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.tags,
    required this.brand,
    required this.sku,
    required this.weight,
    required this.dimensions,
    required this.warrantyInformation,
    required this.shippingInformation,
    required this.availabilityStatus,
    required this.reviews,
    required this.returnPolicy,
    required this.minimumOrderQuantity,
    required this.meta,
    required this.images,
    required this.thumbnail,
  });

  ProductDB copyWith({
    int? id,
    String? title,
    String? description,
    CategoryDB? category,
    double? price,
    double? discountPercentage,
    double? rating,
    int? stock,
    List<String>? tags,
    String? brand,
    String? sku,
    int? weight,
    DimensionsDB? dimensions,
    String? warrantyInformation,
    String? shippingInformation,
    AvailabilityStatus? availabilityStatus,
    List<ReviewDB>? reviews,
    ReturnPolicy? returnPolicy,
    int? minimumOrderQuantity,
    MetaDB? meta,
    List<String>? images,
    String? thumbnail,
  }) =>
      ProductDB(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        category: category ?? this.category,
        price: price ?? this.price,
        discountPercentage: discountPercentage ?? this.discountPercentage,
        rating: rating ?? this.rating,
        stock: stock ?? this.stock,
        tags: tags ?? this.tags,
        brand: brand ?? this.brand,
        sku: sku ?? this.sku,
        weight: weight ?? this.weight,
        dimensions: dimensions ?? this.dimensions,
        warrantyInformation: warrantyInformation ?? this.warrantyInformation,
        shippingInformation: shippingInformation ?? this.shippingInformation,
        availabilityStatus: availabilityStatus ?? this.availabilityStatus,
        reviews: reviews ?? this.reviews,
        returnPolicy: returnPolicy ?? this.returnPolicy,
        minimumOrderQuantity: minimumOrderQuantity ?? this.minimumOrderQuantity,
        meta: meta ?? this.meta,
        images: images ?? this.images,
        thumbnail: thumbnail ?? this.thumbnail,
      );

  factory ProductDB.fromJson(Map<String, dynamic> json) => ProductDB(
        id: json["id"] ?? 0,
        title: json["title"] ?? '',
        description: json["description"] ?? '',
        category: categoryValues.map[json["category"]] ?? CategoryDB.FURNITURE,
        price: (json["price"] ?? 0).toDouble(),
        discountPercentage: (json["discountPercentage"] ?? 0).toDouble(),
        rating: (json["rating"] ?? 0).toDouble(),
        stock: json["stock"] ?? 0,
        tags: List<String>.from(json["tags"]?.map((x) => x) ?? []),
        brand: json["brand"] ?? '',
        sku: json["sku"] ?? '',
        weight: json["weight"] ?? 0,
        dimensions: DimensionsDB.fromJson(json["dimensions"] ?? {}),
        warrantyInformation: json["warrantyInformation"] ?? '',
        shippingInformation: json["shippingInformation"] ?? '',
        availabilityStatus:
            availabilityStatusValues.map[json["availabilityStatus"]] ??
                AvailabilityStatus.LOW_STOCK,
        reviews: List<ReviewDB>.from(
            json["reviews"]?.map((x) => ReviewDB.fromJson(x)) ?? []),
        returnPolicy: returnPolicyValues.map[json["returnPolicy"]] ??
            ReturnPolicy.NO_RETURN_POLICY,
        minimumOrderQuantity: json["minimumOrderQuantity"] ?? 0,
        meta: MetaDB.fromJson(json["meta"] ?? {}),
        images: List<String>.from(json["images"]?.map((x) => x) ?? []),
        thumbnail: json["thumbnail"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "category": categoryValues.reverse[category],
        "price": price,
        "discountPercentage": discountPercentage,
        "rating": rating,
        "stock": stock,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "brand": brand,
        "sku": sku,
        "weight": weight,
        "dimensions": dimensions.toJson(),
        "warrantyInformation": warrantyInformation,
        "shippingInformation": shippingInformation,
        "availabilityStatus":
            availabilityStatusValues.reverse[availabilityStatus],
        "reviews": List<dynamic>.from(reviews.map((x) => x.toJson())),
        "returnPolicy": returnPolicyValues.reverse[returnPolicy],
        "minimumOrderQuantity": minimumOrderQuantity,
        "meta": meta.toJson(),
        "images": List<dynamic>.from(images.map((x) => x)),
        "thumbnail": thumbnail,
      };
}

enum AvailabilityStatus { IN_STOCK, LOW_STOCK }

final availabilityStatusValues = EnumValues({
  "In Stock": AvailabilityStatus.IN_STOCK,
  "Low Stock": AvailabilityStatus.LOW_STOCK
});

enum CategoryDB { BEAUTY, FRAGRANCES, FURNITURE, GROCERIES }

final categoryValues = EnumValues({
  "beauty": CategoryDB.BEAUTY,
  "fragrances": CategoryDB.FRAGRANCES,
  "furniture": CategoryDB.FURNITURE,
  "groceries": CategoryDB.GROCERIES
});

enum ReturnPolicy {
  NO_RETURN_POLICY,
  THE_30_DAYS_RETURN_POLICY,
  THE_60_DAYS_RETURN_POLICY,
  THE_7_DAYS_RETURN_POLICY,
  THE_90_DAYS_RETURN_POLICY
}

final returnPolicyValues = EnumValues({
  "No return policy": ReturnPolicy.NO_RETURN_POLICY,
  "30 days return policy": ReturnPolicy.THE_30_DAYS_RETURN_POLICY,
  "60 days return policy": ReturnPolicy.THE_60_DAYS_RETURN_POLICY,
  "7 days return policy": ReturnPolicy.THE_7_DAYS_RETURN_POLICY,
  "90 days return policy": ReturnPolicy.THE_90_DAYS_RETURN_POLICY
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
