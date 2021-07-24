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
  MyApp({Key key}) : super(key: key);

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  //String _scanBarcode = 'Unknown';

  @override
  void initState() {
    super.initState();
  }

  Future<void> startBarcodeScanStream() async {
    FlutterBarcodeScanner.getBarcodeStreamReceiver(
            '#ff6666', 'Cancelar', false, ScanMode.BARCODE)
        .listen((barcode) => {
          buscarCodigoBarras(barcode),
          showDialog(
            context: context,
            builder: (_) => _buildAlertDialog(),
          )
            
        });
  }

  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancelar', false, ScanMode.BARCODE);
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

    int _page = 0;
    GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: 0,
          height: 60.0,
          color: Colors.white,
          buttonBackgroundColor: colorPrimario,
          backgroundColor: colorAccentuado,
          animationCurve: Curves.fastOutSlowIn,
          animationDuration: Duration(milliseconds: 600),
          items: <Widget>[
            Icon(Icons.home, size: 30),
            Icon(Icons.list, size: 30),
            Icon(Icons.info, size: 30),
          ],
          onTap: (index) {
            print(index);
            _page = index;
          },
          letIndexChange: (index) => true,
        ),
        body: SafeArea(
          child: _page == 0 ? HomePage() : { _page == 1 ? ListaProductosPage() :  InfoPage() }
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: colorAccentuado,
          onPressed: () => {
            scanBarcodeNormal()
            //startBarcodeScanStream()
          }, 
          elevation: 5.0,
          child: Icon(Icons.qr_code_rounded, size: 30.0,),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      );
  }

  Widget _buildAlertDialog() {
      return AlertDialog(
        title: Text('Notificaciones'),
        content:
            Text("¿Desea recibir notificaciones? Serán muy pocas de verdad :)"),
        actions: [
          TextButton(
              child: Text("Aceptar"),
              onPressed: () {
                Navigator.of(context).pop();
              }),

          TextButton(
              child: Text("Cancelar"),
              onPressed: () {
                Navigator.of(context).pop();
              }),
        ],
      );
    }

}