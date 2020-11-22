import 'dart:convert';
import 'package:listacompra/models/productoModel.dart';
import 'package:http/http.dart' as http;
import 'package:listacompra/constants/constants.dart' as Constants;

class ProductoService {
  Future<String> add(ProductoModel model) async {
    final response = await http.post(
      Constants.URI_PRODUCTOS,
      body: model.toJsonAdd(),
    );
    if (response.statusCode == 200) {
      print(response.body);
      return response.body;
    } else {
      return "Error";
    }
  }

  Future<List<ProductoModel>> getAll() async {
    final response = await http.get(Constants.URI_PRODUCTOS);
    if (response.statusCode == 200) {
      return listFromJson(response.body);
    } else {
      return List<ProductoModel>();
    }
  }

  List<ProductoModel> listFromJson(String jsonString) {
    final data = json.decode(jsonString);
    return List<ProductoModel>.from(
      data.map((item) => ProductoModel.fromJson(item)),
    );
  }
}
