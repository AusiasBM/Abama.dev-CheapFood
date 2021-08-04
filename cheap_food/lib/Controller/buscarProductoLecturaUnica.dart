import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ListaP extends StatelessWidget {

  final String documentId;

  ListaP(this.documentId);

  @override
  Widget build(BuildContext context) {

    CollectionReference productos = FirebaseFirestore.instance.collection('productos');
    print(" DOCUMENTO ID: " + this.documentId);

    return FutureBuilder<DocumentSnapshot>(
      future: productos.doc(documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          
          return Text("Full Name: ${snapshot.data!.get(FieldPath(['es']))}");
        }

        return Text("loading");
      },
    );
  }
}