class FashionModel {
  final String fashionTitle;
  List<FashionData>? fashionList;
  FashionModel({
    required this.fashionTitle,
    this.fashionList,
  });
}

class FashionData {
  final String id;
  final String name;
  final String svgPath;

  FashionData({
    required this.id,
    required this.name,
    required this.svgPath,
  });
}
