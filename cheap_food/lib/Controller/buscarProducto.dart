import 'package:cloud_firestore/cloud_firestore.dart';



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
            print(doc.get(FieldPath(['es'])));
          });
        });
}