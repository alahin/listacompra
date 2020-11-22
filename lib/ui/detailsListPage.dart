import 'package:flutter/material.dart';
import 'package:listacompra/models/productoModel.dart';
import 'package:listacompra/service/productoService.dart';

class DetailsListPage extends StatefulWidget {
  @override
  _DetailsListPageState createState() => _DetailsListPageState();
}

class _DetailsListPageState extends State<DetailsListPage> {
  List<ProductoModel> productoList;
  bool loading = true;

  getAllProductos() async {
    productoList = await ProductoService().getAll();
    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getAllProductos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Details'),
        ),
        body: loading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: productoList.length,
                itemBuilder: (context, index) {
                  ProductoModel lista = productoList[index];
                  return ListTile(
                    title: Text(lista.name),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsListPage(),
                        ),
                      ).then((value) => getAllProductos());
                    },
                  );
                },
              ));
  }
}
