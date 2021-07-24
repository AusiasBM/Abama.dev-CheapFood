import 'package:cheap_food/Model/ItemListProduct.dart';
import 'package:cheap_food/Model/const.dart';
import 'package:flutter/material.dart';

class ListaProductosPage extends StatefulWidget {
  ListaProductosPage({Key key}) : super(key: key);

  @override
  _ListaProductosPageState createState() => _ListaProductosPageState();
}

class _ListaProductosPageState extends State<ListaProductosPage> {

  final List<Widget> entries = <Widget>[itemListProduct("Gomina", "Giorgio", "12.50"), itemListProduct("Gomina", "Giorgio", "12.50"), itemListProduct("Gomina", "Giorgio", "12.50")];
  final List<int> colorCodes = <int>[600, 500, 100];

  @override
  Widget build(BuildContext context, {String texto = 'Busca un producto'}) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Text("Los productos más baratos", style: estiloTextoTitulo,), 
          ),
          Expanded(
            flex: 5,
            child: entries.length > 0
              ? ListView.separated(
                  itemCount: entries.length,
                  itemBuilder: (BuildContext context, int index) {
                    return entries.elementAt(index);
                  },
                  separatorBuilder: (BuildContext context, int index) => const Divider(),
                )
              : const Center(child: Text('Busca un producto')),
          ),
        ],
      ),
    );
  }
}