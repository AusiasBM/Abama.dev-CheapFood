import 'package:cheap_food/const.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.start,
         children: [
          Expanded(
            flex: 1,
            child: navBar(),
          ),
          Expanded(
            flex: 3,
            child: callToAction(),
          ),
          Expanded(
            flex: 5,
            child: descripcion(),
          )
         ],
       ),
    );
  }

  // Widget para la barra superior
  Widget navBar(){
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton(
            onPressed: () => {}, 
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }

  Widget callToAction(){
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: RichText(
        text: TextSpan(
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 45.0,
            fontWeight: FontWeight.w600,
          ),
          children: <TextSpan>[
            TextSpan(
              text: "Cheap Food\n",
              style: GoogleFonts.poppins(
                color: colorAccentuado,
                fontWeight: FontWeight.w700,
              ), 
            ),
            TextSpan(text: "Tus productos al mejor precio"),
          ],
        ),
      )
    );
  }

  Widget descripcion(){
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          gradient: LinearGradient(
              colors: [
                colorSecundario,
                colorPrimario, 
              ])),
      )
    );
  }
}
