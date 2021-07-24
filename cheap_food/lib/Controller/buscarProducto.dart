import 'package:cheap_food/Model/const.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



void buscarCodigoBarras(dynamic codigo) {
  String es;
  FirebaseFirestore.instance
    .collection('productos')
    .doc(codigo)
    .get()
    .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        try {
          print('Document data: ${documentSnapshot.get(FieldPath(['es']))}');
          es = documentSnapshot.get(FieldPath(['es'])) + "";
          buscarProductosEs(es);
        } catch(e) {
          print('No nested field exists!');
        }
      } else {
        print('Document does not exist on the database');
      }
  });
}

void buscarProductosEs(String es){
          FirebaseFirestore.instance
        .collection('productos')
        .where('es', isEqualTo: es)
        .get()
        .then((QuerySnapshot querySnapshot) {
          print("DOCUMENTOS CON EL MISMO ES");
          querySnapshot.docs.forEach((doc) {
            print(doc.data());
          });
        });
}

Widget listaProductos(){
  return SizedBox.expand(
      child: DraggableScrollableSheet(
        builder: (BuildContext context, ScrollController scrollController) {
          return Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                gradient: LinearGradient(
                    colors: [
                      colorSecundario,
                      colorPrimario, 
                    ]
                )
              ),
              child: ListView.builder(
                controller: scrollController,
                itemCount: 1,
                itemBuilder: (BuildContext context, int index) {
                  return Text("hola pepito la flor");
                },
              ),
          );
        },
      ),
    );
}