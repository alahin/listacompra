import 'package:flutter/material.dart';
import 'package:listacompra/models/listaModel.dart';
import 'package:listacompra/service/listaService.dart';
import 'package:listacompra/ui/addEditListPage.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ListaModel> listasList;
  bool loading = true;
  final df = new DateFormat('dd-MM-yyyy hh:mm');

  getAllListas() async {
    listasList = await ListaService().getAllListas();
    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getAllListas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Lista de compra"),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddEditListPage(),
                  ),
                ).then((value) => getAllListas());
              },
              icon: Icon(Icons.add),
            ),
          ],
        ),
        body: loading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: listasList.length,
                itemBuilder: (context, index) {
                  ListaModel lista = listasList[index];
                  return ListTile(
                    title: Text(lista.name),
                    subtitle: Text(
                      df.format(
                        new DateTime.fromMillisecondsSinceEpoch(
                            lista.updatedAt),
                      ),
                    ),
                    onTap: () {},
                  );
                },
              ));
  }
}
