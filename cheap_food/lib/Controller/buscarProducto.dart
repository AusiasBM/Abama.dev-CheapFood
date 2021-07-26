import 'package:cheap_food/Model/const.dart';
import 'package:cheap_food/Model/itemListProduct.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



Future<String> buscarCodigoBarras() {

  String es;
  
  if(barcodeScanRes != ""){

    FirebaseFirestore.instance
      .collection('productos')
      .doc(barcodeScanRes)
      .get()
      .then((DocumentSnapshot documentSnapshot) {
        if (documentSnapshot.exists) {
          try {
            print('Datos del documento: ${documentSnapshot.get(FieldPath(['es']))}');
            es = documentSnapshot.get(FieldPath(['es'])) + "";
            return buscarProductosEs(es);
          } catch(e) {
            print('No existe ningún campo anidado!');
            return 'No existe ningún campo anidado!';
          }
        } else {
          print('El documento no existe en la base de datos');
          return 'El documento no existe en la base de datos';
        }
    });

  }
  
  return Future<String>.delayed(
    const Duration(seconds: 1),
    () => 'Consulta tu código de barras',
  );
  

}

Future<String> buscarProductosEs(String es){
  
  FirebaseFirestore.instance
    .collection('productos')
    .where('es', isEqualTo: es)
    .get()
    .then((QuerySnapshot querySnapshot) {
      if (querySnapshot.docs.isNotEmpty) {
        print("DOCUMENTOS CON EL MISMO ES");
        querySnapshot.docs.forEach((doc) {
          print(doc.get(FieldPath(['es'])));
          listaDeProductosEs.add(itemListProduct(doc.get(FieldPath(['es'])), doc.get(FieldPath(['marca'])), doc.get(FieldPath(['precio']))));
        });
        return 'hecho';
      }else{
        return 'No existe';
      }

    });

  return Future<String>.delayed(
    const Duration(seconds: 0),
    () => 'Consulta tu código de barras',
  );
}