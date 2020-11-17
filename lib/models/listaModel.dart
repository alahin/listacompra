class ListaModel {
  final int id;
  final String name;

  ListaModel({
    this.id,
    this.name,
  });

  factory ListaModel.fromJson(Map<String, dynamic> json) {
    return ListaModel(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJsonAdd() => {
        "name": name,
      };
}
