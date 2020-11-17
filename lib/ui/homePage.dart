import 'package:flutter/material.dart';
import 'package:listacompra/ui/addEditListPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
              );
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          /*FittedBox(
            child: Image.asset(
              'assets/images/background.jpg',
            ),
            fit: BoxFit.fill,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return null;
                      }),
                    );
                  },
                  color: Colors.lightBlue,
                  textColor: Colors.white70,
                  child: Text(
                    'Crear',
                  ),
                ),
              ],
            ),
          ),*/
        ],
      ),
    );
  }

  /*Future getData() async {
    //var url = 'http://127.0.0.1:8181/api/v1/users/';
    var url = 'http://10.0.2.2:8181/api/users/';
    http.Response response = await http.get(url);
    var data = jsonDecode(response.body);
    print(data.toString());
  }

  @override
  void initState() {
    super.initState();
    getData();
  }*/
}
