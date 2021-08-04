import 'package:cheap_food/Controller/buscarProducto.dart';
import 'package:cheap_food/Model/const.dart';
import 'package:flutter/material.dart';

class ListaProductosPage extends StatefulWidget {
  ListaProductosPage({Key? key}) : super(key: key);

  @override
  _ListaProductosPageState createState() => _ListaProductosPageState();
}

class _ListaProductosPageState extends State<ListaProductosPage> {

  @override
  Widget build(BuildContext context, {String texto = 'Busca un producto'}) {

    return FutureBuilder<String>(
        future: buscarCodigoBarras(), // a previously-obtained Future<String> or null
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          List<Widget> children;
          if (snapshot.hasData) {
            children = <Widget>[
              Expanded(
                flex: 1,
                child: Text("Los productos más baratos", style: estiloTextoTitulo,), 
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text('Data: ${snapshot.data}'),
              )
            ];
          } else if (snapshot.hasError) {
            children = <Widget>[
              const Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text('Error: ${snapshot.error}'),
              )
            ];
          } else {
            children = const <Widget>[
              SizedBox(
                child: CircularProgressIndicator(),
                width: 60,
                height: 60,
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text('Buscando productos...'),
              )
            ];
          }
          return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: children,
          );
        },
    );
  }
}

List<Widget> uiListaProductos(){

  return <Widget>[
          Expanded(
            flex: 1,
            child: Text("Los productos más baratos", style: estiloTextoTitulo,), 
          ),
          Expanded(
            flex: 5,
            child: listaDeProductosEs.length > 0
              ? ListView.separated(
                  itemCount: listaDeProductosEs.length,
                  itemBuilder: (BuildContext context, int index) {
                    return listaDeProductosEs.elementAt(index);
                  },
                  separatorBuilder: (BuildContext context, int index) => const Divider(),
                )
              : const Center(child: Text('Busca un producto')),
          ),
        ];

}
