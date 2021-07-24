import 'package:flutter/material.dart';

class ListaProductos {

  List<Widget> _productosRelacionados;

  ListaProductos();

  int getLenghtListaProductos(){
    return _productosRelacionados.length;
  }

}