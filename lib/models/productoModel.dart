class ProductoModel {
  final int id;
  final String name;
  final int idLista;

  ProductoModel({this.id, this.name, this.idLista});

  factory ProductoModel.fromJson(Map<String, dynamic> map) {
    return ProductoModel(
      id: map['id'],
      name: map['name'],
      idLista: map['id_lista'],
    );
  }

  Map<String, dynamic> toJsonAdd() => {
        "id": id,
        "name": name,
        "id_lista": idLista,
      };
}
