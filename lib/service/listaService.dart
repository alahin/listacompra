import 'dart:convert';

import 'package:listacompra/models/listaModel.dart';
import 'package:http/http.dart' as http;

class ListaService {
  static const PATH = "http://192.168.1.42:8181/api/listas/";
  static const ADD_LISTA_URL = PATH;
  static const GET_LISTAS_URL = PATH;

  Future<String> addLista(ListaModel listaModel) async {
    final response = await http.post(
      ADD_LISTA_URL,
      body: listaModel.toJsonAdd(),
    );
    if (response.statusCode == 200) {
      print(response.body);
      return response.body;
    } else {
      return "Error";
    }
  }

  Future<List<ListaModel>> getAllListas() async {
    final response = await http.get(GET_LISTAS_URL);
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
