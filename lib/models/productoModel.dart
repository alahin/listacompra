class ProductoModel {
  final int id;
  final String title;

  ProductoModel({
    this.id,
    this.title,
  });

  factory ProductoModel.fromJson(Map<String, dynamic> map) {
    return ProductoModel(
      id: map['id'],
      title: map['title'],
    );
  }

  Map<String, dynamic> toJsonAdd() => {
        "id": id,
        "title": title,
      };
}
