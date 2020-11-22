import 'package:flutter/material.dart';
import 'package:listacompra/models/listaModel.dart';
import 'package:listacompra/service/listaService.dart';
import 'package:listacompra/ui/addListPage.dart';
import 'package:intl/intl.dart';
import 'detailsListPage.dart';
import 'package:toast/toast.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ListaModel> listasList;
  bool loading = true;
  final df = new DateFormat('dd-MM-yyyy hh:mm');

  getAllListas() async {
    listasList = await ListaService().getAll();
    setState(() {
      loading = false;
    });
  }

  deleteLista(int id) async {
    await ListaService().deleteLista(id);
    Toast.show("Eliminado", context, gravity: Toast.CENTER, duration: 2);
    getAllListas();
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
                  builder: (context) => AddListPage(),
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
                /*ListaModel lista = listasList[index];
                  return ListTile(
                    title: Text(lista.name),
                    subtitle: Text(df.format(
                        new DateTime.fromMillisecondsSinceEpoch(
                            lista.updatedAt))),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsListPage(),
                        ),
                      ).then((value) => getAllListas());
                    },
                  );*/
                return new InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsListPage(),
                      ),
                    ).then((value) => getAllListas());
                  },
                  child: Container(
                    height: 50.0,
                    decoration: BoxDecoration(),
                    child: new Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(
                            left: 15.0,
                            right: 15.0,
                          ),
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              new Container(
                                child: Text(
                                  listasList[index].name,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 18.0),
                                  maxLines: 1,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10.0),
                                    topRight: Radius.circular(10.0),
                                  ),
                                ),
                              ),
                              new IconButton(
                                  splashColor: Colors.red,
                                  icon: Icon(Icons.delete),
                                  onPressed: () {
                                    deleteLista(listasList[index].id);
                                  }),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            left: 15.0,
                            right: 15.0,
                            top: 0.0,
                          ),
                          child: Container(
                            color: Colors.black,
                            height: 0.2,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
