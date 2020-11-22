import 'package:flutter/material.dart';
import 'package:listacompra/models/listaModel.dart';
import 'package:listacompra/service/listaService.dart';
import 'package:toast/toast.dart';

class AddListPage extends StatefulWidget {
  @override
  _AddListPageState createState() => _AddListPageState();
}

class _AddListPageState extends State<AddListPage> {
  TextEditingController name = TextEditingController();

  addLista(ListaModel listaModel) async {
    await ListaService().add(listaModel);
    Toast.show("Guardado", context, gravity: Toast.CENTER, duration: 2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: name,
              decoration: InputDecoration(
                hintText: 'Nombre',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton(
              onPressed: () {
                if (name.text.isEmpty) {
                  Toast.show(
                    "Este campo es requerido",
                    context,
                    gravity: Toast.CENTER,
                    duration: 2,
                  );
                } else {
                  ListaModel listaModel = ListaModel(
                    name: name.text,
                  );
                  addLista(listaModel);
                  Navigator.pop(context);
                }
              },
              child: Text("Guardar"),
            ),
          ),
        ],
      ),
    );
  }
}
