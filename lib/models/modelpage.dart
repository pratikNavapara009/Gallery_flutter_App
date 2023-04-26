class ImageModel {
  String? category;

  ImageModel({
    required this.category,
  });

  factory ImageModel.fromMap(Map data) {
    return ImageModel(
      category: data['category'],
    );
  }
}

class Light {
  bool isDark;

  Light({
    required this.isDark,
  });
}
