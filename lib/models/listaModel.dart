class ListaModel {
  final int id;
  final String name;
  final int createdAt;
  final int updatedAt;

  ListaModel({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
  });

  factory ListaModel.fromJson(Map<String, dynamic> json) {
    return ListaModel(
      id: json['id'],
      name: json['name'] as String,
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJsonAdd() => {
        "name": name,
      };
}
