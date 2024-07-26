class DimensionsDB {
  final double width;
  final double height;
  final double depth;

  DimensionsDB({
    required this.width,
    required this.height,
    required this.depth,
  });

  DimensionsDB copyWith({
    double? width,
    double? height,
    double? depth,
  }) =>
      DimensionsDB(
        width: width ?? this.width,
        height: height ?? this.height,
        depth: depth ?? this.depth,
      );

  factory DimensionsDB.fromJson(Map<String, dynamic> json) => DimensionsDB(
        width: json["width"]?.toDouble(),
        height: json["height"]?.toDouble(),
        depth: json["depth"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "width": width,
        "height": height,
        "depth": depth,
      };
}
