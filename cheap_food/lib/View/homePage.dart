import 'package:cheap_food/Model/const.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class HomePage extends StatelessWidget{

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
       child: callToAction(context),
    );
  }

  Widget callToAction(BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: RichText(
        text: TextSpan(
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: tamanoPantalla(context, "h") / 9,
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
            TextSpan(text: "Tus productos al mejor precio."),
          ],
        ),
      )
    );
  }



}


