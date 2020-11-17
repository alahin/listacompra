import 'package:listacompra/models/listaModel.dart';
import 'package:http/http.dart' as http;

class ListaService {
  static const ADD_URL = "http://192.168.1.42:8181/api/listas/";

  Future<String> addLista(ListaModel listaModel) async {
    print("addLista before");
    final response = await http.post(
      ADD_URL,
      body: listaModel.toJsonAdd(),
    );
    if (response.statusCode == 200) {
      print("add Response: " + response.body);
      return response.body;
    } else {
      return "Error";
    }
  }
}
