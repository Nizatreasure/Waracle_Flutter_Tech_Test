class CakeModel {
  const CakeModel({
    this.title,
    this.description,
    this.image,
  });

  final String? title;
  final String? description;
  final String? image;

  factory CakeModel.fromJson(Map<String, dynamic> json) {
    return CakeModel(
      title: json['title'],
      description: json['desc'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'desc': description,
      'image': image,
    };
  }
}
