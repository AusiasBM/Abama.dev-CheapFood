import 'package:cheap_food/Model/const.dart';
import 'package:cheap_food/View/listProductsPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import 'Controller/buscarProducto.dart';
import 'View/homePage.dart';
import 'View/infoPage.dart';
 
void main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();

    runApp( MaterialApp(
      title: 'Cheap Food',
      debugShowCheckedModeBanner: false,
      routes: {
        'home' : (context) => MyApp(),
        'listaProductos' : (context) => ListaProductosPage(),
        'infoPage' : (context) => InfoPage(),
      },
      home: MyApp()
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

  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  int _page = 0;
  
  List<Widget> _pageOptions = <Widget>[
    HomePage(),
    ListaProductosPage(),
    InfoPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _page = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          colorPrimario.toString(), 'Cancelar', false, ScanMode.BARCODE);
      print(barcodeScanRes);
      buscarCodigoBarras(barcodeScanRes);
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
          onPressed: () => {
            scanBarcodeNormal()
          }, 
          elevation: 5.0,
          child: Icon(Icons.qr_code_rounded, size: 30.0,),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: 0,
          height: 60.0,
          items: <Widget>[
            Icon(Icons.add, size: 30),
            Icon(Icons.list, size: 30),
            Icon(Icons.compare_arrows, size: 30),
            Icon(Icons.call_split, size: 30),
            Icon(Icons.perm_identity, size: 30),
          ],
          color: Colors.white,
          buttonBackgroundColor: Colors.white,
          backgroundColor: Colors.blueAccent,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          onTap: (index) => {
            _onItemTapped(index)
            },
          letIndexChange: (index) => true,
        ),
      );
  }

}