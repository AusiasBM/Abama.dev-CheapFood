import 'package:cheap_food/Model/const.dart';
import 'package:cheap_food/View/listProductsPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import 'Controller/buscarProductoLecturaUnica.dart';
import 'View/homePage.dart';
import 'View/infoPage.dart';
 
// Main es el primer método al que se llama para iniciar la app
void main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(); // Inicializa FlutterFire, Se tiene que completar antes de que se inicialize la app

    // Runapp es el método que arranca la app
    runApp( MaterialApp( // Utilizamos MaterialApp como Widget principal, el cual contendrá a todos los otros
      title: 'Cheap Food',  // Le ponemos un título a la app
      debugShowCheckedModeBanner: false, // Quitamos la barra de debug
      routes: { // Y creamos las rutas, las cuales servirán para menearnos entre páginas
        'home' : (context) => MyApp(),
        'listaProductos' : (context) => ListaProductosPage(),
        'infoPage' : (context) => InfoPage(),
      },
      home: MyApp() // En home se le pone el Widget de la página principal
      ),
    );
}
 
// ignore: must_be_immutable
class MyApp extends StatefulWidget {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  static String barcodeScanRes = "";

  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  int _page = 0;
  
  List<Widget> _pageOptions = <Widget>[
    HomePage(),
    ListaP(barcodeScanRes), //ListaProductosPage(),
    InfoPage(),
  ];

  @override
  void initState() {
    super.initState();
  }

  Future<void> startBarcodeScanStream() async {
    FlutterBarcodeScanner.getBarcodeStreamReceiver(
            '#ff6666', 'Cancelar', true, ScanMode.BARCODE)!
        .listen((barcode) => print(barcode));
  }


  Future<void> scanBarcodeNormal() async {

    try {
      await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancelar', true, ScanMode.BARCODE).then((value) => {
            barcodeScanRes = value,
            _bottomNavigationKey.currentState!.setPage(1),
            
          }
        );
      //print(barcodeScanRes);
      //_bottomNavigationKey.currentState!.setPage(1);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    if (!mounted) return;

    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: _pageOptions.elementAt(_page),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: colorAccentuado,
          onPressed: () => scanBarcodeNormal()
          , 
          elevation: 5.0,
          child: Icon(Icons.qr_code_rounded, size: 30.0,),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: 0,
          height: 60.0,
          items: <Widget>[
            Icon(Icons.home, size: 30),
            Icon(Icons.list, size: 30),
            Icon(Icons.info, size: 30),
          ],
          color: Colors.white,
          buttonBackgroundColor: Colors.white,
          backgroundColor: colorAccentuado,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          onTap: (index) => {
              setState(() {
                _page = index;
              })
          },
          letIndexChange: (index) => true,
        ),
      );
  }

}