import 'dart:convert';
import 'package:listacompra/models/listaModel.dart';
import 'package:http/http.dart' as http;
import 'package:listacompra/constants/constants.dart' as Constants;

class ListaService {
  Future<String> add(ListaModel listaModel) async {
    final response = await http.post(
      Constants.URI_LISTAS,
      body: listaModel.toJsonAdd(),
    );
    if (response.statusCode == 200) {
      print(response.body);
      return response.body;
    } else {
      return "Error";
    }
  }

  Future<List<ListaModel>> getAll() async {
    final response = await http.get(Constants.URI_LISTAS);
    if (response.statusCode == 200) {
      return listFromJson(response.body);
    } else {
      return List<ListaModel>();
    }
  }

  List<ListaModel> listFromJson(String jsonString) {
    final data = json.decode(jsonString);
    return List<ListaModel>.from(
      data.map((item) => ListaModel.fromJson(item)),
    );
  }
}
